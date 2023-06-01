import 'package:flutter/material.dart';
import 'package:pes/presentation/common/common_size.dart';

class SizeApp extends CommonSize {
  SizeApp(BuildContext context) : super(context);

  double getQrcodeReaderHeight() {
    return this.getHeight() * 0.4;
  }

  double getOthersHeight() {
    return this.getHeight() * 0.6;
  }

  double getFirstAreaHeight() {
    return this.getHeight() * (10 / 100);
  }

  double getSecondAreaHeight() {
    return this.getHeight() * (90 / 100);
  }

  double getScreenWidth() {
    return super.getWidth();
  }

  double getScreenHeight() {
    return super.getHeight();
  }
}
