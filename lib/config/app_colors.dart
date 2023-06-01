import 'package:flutter/material.dart';

class AppColors {
  static Color lightGray2 = Color(0xFF898A8D);
  static Color textWhite = Colors.white;

  static Color mainWhite = hexToColor('#ffffff');
  static Color mainWhiteLowOne = hexToColor('#FCFCFC');

  static Color mainResultGray = hexToColor('#EFEFEF');

  static Color mainGray = hexToColor('#6E6A6A');
  static Color mainBlack = hexToColor('#000000');
  static Color mainRed = hexToColor('#F63C3C');

  static Color mainGreen = hexToColor('#2DB19A');
  static Color mainYellow = hexToColor('#FFE600');
  static Color mainPurple = hexToColor('#8A2DB1');

  static Color borderRedUnMatch = hexToColor('#FF0000');

  static Color primary = hexToColor('#262626');
  static Color hintText = hexToColor('#4b4b4b').withOpacity(0.42);
  static Color inputText = hexToColor('#4b4b4b');
  static Color mainWhiteSetting = hexToColor('#ffffff').withOpacity(0.91);
  static Color blurScanShowResult = hexToColor('#777474').withOpacity(0.49);
  static Color overlayColorCamera = Color.fromRGBO(0, 0, 0, 80);
  static Color? cardChart = Colors.grey[100];
  static Color cardChartBorder = Colors.grey.withAlpha(50);

  static Color vhMainBlue = hexToColor('#036E9B');
  static Color vhMainGray = hexToColor('#9CA3AF');
  static Color vhMainBgGray = hexToColor('#D9D9D9');
  static Color vhMainGreenLogo = hexToColor('#429D44');

  static Color vhMainLineGray = hexToColor('#787878');
  static Color vhtextGray = hexToColor('#6B6B6B');
}

Color hexToColor(String hex) {
  assert(RegExp(r'^#([0-9a-fA-F]{6})|([0-9a-fA-F]{8})$').hasMatch(hex),
      'hex color must be #rrggbb or #rrggbbaa');

  return Color(
    int.parse(hex.substring(1), radix: 16) +
        (hex.length == 7 ? 0xff000000 : 0x00000000),
  );
}
