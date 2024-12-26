import 'dart:ui';

class HexColor  extends Color {

  HexColor(final String hexColor) : super(colorStringParseToHex(hexColor));

  static int colorStringParseToHex(String colorString) {
    var replaceAll = colorString.toUpperCase().replaceAll("#", "");
    if (replaceAll.length == 6) {
      replaceAll = "FF" + replaceAll;
    }
    return int.parse(replaceAll, radix: 16);
  }
}