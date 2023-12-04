import 'package:flutter/material.dart';

class ColorUtils {
  static CustomColor background = CustomColor(0xFF161A30);
  static CustomColor primary = CustomColor(0xFF31304D);
  static CustomColor secondary = CustomColor(0xFFB6BBC4);
  static CustomColor text = CustomColor(0xFFF0ECE5);
  static CustomColor button = CustomColor(0xFFFFC700);
  

  // Tambahkan variable warna lainnya sesuai kebutuhan
}

class CustomColor {
  final int value;

  CustomColor(this.value);

  Color get color => Color(value);

  Color withOpacity(double opacity) => Color.fromRGBO(
        color.red,
        color.green,
        color.blue,
        opacity,
      );
}
