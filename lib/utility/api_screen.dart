import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_sample/controller/home_controller.dart';

import '../view/user_info.dart';

class ApiScreen extends StatefulWidget {
  const ApiScreen({Key? key}) : super(key: key);

  @override
  State<ApiScreen> createState() => _ApiScreenState();
}

class _ApiScreenState extends State<ApiScreen> {
  ApiDataController apiDataController = Get.put(ApiDataController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: apiDataController.userList.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            onTap: () {
              Get.to(
                UserInfo(
                  img: apiDataController.userList[index].image,
                  name:
                      "${apiDataController.userList[index].firstName} ${apiDataController.userList[index].lastName}",
                  email: apiDataController.userList[index].email,
                ),
              );
            },
            title: Text(
                "${apiDataController.userList[index].firstName ?? ""} ${apiDataController.userList[index].lastName ?? ""}"),
            subtitle: Text(apiDataController.userList[index].email ?? ""),
            leading:
                Image.network("${apiDataController.userList[index].image}"),
          );
        },
      ),
    );
  }
}
