import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginButton extends StatelessWidget {
  final String btnText;

  const LoginButton({Key? key, required this.btnText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
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
        btnText,
        style: GoogleFonts.sourceSansPro(
          textStyle: const TextStyle(
              fontSize: 18.0, color: Colors.white, fontWeight: FontWeight.w800),
        ),
      ),
    );
  }
}
