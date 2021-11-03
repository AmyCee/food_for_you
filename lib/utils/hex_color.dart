import 'package:flutter/material.dart';

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

Map<int, Color> color =
{
  50:Color.fromRGBO(225, 173, 1, .1),
  100:Color.fromRGBO(225, 173, 1, .2),
  200:Color.fromRGBO(225, 173, 1, .3),
  300:Color.fromRGBO(225, 173, 1, .4),
  400:Color.fromRGBO(225, 173, 1, .5),
  500:Color.fromRGBO(225, 173, 1, .6),
  600:Color.fromRGBO(225, 173, 1, .7),
  700:Color.fromRGBO(225, 173, 1, .8),
  800:Color.fromRGBO(225, 173, 1, .9),
  900:Color.fromRGBO(225, 173, 1, 1),
};

MaterialColor mainSwatch = MaterialColor(0xFFE1AD01, color);
