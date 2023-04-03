import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:getx_sample/model/remote/api_model.dart';
import 'package:getx_sample/model/remote/repo/user_repo.dart';

class ApiDataController extends GetxController {
  var isLoading = false.obs;
  UserData? userData;
  var userList = [];
  UserRepo res = UserRepo();

  @override
  Future<void> onInit() async {
    super.onInit();
    fetchData();
  }

  fetchData() async {
    try {
      isLoading(true);
      var response = await res.fetchData();
      if (response.success!) {
        var result = jsonDecode(response.data);
        var userData = UserData.fromJson(result);
        userList.addAll(userData.users ?? []);
      } else {
        throw Exception(response.message);
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    } finally {
      isLoading(false);
    }
  }
}
