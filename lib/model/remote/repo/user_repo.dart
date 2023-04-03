import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:getx_sample/utility/ApiResult.dart';
import 'package:http/http.dart' as http;

class UserRepo {
  FutureOr<ApiResult> fetchData() async {
    try {
      var response = await http.get(Uri.parse("https://dummyjson.com/users"));
      if (response.statusCode == 200) {
        return ApiResult(
            success: true,
            data: response.body,
            message: "fetched data successfully");
      } else {
        return ApiResult(
            success: false,
            data: null,
            message: " status code : ${response.statusCode}");
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error while getting data");
        return ApiResult(
            success: false,
            data: null,
            message: " status code : ${e.toString()}");
      }
    }
    return ApiResult(
        success: false, data: null, message: "something went wrong");
  }
}
