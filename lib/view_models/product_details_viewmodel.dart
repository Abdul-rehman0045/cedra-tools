import 'package:cedratools/models/product_response_model.dart';
import 'package:cedratools/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

var productDetailsViewModel = ChangeNotifierProvider.autoDispose<ProductDetailsViewModel>((ref) => ProductDetailsViewModel());

class ProductDetailsViewModel extends ChangeNotifier {
  int quantity = 0;

  int _imageSliderIndex = 0;
  get imageSliderIndex => _imageSliderIndex;

  void setImageSliderIndex(int index) {
    _imageSliderIndex = index;
    notifyListeners();
  }

  void addQuantity(int availableStack, Product product) {
    if (availableStack > quantity) {
      quantity++;
    }
    notifyListeners();
  }

  void removeQuantity(Product product) {
    if (quantity > 0) {
      quantity--;
    }
    notifyListeners();
  }
}
