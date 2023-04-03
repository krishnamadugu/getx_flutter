import 'package:flutter/material.dart';

class UserInfo extends StatelessWidget {
  final img;
  final name;
  final email;
  const UserInfo({Key? key, this.img, this.name, this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Info"),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Image.network(img),
              SizedBox(
                height: 20.0,
              ),
              Text(name),
              SizedBox(
                height: 20.0,
              ),
              Text(email),
            ],
          ),
        ),
      ),
    );
  }
}
