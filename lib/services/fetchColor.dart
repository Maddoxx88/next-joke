
import 'package:flutter/material.dart';


class FetchColor {

  toColor (String color) {
    var hexColor = color.replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    }
  }


}






