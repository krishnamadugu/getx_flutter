import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextInputTaker extends StatelessWidget {
  final String lText;
  final String hText;
  final IconData leadIcon;
  const TextInputTaker(
      {Key? key,
      required this.lText,
      required this.hText,
      required this.leadIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(27.0),
          borderSide: const BorderSide(
            color: Color(0xffDDD9E3),
          ),
        ),
        labelText: lText,
        hintText: hText,
        hintStyle: GoogleFonts.sourceSansPro(
          textStyle: const TextStyle(
            fontSize: 15.0,
            color: Color(0xff95919B),
          ),
        ),
        prefixIcon: Icon(
          leadIcon,
          color: Colors.black,
        ),
      ),
    );
  }
}
