import 'package:flutter/material.dart';

class AppColor {
  const AppColor._();

  static const Color lightBlue = Colors.lightBlue;

  static const Color borderColor = Color(0xFFE9E9E9);

  static const List gradientColors = [
    LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [
        Color(0xffffafbd),
        Color(0xffffc3a0),
      ],
    ),
    LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [
        Color(0xff2193b0),
        Color(0xff6dd5ed),
      ],
    ),
    LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [
        Color(0xffcc2b5e),
        Color(0xff753a88),
      ],
    ),
    LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [
        Color(0xff42275a),
        Color(0xff734b6d),
      ],
    ),
    LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [
        Color(0xff56ab2f),
        Color(0xffa8e063),
      ],
    ),
    LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [
        Color(0xff2b5876),
        Color(0xff4e4376),
      ],
    ),
    LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [
        Color(0xff4ca1af),
        Color(0xffc4e0e5),
      ],
    ),
    LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [
        Color(0xff3a1c71),
        Color(0xffd76d77),
        Color(0xffffaf7b),
      ],
    ),
    LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [
        Color(0xff4568dc),
        Color(0xffb06ab3),
      ],
    ),
    LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [
        Color(0xff43cea2),
        Color(0xff185a9d),
      ],
    ),
  ];

  static LinearGradient lightBlueGradient = LinearGradient(
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
    colors: <Color>[Colors.blue[600], Colors.lightBlue[300]],
  );
}
