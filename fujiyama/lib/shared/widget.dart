import 'package:flutter/material.dart';

Widget customBtn(BuildContext context, String text, Color bgColor, Color textColor) {
  return Container(
    height: 50,
    width: 310,
    color: bgColor,
    alignment: Alignment.center,
    child: Text(text, style: TextStyle(color: textColor, fontSize: 20),),
  );
}