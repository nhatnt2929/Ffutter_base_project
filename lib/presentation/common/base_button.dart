// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:pes/config/app_colors.dart';
import 'package:pes/presentation/common/hexa_color.dart';
import 'package:ui_tool/ui_tool.dart';

class BaseButton extends StatelessWidget {
  const BaseButton({
    Key? key,
    this.text,
    required this.onPressed,
    this.width,
    this.height,
    this.fontSize,
    this.colorCode,
    this.fontWeight,
    this.icon,
    this.style,
  }) : super(key: key);
  final String? text;
  final VoidCallback onPressed;
  final double? width;
  final double? height;
  final double? fontSize;
  final String? colorCode;
  final FontWeight? fontWeight;
  final TextStyle? style;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    String? _text = (text == null) ? '' : text;
    double? _width = (width == null) ? 130 * UI.ratio : width! * UI.ratio;
    double? _height = (height == null) ? 75 * UI.ratio : height! * UI.ratio;
    double? _fontSize =
        (fontSize == null) ? 40 * UI.ratio : fontSize! * UI.ratio;
    FontWeight? _fontWeight =
        (fontWeight == null) ? FontWeight.normal : fontWeight;
    HexColor? _hexColor =
        (colorCode == null) ? HexColor("#2DB19A") : HexColor(colorCode!);
    final mediaQueryData = MediaQuery.of(context);

    return MediaQuery(
        data: mediaQueryData.copyWith(textScaleFactor: 1.0),
        child: SizedBox(
          width: _width,
          height: _height,
          child: (icon == null)
              ? ElevatedButton(
                  child: Text(
                    _text!,
                    textScaleFactor: 1.0,
                    style: style ??
                        TextStyle(fontSize: _fontSize, fontWeight: _fontWeight),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: AppColors.vhMainBlue,
                    onPrimary: AppColors.mainWhite,
                  ),
                  onPressed: onPressed,
                )
              : ElevatedButton(
                  child: Icon(
                    icon,
                    color: Colors.white,
                    size: style?.fontSize ?? _fontSize,
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: _hexColor,
                    onPrimary: Colors.white,
                    shape: StadiumBorder(),
                  ),
                  onPressed: onPressed,
                ),
        ));
  }
}
