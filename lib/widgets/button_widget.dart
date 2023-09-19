import 'package:flutter/material.dart';
import '../core/constant/color_palatte.dart';

class ButtonNext extends StatelessWidget {
  double? width;
  bool? isResponsive;
  double? height;

  ButtonNext(
      {super.key, this.width, this.isResponsive = false, this.height = 50});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: width,
      height: height,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: ColorPalette.primaryColor),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.keyboard_double_arrow_right_outlined,
            size: 14,
            color: Colors.white,
          ),
          Icon(
            Icons.keyboard_double_arrow_right_outlined,
            size: 18,
            color: Colors.white,
          ),
          Icon(
            Icons.keyboard_double_arrow_right_outlined,
            size: 22,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
