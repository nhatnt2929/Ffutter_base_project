import 'dart:io';
import 'package:flutter/material.dart';

class CommonSize {
  late var screenSize;

  late double _maxWidth;
  late double _maxHeight;

  @override
  CommonSize(BuildContext context) {
    screenSize = MediaQuery.of(context).size;
    final padding = MediaQuery.of(context).padding;

    _maxWidth = screenSize.width;
    _maxHeight = screenSize.height - padding.top - padding.bottom;

    if (Platform.isAndroid) {
      _maxHeight = screenSize.height - padding.top - kToolbarHeight;
    } else if (Platform.isIOS) {
      var paddingBottom = padding.bottom;
      if (paddingBottom == 0 && screenSize.height < 790) {
        paddingBottom = 34;
      }
      _maxHeight = screenSize.height - padding.top - paddingBottom - 22;
    }
  }

  double getWidth() {
    return _maxWidth;
  }

  double getHeight() {
    return _maxHeight;
  }
}
