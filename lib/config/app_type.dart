import 'package:flutter/material.dart';
import 'package:pes/config/app_colors.dart';

enum LoginType {
  normal,
  facebook,
  apple,
}

extension LoginTypeExt on LoginType {
  Color get colorButtonLoginType {
    switch (this) {
      case LoginType.normal:
        return AppColors.primary;
      case LoginType.facebook:
        return AppColors.mainBlack;
      case LoginType.apple:
        return AppColors.lightGray2;
    }
  }
}
