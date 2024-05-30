import 'package:cedratools/models/catalog_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

var cartViewModel = ChangeNotifierProvider((ref) => CartViewModel());

class CartViewModel extends ChangeNotifier {
  List<CatalogProductList> cartList = [];
  List<double> priceList = [];
  double totalPrice = 0;

  void addQuantity(int availableStack, CatalogProductList product) {
    if (product.userSelectedQuantity >= 0 && product.userSelectedQuantity < availableStack) {
      product.userSelectedQuantity++;
      setPrice();
    }

    notifyListeners();
  }

  void removeQuantity(CatalogProductList product) {
    if (product.userSelectedQuantity > 0) {
      product.userSelectedQuantity--;
      setPrice();
    }

    notifyListeners();
  }

  void addToCart(CatalogProductList product, int availableStack, int quantity) {
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
}
