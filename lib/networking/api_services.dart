// ignore_for_file: constant_identifier_names

import 'dart:developer';
import 'dart:io';

import 'package:cedratools/models/response_model.dart';
import 'package:cedratools/networking/api_config.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

enum RequestMethod { POST, GET, PUT, PATCH, DELETE }

class ApiServices {
  static Future<ResponseModel> request(String path, {required RequestMethod method, data, queryParameters}) async {
    try {
      ApiConfig().dio.options.method = describeEnum(method);
      ApiConfig().dio.options.headers[HttpHeaders.authorizationHeader] =
          // 'Bearer ' + box.get("token", defaultValue: "");
          'Bearer' + "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NSwiZW1haWwiOiJyYWJhQGdtYWlsLmNvbSIsImlhdCI6MTcxNDEyODQ3MSwiZXhwIjoxNzE2NzIwNDcxfQ.iC7rAQn_u52dktLHbHAUUbSaGM-wJ9vEoQjOdI0Q9Lk";
      Response response = await ApiConfig().dio.request(path, data: data, queryParameters: queryParameters);
      log(response.data.toString());
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return ResponseModel.fromJson(response.data);
      }
    } on DioError catch (e) {
      log("${e.response}");
      // BaseHelper.showSnackBar(
      //     "${e.response?.data?['message'] ?? "${e.response}"}");
    } on SocketException catch (_) {
      // BaseHelper.showSnackBar("No internet connection");
    }
    throw Null;
  }
}
