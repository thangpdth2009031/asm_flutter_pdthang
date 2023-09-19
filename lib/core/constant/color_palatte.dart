import 'package:flutter/material.dart';

class ColorPalette {
  static const Color primaryColor = Color(0xff6155CC);
  static const Color secondColor = Color(0xff8F67E8);
  static const Color yellowColor = Color(0xffFE9C5E);
  static const Color dividerColor = Color(0xffE5E7Eb);
  static const Color text1Color = Color(0xff3234b4);
  static const Color subTitleColor = Color(0xff838383);
  static const Color backgroundScaffoldColor = Color(0xfff2f2f2);
}

class Gradients {
  static const Gradient defaultGradientBackground = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomLeft,
    colors: [
      ColorPalette.secondColor,
      ColorPalette.primaryColor,
    ],
  );
}
