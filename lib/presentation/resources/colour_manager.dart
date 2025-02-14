import 'package:flutter/material.dart';

class ColorManager{
  static Color primary = HexColor.fromHex("#091329");
  static Color secondary = HexColor.fromHex("#50b6de");
  static Color lightGreen = HexColor.fromHex("#11ac60");
  static Color lightPrink = HexColor.fromHex("#e42657");

  static Color darkPrimary = HexColor.fromHex("#d17d11");
  static Color grey1 = HexColor.fromHex("#707070");
  static Color grey2 = HexColor.fromHex("#797979");
  static Color white = HexColor.fromHex("#FFFFFF");
  static Color error = HexColor.fromHex("#e61f34");
  static Color black = HexColor.fromHex("#000000");
}

extension HexColor on Color{
  static Color fromHex(String hexColorString){
    hexColorString = hexColorString.replaceAll("#", "");
    if(hexColorString.length == 6){
      hexColorString = "FF$hexColorString";
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}