// ignore_for_file: constant_identifier_names

import 'dart:developer';
import 'dart:io';

import 'package:cedratools/main.dart';
import 'package:cedratools/models/response_model.dart';
import 'package:cedratools/networking/api_config.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

enum RequestMethod { POST, GET, PUT, PATCH, DELETE }

class ApiServices {
  static Future<ResponseModel> request(String path, {required RequestMethod method, data, queryParameters}) async {
    try {
      ApiConfig().dio.options.method = describeEnum(method);
      ApiConfig().dio.options.headers[HttpHeaders.authorizationHeader] = box.get("token", defaultValue: "");
      Response response = await ApiConfig().dio.request(path, data: data, queryParameters: queryParameters);
      log(response.data.toString());
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return ResponseModel.fromJson(response.data);
      }
    } on DioException catch (e) {
      log("DioException: ${e.response}");
      // BaseHelper.showSnackBar(
      //     "${e.response?.data?['message'] ?? "${e.response}"}");
    } on SocketException catch (_) {
      // BaseHelper.showSnackBar("No internet connection");
    }
    throw Null;
  }
}
