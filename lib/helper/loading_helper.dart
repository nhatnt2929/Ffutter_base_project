import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:pes/config/app_constants.dart';

// bool isShowLoading = false;

class LoadingHelper {
  static Widget Function(BuildContext, Widget?) initLoading() {
    return EasyLoading.init();
  }

  static void configLoading() {
    EasyLoading.instance
      ..maskType = EasyLoadingMaskType.black
      ..indicatorSize = 40.0
      ..radius = 10.0
      ..userInteractions = false
      ..dismissOnTap = false;
  }

  static void showLoading() {
    // if (isShowLoading) return;
    // print('===========ABC==========');
    // isShowLoading = true;
    EasyLoading.show();
    Future.delayed(const Duration(seconds: AppConstants.timeoutLoading), () {
      EasyLoading.dismiss();
    });
  }

  static void hiddenLoading() {
    // isShowLoading = false;
    EasyLoading.dismiss();
  }
}
