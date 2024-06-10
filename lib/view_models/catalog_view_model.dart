
import 'package:cedratools/models/catalog_response_model.dart';
import 'package:cedratools/models/response_model.dart';
import 'package:cedratools/networking/api_paths.dart';
import 'package:cedratools/networking/api_services.dart';
import 'package:cedratools/view_models/loader_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

var cataLogViewModel = ChangeNotifierProvider((ref) => CatalogViewModel());

class CatalogViewModel extends ChangeNotifier {
  CatalogResponseViewModel? catalogresponse;

  void getProductList(WidgetRef ref) async {
    try {
    ref.watch(loaderViewModel).showLoader();
    ResponseModel response = await ApiServices.request(ApiPaths.productGetList, method: RequestMethod.GET);
    catalogresponse = CatalogResponseViewModel.fromJson(response.data);
    notifyListeners();
    } catch (e) {
    } finally {
    ref.watch(loaderViewModel).hideLoader();
    }
  }
}
