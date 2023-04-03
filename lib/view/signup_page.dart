import 'package:flutter/material.dart';
import 'package:getx_sample/utility/rich_text.dart';
import 'package:getx_sample/utility/text_field.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utility/login_button.dart';

enum select { true_val, fasle_val }

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: [
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
                  "Lets create your account",
                  style: GoogleFonts.roboto(
                    textStyle: const TextStyle(
                      color: Color(0xff95919B),
                      fontSize: 16.0,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 39,
                ),
                TextInputTaker(
                  lText: "First Name",
                  hText: "Enter Your First Name",
                  leadIcon: Icons.person_pin_rounded,
                ),
                const SizedBox(
                  height: 28,
                ),
                TextInputTaker(
                  lText: "Last Name",
                  hText: "Enter Your last Name",
                  leadIcon: Icons.person_pin_rounded,
                ),
                const SizedBox(
                  height: 28,
                ),
                TextInputTaker(
                  lText: "Email",
                  hText: "Enter Email",
                  leadIcon: Icons.person,
                ),
                const SizedBox(
                  height: 33,
                ),
                Row(
                  children: [
                    Radio(
                      value: TextRich(
                          first_text: "I agree to the",
                          second_text: "Terms & Conditons"),
                      groupValue: _select,
                      onChanged: (select val) {},
                    ),
                  ],
                ),
                const SizedBox(
                  height: 37,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  child: LoginButton(
                    btnText: 'Continue',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
