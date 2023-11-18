import 'package:flutter/material.dart';


class TextThemeModel {
  static TextStyle smallStyle = TextStyle(
    fontSize: 14,
    color: ColorSchemeModel.textColor1,
  );

  static TextStyle mediumStyle = TextStyle(
      fontSize: 22,
      color: ColorSchemeModel.textColor1,
  );

  static TextStyle largeStyle = TextStyle(
      fontSize: 52,
      color: ColorSchemeModel.textColor1,
  );
}

class ColorSchemeModel {
  static Color textColor1 =const Color.fromRGBO(72, 74, 130, 1);
  static Color textColor2 = const Color.fromRGBO(255, 255, 255, 1);
  static Color cardColor1 = const Color.fromRGBO(144, 144, 172, 1);
}