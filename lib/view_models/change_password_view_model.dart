import 'package:cedratools/models/response_model.dart';
import 'package:cedratools/networking/api_paths.dart';
import 'package:cedratools/networking/api_services.dart';
import 'package:cedratools/view_models/loader_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

var changePasswordViewModel = ChangeNotifierProvider.autoDispose<ChangePasswordViewModel>((ref) => ChangePasswordViewModel());

class ChangePasswordViewModel extends ChangeNotifier {
  bool isOldPasswordVisible = false;
  bool isNewPasswordVisible = false;
  TextEditingController oldPasswordEditingController = TextEditingController();
  TextEditingController newPasswordEditingController = TextEditingController();

  void setOldPasswordVisible() {
    isOldPasswordVisible = !isOldPasswordVisible;
    notifyListeners();
  }

  void setNewPasswordVisible() {
    isNewPasswordVisible = !isNewPasswordVisible;
    notifyListeners();
  }

  void changePassword(WidgetRef ref) async {
    print("-o-->${oldPasswordEditingController.text}");
    print("-n-->${newPasswordEditingController.text}");
    var map = {
      "oldPassword": oldPasswordEditingController.text.trim(),
      "newPassword": newPasswordEditingController.text.trim(),
    };
    try {
      print("-o-->${oldPasswordEditingController.text}");
      print("-n-->${newPasswordEditingController.text}");
      ref.read(loaderViewModel).showLoader();
      ResponseModel response = await ApiServices.request(ApiPaths.changePassword, method: RequestMethod.POST, data: map);
    } catch (e) {
    } finally {
      ref.read(loaderViewModel).hideLoader();
    }
  }
}
