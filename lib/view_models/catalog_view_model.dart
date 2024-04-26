import 'dart:developer';

import 'package:cedratools/models/catalog_product_response_model.dart';
import 'package:cedratools/models/response_model.dart';
import 'package:cedratools/networking/api_paths.dart';
import 'package:cedratools/networking/api_services.dart';

class CatalogViewModel {
  CatalogProductResponseModel? catalogData;

  void getProductList() async {
    var response = await ApiServices.request(ApiPaths.productGetList, method: RequestMethod.GET);
    catalogData = CatalogProductResponseModel.fromJson(response.data);
  }
}
