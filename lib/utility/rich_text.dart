import 'package:flutter/material.dart';

class TextRich extends StatelessWidget {
  final String first_text;
  final String second_text;
  const TextRich(
      {Key? key, required this.first_text, required this.second_text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: first_text,
            style: TextStyle(fontSize: 15.0),
          ),
          WidgetSpan(
            child: SizedBox(width: 5.0),
          ),
          TextSpan(
            text: second_text,
            style: TextStyle(
              decoration: TextDecoration.underline,
              color: Color(0xffFF0037),
            ),
          ),
        ],
      ),
    );
  }
}
