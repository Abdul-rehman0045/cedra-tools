import 'package:cedratools/models/product_response_model.dart';
import 'package:cedratools/models/categories_response_model.dart';
import 'package:cedratools/models/response_model.dart';
import 'package:cedratools/networking/api_paths.dart';
import 'package:cedratools/networking/api_services.dart';
import 'package:cedratools/view_models/loader_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

var cataLogViewModel = ChangeNotifierProvider((ref) => CatalogViewModel());

class CatalogViewModel extends ChangeNotifier {
  ProductResponseModel? catalogresponse;
  CategoriesResponseModel? categoriesResponseModel;

  void getCategories(WidgetRef ref) async {
    try {
      ref.watch(loaderViewModel).showLoader();
      ResponseModel response = await ApiServices.request(ApiPaths.categories, method: RequestMethod.GET);
      categoriesResponseModel = CategoriesResponseModel.fromJson(response.data);
      notifyListeners();
    } catch (e) {
    } finally {
      ref.watch(loaderViewModel).hideLoader();
    }
  }

  void getProductList(WidgetRef ref) async {
    try {
      ref.watch(loaderViewModel).showLoader();
      ResponseModel response = await ApiServices.request(ApiPaths.products, method: RequestMethod.GET);
      catalogresponse = ProductResponseModel.fromJson(response.data);
      notifyListeners();
    } catch (e) {
    } finally {
      ref.watch(loaderViewModel).hideLoader();
    }
  }
}
