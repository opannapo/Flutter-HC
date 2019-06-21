import 'package:flutter/material.dart';

const String defaultFont = 'avenir';
const String boldFont = 'avenir-next';

class TextStyleConst {
  static TextStyle n10({Color color}) {
    return new TextStyle(
      color: color ?? Colors.black,
      letterSpacing: 1,
      fontSize: 10,
      fontFamily: defaultFont,
      fontStyle: FontStyle.normal,
    );
  }

  /*Normal 12*/
  static TextStyle n12({Color color}) {
    return new TextStyle(
      color: color ?? Colors.black,
      letterSpacing: 1,
      fontSize: 12,
      fontFamily: defaultFont,
      fontStyle: FontStyle.normal,
    );
  }

  static TextStyle n14({Color color}) {
    return new TextStyle(
      color: color ?? Colors.black,
      letterSpacing: 1,
      fontSize: 14,
      fontFamily: defaultFont,
      fontStyle: FontStyle.normal,
    );
  }

  static TextStyle n16({Color color}) {
    return new TextStyle(
      color: color ?? Colors.black,
      letterSpacing: 1,
      fontSize: 16,
      fontFamily: defaultFont,
      fontWeight: FontWeight.normal,
    );
  }

  static TextStyle n20({Color color, double letterSpacing}) {
    return new TextStyle(
      color: color ?? Colors.black,
      letterSpacing: letterSpacing ?? 1,
      fontSize: 20,
      fontFamily: defaultFont,
      fontWeight: FontWeight.normal,
    );
  }

  /*BOld  14*/
  static TextStyle ni14({Color color, double letterSpacing}) {
    return new TextStyle(
        color: color ?? Colors.black,
        letterSpacing: letterSpacing ?? 1,
        fontSize: 14,
        fontFamily: defaultFont,
        fontWeight: FontWeight.normal,
        fontStyle: FontStyle.italic);
  }

  /*BOld  12*/
  static TextStyle b12({Color color, double letterSpacing}) {
    return new TextStyle(
      color: color ?? Colors.black,
      letterSpacing: letterSpacing ?? 1,
      fontSize: 12,
      fontFamily: boldFont,
      fontWeight: FontWeight.bold,
    );
  }

  /*BOld  14*/
  static TextStyle b14({Color color, double letterSpacing}) {
    return new TextStyle(
      color: color ?? Colors.black,
      letterSpacing: letterSpacing ?? 1,
      fontSize: 14,
      fontFamily: boldFont,
      fontWeight: FontWeight.bold,
    );
  }

  /*BOld  16*/
  static TextStyle b16({Color color, double letterSpacing}) {
    return new TextStyle(
      color: color ?? Colors.black,
      letterSpacing: letterSpacing ?? 1,
      fontSize: 16,
      fontFamily: boldFont,
      fontWeight: FontWeight.bold,
    );
  }

  /*BOld  20*/
  static TextStyle b20({Color color, double letterSpacing}) {
    return new TextStyle(
      color: color ?? Colors.black,
      letterSpacing: letterSpacing ?? 1,
      fontSize: 20,
      fontFamily: boldFont,
      fontWeight: FontWeight.bold,
    );
  }

  /*BOld  25*/
  static TextStyle b25({Color color, double letterSpacing}) {
    return new TextStyle(
      color: color ?? Colors.black,
      letterSpacing: letterSpacing ?? 1,
      fontSize: 25,
      fontFamily: boldFont,
      fontWeight: FontWeight.bold,
    );
  }

  /*BOld  30*/
  static TextStyle b30({Color color, double letterSpacing}) {
    return new TextStyle(
      color: color ?? Colors.black,
      letterSpacing: letterSpacing ?? 1,
      fontSize: 30,
      fontFamily: boldFont,
      fontWeight: FontWeight.bold,
    );
  }
}
