import 'package:cedratools/models/catalog_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

var productInfoViewModel = ChangeNotifierProvider.autoDispose<ProductInfoViewModel>((ref) => ProductInfoViewModel());

class ProductInfoViewModel extends ChangeNotifier {
  int quantity = 0;

  void addQuantity(int availableStack, CatalogProductList product) {
    if (availableStack > quantity) {
      quantity++;
    }
    notifyListeners();
  }

  void removeQuantity(CatalogProductList product) {
    if (quantity > 0) {
      quantity--;
    }
    notifyListeners();
  }
}
