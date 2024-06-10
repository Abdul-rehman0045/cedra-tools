import 'dart:developer';

import 'package:cedratools/models/product_response_model.dart';
import 'package:cedratools/models/claim_status_response_model.dart';
import 'package:cedratools/models/promotion_model.dart';
import 'package:cedratools/models/response_model.dart';
import 'package:cedratools/networking/api_paths.dart';
import 'package:cedratools/networking/api_services.dart';
import 'package:cedratools/view_models/loader_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

var homeViewModel = ChangeNotifierProvider<HomeViewModel>((ref) => HomeViewModel());

class HomeViewModel extends ChangeNotifier {
  ClaimStatusResponseModel? claimStatusObj;
  ProductResponseModel? promotionProducts;

  List carouselImages = [];

  Future checkClaimStatus() async {
    try {
      ResponseModel response = await ApiServices.request(ApiPaths.chaeckClaimStatus, method: RequestMethod.GET);
      claimStatusObj = ClaimStatusResponseModel.fromJson(response.data);
      notifyListeners();
    } catch (e) {
    } finally {}
  }

  void claimDailyBonus(WidgetRef ref) async {
    try {
      ref.read(loaderViewModel).showLoader();
      ResponseModel response = await ApiServices.request(ApiPaths.claimDailyBonus, method: RequestMethod.POST);
      if (response.status == 200) {
        await checkClaimStatus();
      }
    } catch (e) {
    } finally {
      ref.read(loaderViewModel).hideLoader();
    }
  }

  // void getProducts(WidgetRef ref) async {
  //   try {
  //     ref.watch(loaderViewModel).showLoader();
  //     ResponseModel response = await ApiServices.request(ApiPaths.products, method: RequestMethod.GET);
  //     promotionModel = PromotionModel.fromJson(response.data);
  //     notifyListeners();
  //   } catch (e) {
  //   } finally {
  //     ref.watch(loaderViewModel).hideLoader();
  //   }
  // }

  void getPromotionProducts(WidgetRef ref) async {
    try {
      ref.watch(loaderViewModel).showLoader();
      ResponseModel response = await ApiServices.request(ApiPaths.promotionProducts, method: RequestMethod.GET);
      promotionProducts = ProductResponseModel.fromJson(response.data);
      notifyListeners();
    } catch (e) {
      log('error: $e');
    } finally {
      ref.watch(loaderViewModel).hideLoader();
    }
  }

  void getCarouselImages(WidgetRef ref) async {
    try {
      ResponseModel response = await ApiServices.request(ApiPaths.carouselImages, method: RequestMethod.GET);
      carouselImages = response.data;
      notifyListeners();
    } catch (e) {
      log('error: $e');
    } finally {}
  }
}
