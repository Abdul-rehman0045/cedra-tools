import 'package:cedratools/models/product_response_model.dart';
import 'package:cedratools/models/categories_response_model.dart';
import 'package:cedratools/models/response_model.dart';
import 'package:cedratools/networking/api_paths.dart';
import 'package:cedratools/networking/api_services.dart';
import 'package:cedratools/view_models/loader_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

var productViewModel = ChangeNotifierProvider((ref) => ProductViewModel());

class ProductViewModel extends ChangeNotifier {
  List<Map<String, dynamic>> sortByList = [
    {"title": 'None', "value": 'none'},
    // {"title": 'Featured', "value": 'featured'},
    {"title": 'Best Selling', "value": 'best-selling'},
    {"title": 'Alphabetically, AZ', "value": 'title ascending'},
    {"title": 'Alphabetically ZA', "value": 'title descending'},
    {"title": 'Price, low to high', "value": 'price asc'},
    {"title": 'Price, high to low', "value": 'price desc'},
    {"title": 'Date, old to new', "value": 'created_at asc'},
    {"title": 'Date, new to old', "value": 'created_at desc'},
  ];

  Map<String, dynamic>? _selectedSortBy;
  get selectedSortBy => _selectedSortBy;

  TextEditingController search = TextEditingController();

  void setSelectedSortBy(Map<String, dynamic> value) {
    _selectedSortBy = value;
    notifyListeners();
  }

  ProductResponseModel? productResponse;
  CategoriesResponseModel? categoriesResponseModel;

  int _selectedCategoryIndex = 0;
  get selectedCategoryIndex => _selectedCategoryIndex;

  void setSelectedCategoryIndex(int index) {
    _selectedCategoryIndex = index;
    notifyListeners();
  }

  Category? _selectedCategory;
  Category? get selectedCategory => _selectedCategory;

  void setSelectedCategory(Category? category) {
    _selectedCategory = category;
    notifyListeners();
  }

  void getCategories(WidgetRef ref) async {
    try {
      ref.watch(loaderViewModel).showLoader();
      ResponseModel response = await ApiServices.request(ApiPaths.categories, method: RequestMethod.GET);
      categoriesResponseModel = CategoriesResponseModel.fromJson(response.data);
      categoriesResponseModel!.categories!.insert(0, Category(id: 0, title: "All")); //inserting "all" category

      notifyListeners();
    } catch (e) {
    } finally {
      ref.watch(loaderViewModel).hideLoader();
    }
  }

  void getProducts(WidgetRef ref) async {
    try {
      ref.watch(loaderViewModel).showLoader();
      ResponseModel response = await ApiServices.request(ApiPaths.products, method: RequestMethod.GET);
      productResponse = ProductResponseModel.fromJson(response.data);
      notifyListeners();
    } catch (e) {
    } finally {
      ref.watch(loaderViewModel).hideLoader();
    }
  }

  void getProductsByCategory(WidgetRef ref, {showLoader = true}) async {
    try {
      var data = {
        "categoryId": selectedCategory?.id,
        "type": (_selectedSortBy?["value"] == null || _selectedSortBy!["value"] == 'none') ? null : _selectedSortBy!["value"],
        "search": search.text.trim(),
      };
      if (showLoader) ref.watch(loaderViewModel).showLoader();
      ResponseModel response = await ApiServices.request(ApiPaths.productsByCategory, method: RequestMethod.GET, queryParameters: data);
      productResponse = ProductResponseModel.fromJson(response.data);
      notifyListeners();
    } catch (e) {
    } finally {
      ref.watch(loaderViewModel).hideLoader();
    }
  }
}
