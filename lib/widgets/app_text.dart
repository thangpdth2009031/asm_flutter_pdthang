import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  double size;
  final String text;
  Color color;
  FontWeight fontWeight;
  AppText(
      {super.key,
      required this.text,
      this.color = Colors.black,
      this.size = 16,
      this.fontWeight = FontWeight.normal});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(text,
        style: TextStyle(color: color, fontSize: size, fontWeight: fontWeight));
  }
}
