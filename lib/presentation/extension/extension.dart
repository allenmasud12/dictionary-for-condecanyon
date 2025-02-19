import 'package:flutter/material.dart';

extension View on num{
  Widget get height => SizedBox(height: toDouble(),);
  Widget get width => SizedBox(width: toDouble(),);
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