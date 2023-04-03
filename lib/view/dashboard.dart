import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_sample/controller/home_controller.dart';
import 'package:getx_sample/utility/api_screen.dart';
import 'package:getx_sample/view/login_page.dart';

class DashBoard extends StatefulWidget {
  final email, pwd;
  DashBoard({Key? key, required this.email, required this.pwd})
      : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  void initState() {
    super.initState();
  }

  ApiDataController apiDataController = Get.put(ApiDataController());

  final userData = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                        child: Text("email id : ${widget.email}"),
                      ),
                      Text("password id : ${widget.pwd}"),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: ElevatedButton(
                      onPressed: () {
                        userData.remove('email');
                        userData.remove('pwd');
                        Get.offAll(LoginPage());
                      },
                      child: Text("Logout"),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 4,
              child: Obx(
                () => apiDataController.isLoading.value
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : ApiScreen(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
