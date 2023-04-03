import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_sample/view/dashboard.dart';
import 'package:getx_sample/view/login_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final userData = GetStorage();

  @override
  void initState() {
    userData.writeIfNull('isLogged', false);
    Future.delayed(Duration.zero, () async {
      checkIfLogged();
    });
    super.initState();
  }

  void checkIfLogged() {
    userData.read('isLogged')
        ? Get.offAll(DashBoard(
            email: userData.read('email'),
            pwd: userData.read('password'),
          ))
        : Get.offAll(const LoginPage());
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
