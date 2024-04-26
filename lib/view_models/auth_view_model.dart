import 'dart:developer';

import 'package:cedratools/helper/base_helper.dart';
import 'package:cedratools/models/authenticate_user_api_response_model.dart';
import 'package:cedratools/models/response_model.dart';
import 'package:cedratools/networking/api_paths.dart';
import 'package:cedratools/networking/api_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authControllerProvider = ChangeNotifierProvider<AuthViewModel>((ref) {
  return AuthViewModel();
});

class AuthViewModel extends ChangeNotifier {
  TextEditingController emailEditingController = TextEditingController();
  TextEditingController passwordEditingController = TextEditingController();
  TextEditingController confirmPasswordEditingController = TextEditingController();
  bool isPasswordVisible = true;
  bool isConfirmPasswordVisible = true;
  AuthenticateUserApiResponseModel? authenticateUser;
  bool? isNewUser;

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

  void login() async {
    var map = {
      "email": emailEditingController.text.trim(),
      "password": passwordEditingController.text.trim(),
    };
    ResponseModel response = await ApiServices.request(ApiPaths.login, method: RequestMethod.POST, data: map);
  }

  void generatePassword() async {
    var map = {
      "email": emailEditingController.text.trim(),
      "password": passwordEditingController.text.trim(),
    };
    ResponseModel response = await ApiServices.request(ApiPaths.generatePassword, method: RequestMethod.POST, data: map);
  }

  Future authentivateUser() async {
    var map = {
      "email": emailEditingController.text.trim(),
    };
    ResponseModel response = await ApiServices.request(
      ApiPaths.authenticateUser,
      method: RequestMethod.POST,
      data: map,
    );
    if (response.data != null) {
      authenticateUser = AuthenticateUserApiResponseModel.fromJson(response.data);
      isNewUser = authenticateUser!.isPasswordSet;
    }
  }
}
