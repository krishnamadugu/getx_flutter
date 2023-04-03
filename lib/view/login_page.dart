import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_sample/view/dashboard.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utility/widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController pwdController = TextEditingController();
  RegExp regex = RegExp(
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$%^&*(),.?":{}|<>])$');
  bool vis = false;
  final userData = GetStorage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "images/top_image.png",
              fit: BoxFit.cover,
              scale: 2,
            ),
            const SizedBox(
              height: 38.0,
            ),
            Text(
              "Welcome",
              style: GoogleFonts.roboto(
                textStyle: const TextStyle(
                  color: Color(0xff242424),
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // style: TextStyle(
              //   color: Color(0xff242424),
              //   fontSize: 24.0,
              // ),
            ),
            const SizedBox(
              height: 3.0,
            ),
            Text(
              "Please enter your account details",
              style: GoogleFonts.roboto(
                textStyle: const TextStyle(
                  color: Color(0xff95919B),
                  fontSize: 16.0,
                ),
              ),
            ),
            const SizedBox(
              height: 35.0,
            ),
            TextFormField(
              controller: emailController,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (!GetUtils.isEmail(value!)) {
                  return "Email is not valide";
                } else
                  return null;
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(27.0),
                  borderSide: const BorderSide(
                    color: Color(0xffDDD9E3),
                  ),
                ),
                labelText: "Email",
                hintText: "Enter Valid Email",
                hintStyle: GoogleFonts.sourceSansPro(
                  textStyle: const TextStyle(
                    fontSize: 15.0,
                    color: Color(0xff95919B),
                  ),
                ),
                prefixIcon: const Icon(
                  Icons.person_2_outlined,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(
              height: 24.0,
            ),
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              obscureText: vis,
              controller: pwdController,
              validator: (value) {
                if (!GetUtils.isLengthGreaterThan(value, 6) &&
                    !GetUtils.hasMatch(value,
                        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$%^&*(),.?":{}|<>])')) {
                  return "password is not vaild";
                } else if (!GetUtils.hasMatch(value,
                    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$%^&*(),.?":{}|<>])')) {
                  return "Enter a valid password";
                } else {
                  return null;
                }
              },
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(27.0),
                    borderSide: const BorderSide(
                      color: Color(0xffDDD9E3),
                    ),
                  ),
                  labelText: "Password",
                  hintText: "Enter your Secure Password",
                  hintStyle: GoogleFonts.sourceSansPro(
                    textStyle: const TextStyle(
                      fontSize: 15.0,
                      color: Color(0xff95919B),
                    ),
                  ),
                  prefixIcon: const Icon(
                    Icons.lock_outline_rounded,
                    color: Colors.black,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        if (passicon == visoff) {
                          vis = false;
                          passicon = vison;
                        } else {
                          vis = true;
                          passicon = visoff;
                        }
                      });
                    },
                    icon: passicon,
                  )),
            ),
            const SizedBox(
              height: 24.0,
            ),
            Text("Forgot Password?",
                style: GoogleFonts.roboto(
                  textStyle: const TextStyle(
                    fontSize: 13.0,
                    color: Color(0xffFF0037),
                    fontWeight: FontWeight.w400,
                  ),
                )),
            const SizedBox(
              height: 24.0,
            ),
            SizedBox(
              height: 55.0,
              width: MediaQuery.of(context).size.width,
              child: TextButton(
                onPressed: () {
                  String email = emailController.text;
                  String password = pwdController.text;
                  if (email != '' && password != '') {
                    userData.write('isLogged', true);
                    userData.write('email', email);
                    userData.write('password', password);

                    Get.offAll((DashBoard(
                      email: userData.read('email'),
                      pwd: userData.read('password'),
                    )));
                  } else {
                    Get.snackbar("error", "Not login");
                  }
                },
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                    (Set<MaterialState> states) {
                      return const Color(0xffFF0037);
                    },
                  ),
                ),
                child: Text(
                  "Login",
                  style: GoogleFonts.sourceSansPro(
                    textStyle: const TextStyle(
                        fontSize: 18.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w800),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            const Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "Don't have an account?",
                    style: TextStyle(fontSize: 15.0),
                  ),
                  WidgetSpan(
                    child: SizedBox(width: 5.0),
                  ),
                  TextSpan(
                    text: "RegisterNow",
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Color(0xffFF0037),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
