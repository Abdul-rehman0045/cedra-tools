import 'package:cedratools/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// var catalogProductListRef = ChangeNotifierProvider((ref) => CatalogProductList());

class ProductResponseModel {
  List<Product>? products;

  ProductResponseModel({this.products});

  ProductResponseModel.fromJson(json) {
    if (json != null) {
      products = <Product>[];
      json.forEach((v) {
        products!.add(new Product.fromJson(v));
      });
    }
  }
}
