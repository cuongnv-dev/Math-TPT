import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../common/constants/size_constants.dart';
import '../../common/extensions/size_extensions.dart';

class ThemeText {
  const ThemeText._();

  // static TextTheme get _lopsterTextTheme => GoogleFonts.alfaSlabOneTextTheme();

  static TextTheme get _lopsterTextTheme => GoogleFonts.calistogaTextTheme();

  static TextStyle get _headline6 =>
      _lopsterTextTheme.headline6.copyWith(fontSize: Sizes.dimen_24.sp);

  static TextStyle get _headline5 =>
      _lopsterTextTheme.headline5.copyWith(fontSize: Sizes.dimen_28.sp);

  static TextStyle get _headline4 =>
      _lopsterTextTheme.headline4.copyWith(fontSize: Sizes.dimen_36.sp);

  static TextStyle get _headline3 =>
      _lopsterTextTheme.headline4.copyWith(fontSize: Sizes.dimen_48.sp);

  static TextStyle get _headline2 =>
      _lopsterTextTheme.headline4.copyWith(fontSize: Sizes.dimen_56.sp);

  static TextStyle get subtitle1 =>
      _lopsterTextTheme.subtitle1.copyWith(fontSize: Sizes.dimen_22.sp);

  static TextStyle get subtitle2 =>
      _lopsterTextTheme.subtitle2.copyWith(fontSize: Sizes.dimen_18.sp);

  static TextStyle get bodyText1 => _lopsterTextTheme.bodyText1;
  static TextStyle get bodyText2 => _lopsterTextTheme.bodyText1;

  static getTextTheme() => TextTheme(
        headline6: _headline6,
        subtitle1: subtitle1,
        headline5: _headline5,
        headline4: _headline4,
        headline3: _headline3,
        headline2: _headline2,
        subtitle2: subtitle2,
        bodyText1: bodyText1,
        bodyText2: bodyText2,
      );
}

extension ThemeTextExtension on TextTheme {
  TextStyle get boldSubtitle1 => subtitle1.copyWith(
        fontWeight: FontWeight.w600,
      );

  TextStyle get whiteBodyText1 => bodyText1.copyWith(color: Colors.white);

  TextStyle get boldSubtitle2 => subtitle2.copyWith(
        fontWeight: FontWeight.w600,
      );

  TextStyle get boldHeadline5 => headline5.copyWith(
        fontWeight: FontWeight.w600,
      );

  TextStyle get lightBlueBoldSubtitle2 => subtitle2.copyWith(
        fontWeight: FontWeight.w600,
        color: Colors.lightBlue,
      );

  TextStyle get lightBlueBoldSubtitle1 => subtitle1.copyWith(
        fontWeight: FontWeight.w600,
        color: Colors.lightBlue,
      );
  TextStyle get lightBlueSubtitle1 => subtitle1.copyWith(
        color: Colors.lightBlue,
      );

  TextStyle get lightBlueHeadline4 => headline4.copyWith(
        fontWeight: FontWeight.w600,
        color: Colors.lightBlue,
      );

  TextStyle get lightBlueHeadline6 => headline6.copyWith(
        fontWeight: FontWeight.w600,
        color: Colors.lightBlue,
      );

  TextStyle get blackHeadline2 => headline2.copyWith(
        color: Colors.black,
        fontWeight: FontWeight.w600,
      );

  TextStyle get whiteHeadline6 => headline6.copyWith(
        color: Colors.white,
      );

  TextStyle get whiteSubtitle1 => subtitle1.copyWith(
        color: Colors.white,
      );

  TextStyle get whiteSubtitle2 => subtitle2.copyWith(
        color: Colors.white,
      );

  TextStyle get blackBoldHeadline5 => headline5.copyWith(
        color: Colors.black,
        fontWeight: FontWeight.w600,
      );

  TextStyle get whiteBoldHeadline3 => headline3.copyWith(
        color: Colors.white,
        fontWeight: FontWeight.w600,
      );

  TextStyle get whiteBoldHeadline2 => headline2.copyWith(
        color: Colors.white,
        fontWeight: FontWeight.w800,
      );

  TextStyle get whiteBoldHeadline4 => headline4.copyWith(
        color: Colors.white,
        fontWeight: FontWeight.w600,
      );

  TextStyle get whiteBoldHeadline5 => headline5.copyWith(
        color: Colors.white,
        fontWeight: FontWeight.w600,
      );

  TextStyle get blackBoldHeadline6 => headline6.copyWith(
        color: Colors.black,
        fontWeight: FontWeight.w600,
      );

  TextStyle get whiteBoldHeadline6 => headline6.copyWith(
        color: Colors.white,
        fontWeight: FontWeight.w600,
      );
}
