import 'dart:developer';

import 'package:cedratools/helper/app_routes.dart';
import 'package:cedratools/helper/base_helper.dart';
import 'package:cedratools/main.dart';
import 'package:cedratools/models/authenticate_user_api_response_model.dart';
import 'package:cedratools/models/login_response_model.dart';
import 'package:cedratools/models/response_model.dart';
import 'package:cedratools/networking/api_paths.dart';
import 'package:cedratools/networking/api_services.dart';
import 'package:cedratools/view_models/loader_view_model.dart';
import 'package:cedratools/views/homepage/homepage_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authControllerProvider = ChangeNotifierProvider<AuthViewModel>((ref) => AuthViewModel());

class AuthViewModel extends ChangeNotifier {
  TextEditingController emailEditingController = TextEditingController();
  TextEditingController passwordEditingController = TextEditingController();
  TextEditingController confirmPasswordEditingController = TextEditingController();
  TextEditingController nameEditingController = TextEditingController();
  TextEditingController phoneEditingController = TextEditingController();

  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;
  AuthenticateUserApiResponseModel? authenticateUser;
  bool? isPasswordSet;

  void getPasswordVisible() {
    isPasswordVisible = !isPasswordVisible;
    notifyListeners();
  }

  void getConfirmPasswordVisible() {
    isConfirmPasswordVisible = !isConfirmPasswordVisible;
    notifyListeners();
  }

  bool validateEmail(BuildContext context) {
    Pattern pattern = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    RegExp regex = new RegExp(pattern as String);

    if (emailEditingController.text.isEmpty) {
      BaseHelper.showSnackBar(
        context,
        "Email is required",
        isError: true,
      );
      return false;
    } else if (!regex.hasMatch(emailEditingController.text)) {
      BaseHelper.showSnackBar(
        context,
        "Email is not valid",
        isError: true,
      );
      return false;
    }
    return true;
  }

  bool validateName(BuildContext context) {
    if (nameEditingController.text.isEmpty) {
      BaseHelper.showSnackBar(
        context,
        "Name is required",
        isError: true,
      );
      return false;
    }
    return true;
  }

  bool validatePassword(BuildContext context) {
    if (passwordEditingController.text.isEmpty) {
      BaseHelper.showSnackBar(
        context,
        "Passowrd is required",
        isError: true,
      );
      return false;
    } else if (passwordEditingController.text.length < 8) {
      BaseHelper.showSnackBar(
        context,
        "Passowrd length is less than 8",
        isError: true,
      );
      return false;
    }
    return true;
  }

  bool validateConfirmPassword(BuildContext context) {
    if (confirmPasswordEditingController.text.isEmpty) {
      BaseHelper.showSnackBar(
        context,
        "Confirm passowrd is required",
        isError: true,
      );
      return false;
    } else if (confirmPasswordEditingController.text.length < 8) {
      BaseHelper.showSnackBar(
        context,
        "Confirm passowrd length is less than 8",
        isError: true,
      );
      return false;
    } else if (passwordEditingController.text != confirmPasswordEditingController.text) {
      BaseHelper.showSnackBar(
        context,
        "Passowrds doesn't match",
        isError: true,
      );
      return false;
    }
    return true;
  }

  void login({WidgetRef? ref, BuildContext? context}) async {
    var map = {
      "email": emailEditingController.text.trim(),
      "password": passwordEditingController.text.trim(),
    };
    try {
      ref!.read(loaderViewModel).showLoader();
      ResponseModel response = await ApiServices.request(ApiPaths.login, method: RequestMethod.POST, data: map);
      if (response.status == 200) {
        LoginResponseModel loginResponse = LoginResponseModel.fromJson(response.data);
        box.put("token", loginResponse.userExist!.token);
        box.put("coins", loginResponse.userExist!.coins);
        clearForm();
        Navigator.pushNamedAndRemoveUntil(context!, AppRoutes.HOME_PAGE_VIEW, (route) => false);
      }
    } catch (e) {
    } finally {
      ref!.read(loaderViewModel).hideLoader();
    }
  }

  void generatePassword({WidgetRef? ref, BuildContext? context}) async {
    var map = {
      "email": emailEditingController.text.trim(),
      "password": passwordEditingController.text.trim(),
    };
    try {
      ref!.read(loaderViewModel).showLoader();
      ResponseModel response = await ApiServices.request(ApiPaths.generatePassword, method: RequestMethod.POST, data: map);
      if (response.status == 200) {
        box.put("token", response.data['User']['token']);
        box.put("coins", response.data['User']['coins']);
        clearForm();
        Navigator.pushNamed(context!, AppRoutes.COMPLETE_PROFILE_VIEW);
      }
    } catch (e) {
    } finally {
      ref!.read(loaderViewModel).hideLoader();
    }
  }

  Future authentivateUser({WidgetRef? ref}) async {
    var map = {
      "email": emailEditingController.text.trim(),
    };
    try {
      ref!.read(loaderViewModel).showLoader();
      ResponseModel response = await ApiServices.request(
        ApiPaths.authenticateUser,
        method: RequestMethod.POST,
        data: map,
      );
      if (response.data != null) {
        authenticateUser = AuthenticateUserApiResponseModel.fromJson(response.data);
        isPasswordSet = authenticateUser!.isPasswordSet;
      }
    } catch (e) {
    } finally {
      ref!.read(loaderViewModel).hideLoader();
    }
  }

  void logout(BuildContext context) {
    box.clear();
    Navigator.pushNamedAndRemoveUntil(context, AppRoutes.EMAIL_VIEW, (route) => false);
  }

  void deleteAccount(WidgetRef? ref, BuildContext? context) async {
    try {
      ref!.read(loaderViewModel).showLoader();
      ResponseModel response = await ApiServices.request(ApiPaths.deleteAccount, method: RequestMethod.DELETE);
      box.clear();
      Navigator.pushNamedAndRemoveUntil(context!, AppRoutes.EMAIL_VIEW, (route) => false);
    } catch (e) {
    } finally {
      ref!.read(loaderViewModel).hideLoader();
    }
  }

  //update user profile
  updateUserProfile(WidgetRef? ref) async {
    var map = {
      "name": nameEditingController.text.trim(),
      "phone_no": phoneEditingController.text.trim(),
    };
    try {
      ref!.read(loaderViewModel).showLoader();
      ResponseModel response = await ApiServices.request(ApiPaths.updateProfile, method: RequestMethod.POST, data: map);
    } catch (e) {
    } finally {
      ref!.read(loaderViewModel).hideLoader();
    }
  }

  //get user profile
  void getUserProfile(WidgetRef? ref) async {
    try {
      ref!.read(loaderViewModel).showLoader();
      ResponseModel response = await ApiServices.request(ApiPaths.getProfile, method: RequestMethod.GET);
      if (response.status == 200) {
        nameEditingController.text = response.data["name"];
        emailEditingController.text = response.data["email"];
        phoneEditingController.text = response.data["phone"];
      }
    } catch (e) {
    } finally {
      ref!.read(loaderViewModel).hideLoader();
    }
  }

  //clear form
  void clearForm() {
    emailEditingController.clear();
    passwordEditingController.clear();
    confirmPasswordEditingController.clear();
    nameEditingController.clear();
    phoneEditingController.clear();
  }
}
