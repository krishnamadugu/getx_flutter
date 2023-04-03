import 'dart:convert';

import 'package:http/http.dart' as http;

import 'api_model.dart';

fetchData(var userList) async {
  final response = await http.get(Uri.parse("https://dummyjson.com/users"));
  if (response.statusCode == 200) {
    var jsonResponse = jsonDecode(response.body);
    var userData = UserData.fromJson(jsonResponse);
    userList.addAll(userData.users ?? []);
  } else {
    throw Exception("Failed to Load data");
  }
}
