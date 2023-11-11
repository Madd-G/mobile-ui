import 'package:flutter/material.dart';

class CustomTextStyle {
  static TextStyle textExtraSmallRegular({double letterSpacing = 0.0}) {
    return _textStyle(
      fontWeight: FontWeight.normal,
      fontSize: 9,
      letterSpacing: letterSpacing,
    );
  }

  static TextStyle textExtraSmallMedium({double letterSpacing = 0.0}) {
    return _textStyle(
      fontWeight: FontWeight.w500,
      fontSize: 9,
      letterSpacing: letterSpacing,
    );
  }

  static TextStyle textVerySmallMedium({double letterSpacing = 0.0}) {
    return _textStyle(
      fontWeight: FontWeight.normal,
      fontSize: 10,
      letterSpacing: letterSpacing,
    );
  }

  static TextStyle textSmallRegular({double letterSpacing = 0.0}) {
    return _textStyle(
      fontWeight: FontWeight.normal,
      fontSize: 11,
      letterSpacing: letterSpacing,
    );
  }

  static TextStyle textSmallMedium({double letterSpacing = 0.0}) {
    return _textStyle(
      fontWeight: FontWeight.w500,
      fontSize: 11,
      letterSpacing: letterSpacing,
    );
  }

  static TextStyle textSmallSemiBold({double letterSpacing = 0.0}) {
    return _textStyle(
      fontWeight: FontWeight.w600,
      fontSize: 11,
      letterSpacing: letterSpacing,
    );
  }

  static TextStyle textRegular({double letterSpacing = 0.0}) {
    return _textStyle(
      fontWeight: FontWeight.normal,
      fontSize: 12,
      letterSpacing: letterSpacing,
    );
  }

  static TextStyle textMedium({double letterSpacing = 0.0}) {
    return _textStyle(
      fontWeight: FontWeight.w500,
      fontSize: 12,
      letterSpacing: letterSpacing,
    );
  }

  static TextStyle textSemiBold({double letterSpacing = 0.0}) {
    return _textStyle(
      fontWeight: FontWeight.w600,
      fontSize: 12,
      letterSpacing: letterSpacing,
    );
  }

  static TextStyle textMediumRegular({double letterSpacing = 0.0}) {
    return _textStyle(
      fontWeight: FontWeight.normal,
      fontSize: 13,
      letterSpacing: letterSpacing,
    );
  }

  static TextStyle textMediumMedium({double letterSpacing = 0.0}) {
    return _textStyle(
      fontWeight: FontWeight.w500,
      fontSize: 13,
      letterSpacing: letterSpacing,
    );
  }

  static TextStyle textMediumSemiBold({double letterSpacing = 0.0}) {
    return _textStyle(
      fontWeight: FontWeight.w600,
      fontSize: 13,
      letterSpacing: letterSpacing,
    );
  }

  static TextStyle textBigRegular({double letterSpacing = 0.0}) {
    return _textStyle(
      fontWeight: FontWeight.normal,
      fontSize: 15,
      letterSpacing: letterSpacing,
    );
  }

  static TextStyle textBigMedium({double letterSpacing = 0.0}) {
    return _textStyle(
      fontWeight: FontWeight.w500,
      fontSize: 15,
      letterSpacing: letterSpacing,
    );
  }

  static TextStyle textBigSemiBold({double letterSpacing = 0.0}) {
    return _textStyle(
      fontWeight: FontWeight.w600,
      fontSize: 15,
      letterSpacing: letterSpacing,
    );
  }

  static TextStyle textLargeRegular({double letterSpacing = 0.0}) {
    return _textStyle(
      fontWeight: FontWeight.normal,
      fontSize: 16,
      letterSpacing: letterSpacing,
    );
  }

  static TextStyle textLargeMedium({double letterSpacing = 0.0}) {
    return _textStyle(
      fontWeight: FontWeight.w500,
      fontSize: 16,
      letterSpacing: letterSpacing,
    );
  }

  static TextStyle textLargeSemiBold({double letterSpacing = 0.0}) {
    return _textStyle(
      fontWeight: FontWeight.w600,
      fontSize: 16,
      letterSpacing: letterSpacing,
    );
  }

  static TextStyle headingRegular({double letterSpacing = 0.0}) {
    return _textStyle(
      fontWeight: FontWeight.normal,
      fontSize: 20,
      letterSpacing: letterSpacing,
    );
  }

  static TextStyle headingMedium({double letterSpacing = 0.0}) {
    return _textStyle(
      fontWeight: FontWeight.w500,
      fontSize: 20,
      letterSpacing: letterSpacing,
    );
  }

  static TextStyle headingSemiBold({double letterSpacing = 0.0}) {
    return _textStyle(
      fontWeight: FontWeight.w600,
      fontSize: 20,
      letterSpacing: letterSpacing,
    );
  }

  static TextStyle _textStyle({
    required FontWeight fontWeight,
    required double fontSize,
    double letterSpacing = 0.0,
  }) {
    return TextStyle(
      fontFamily: 'Poppins',
      fontWeight: fontWeight,
      fontSize: fontSize,
      letterSpacing: letterSpacing,
    );
  }
}
