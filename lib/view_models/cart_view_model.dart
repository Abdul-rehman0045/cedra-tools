import 'dart:developer';

import 'package:cedratools/helper/app_routes.dart';
import 'package:cedratools/models/product_response_model.dart';
import 'package:cedratools/models/checkout_response_model.dart';
import 'package:cedratools/models/product_model.dart';
import 'package:cedratools/models/response_model.dart';
import 'package:cedratools/networking/api_paths.dart';
import 'package:cedratools/networking/api_services.dart';
import 'package:cedratools/view_models/loader_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

var cartViewModel = ChangeNotifierProvider((ref) => CartViewModel());

class CartViewModel extends ChangeNotifier {
  CheckoutResponseModel? checkoutObj;
  List<Product> cartList = [];
  List<double> priceList = [];
  double totalPrice = 0;

  void addQuantity(int availableStack, Product product) {
    if (product.userSelectedQuantity >= 0 && product.userSelectedQuantity < availableStack) {
      product.userSelectedQuantity++;
      setPrice();
    }

    notifyListeners();
  }

  void removeQuantity(Product product) {
    if (product.userSelectedQuantity > 0) {
      product.userSelectedQuantity--;
      setPrice();
    }

    notifyListeners();
  }

  void addToCart(Product product, int availableStack, int quantity) {
    product.userSelectedQuantity = quantity;
    if (cartList.contains(product)) {
      product.userSelectedQuantity = quantity;
    }
    if (product.userSelectedQuantity > 0 && product.userSelectedQuantity <= availableStack) {
      if (!cartList.contains(product)) {
        cartList.add(product);
      }
      {
        product.userSelectedQuantity = quantity;
      }
      setPrice();
      notifyListeners();
      print("===added to cart===");
    }
  }

  void removeFromCart(int index) {
    cartList[index].userSelectedQuantity = 0;
    cartList.removeAt(index);
    setPrice();
    notifyListeners();
  }

  void setPrice() {
    priceList.clear();
    totalPrice = 0;
    for (var i = 0; i < cartList.length; i++) {
      double price = double.parse(cartList[i].variants![0].price!);
      double calculatedPrice = (price * cartList[i].userSelectedQuantity).toDouble();
      priceList.add(calculatedPrice);
    }
    for (var i = 0; i < priceList.length; i++) {
      totalPrice = totalPrice + priceList[i];
    }
    print("$totalPrice");
    notifyListeners();
  }

  Future checkout(BuildContext context, WidgetRef ref) async {
    // var map = {
    //   "items": [
    //     {"variant_id": '40417138638897', "quantity": 1}
    //   ]
    // };
    var map = {
      "items": cartList.map((e) {
        return {"variant_id": e.variants![0].id, "quantity": e.userSelectedQuantity};
      }).toList()
    };
    try {
      ref.read(loaderViewModel).showLoader();
      ResponseModel response = await ApiServices.request(ApiPaths.productCheckout, method: RequestMethod.POST, data: map);
      if (response.status == 200) {
        checkoutObj = CheckoutResponseModel.fromJson(response.data);
        Navigator.pushNamed(context, AppRoutes.CHECKOUT_WEB_VIEW, arguments: checkoutObj!.invoiceUrl);
      }
    } catch (e) {
    } finally {
      ref.read(loaderViewModel).hideLoader();
    }
  }

  Future buyNow(BuildContext context, WidgetRef ref, {required Product product, required quantity}) async {
    var map = {
      "items": [
        {"variant_id": '${product.variants![0].id}', "quantity": quantity}
      ]
    };
    
    try {
      ref.read(loaderViewModel).showLoader();
      ResponseModel response = await ApiServices.request(ApiPaths.productCheckout, method: RequestMethod.POST, data: map);
      if (response.status == 200) {
        checkoutObj = CheckoutResponseModel.fromJson(response.data);
        Navigator.pushNamed(context, AppRoutes.CHECKOUT_WEB_VIEW, arguments: checkoutObj!.invoiceUrl);
      }
    } catch (e) {
    } finally {
      ref.read(loaderViewModel).hideLoader();
    }
  }
}
