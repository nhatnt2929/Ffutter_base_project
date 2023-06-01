import 'package:flutter/material.dart';
import 'package:pes/common/localization.dart';
import 'package:pes/config/app_colors.dart';
import 'package:pes/config/app_text_styles.dart';
import 'package:pes/config/icon.dart';
import 'package:pes/presentation/common/base_button.dart';
import 'package:ui_tool/ui_tool.dart';

class CustomizeDialog {
  static Future<dynamic> waringDialog({
    required BuildContext context,
    required String title,
    TextStyle? titleStyle,
    required String message,
    TextStyle? messageStyle,
    TextStyle? buttonStyle,
    required dynamic Function(BuildContext)? onPressedOk,
  }) {
    TextStyle _titleStyle = (titleStyle != null)
        ? titleStyle
        : TextStyle(
            fontSize: 28 * UI.ratio,
            fontWeight: FontWeight.bold,
          );
    TextStyle _messageStyle = (messageStyle != null)
        ? messageStyle
        : TextStyle(
            fontSize: 20 * UI.ratio,
          );
    return defaultDialog(
      context: context,
      status: DialogStatus.waring,
      titleWidget: Text(
        title,
        textScaleFactor: 1.0,
        style: _titleStyle,
      ),
      messageWidget: Text(
        message,
        textScaleFactor: 1.0,
        style: _messageStyle,
        textAlign: TextAlign.center,
      ),
      onPressedOk: onPressedOk,
      buttonStyle: buttonStyle,
    );
  }

  static Future<dynamic> successDialog({
    required BuildContext context,
    TextStyle? titleStyle,
    required String message,
    TextStyle? messageStyle,
    required dynamic Function(BuildContext)? onPressedOk,
  }) {
    TextStyle _titleStyle =
        (titleStyle != null) ? titleStyle : AppTextStyle.bold28White;
    TextStyle _messageStyle =
        (messageStyle != null) ? messageStyle : AppTextStyle.normal20White;
    return defaultDialog(
      context: context,
      status: DialogStatus.success,
      titleWidget: Text(
        Localization.localized(context).title_notification,
        textScaleFactor: 1.0,
        style: _titleStyle,
      ),
      messageWidget: Text(
        message,
        textScaleFactor: 1.0,
        style: _messageStyle,
        textAlign: TextAlign.center,
      ),
      onPressedOk: onPressedOk,
    );
  }

  static Future<dynamic> errorDialog({
    required BuildContext context,
    String? title,
    TextStyle? titleStyle,
    required String message,
    TextStyle? messageStyle,
    required dynamic Function(BuildContext)? onPressedOk,
  }) {
    TextStyle _titleStyle =
        (titleStyle != null) ? titleStyle : AppTextStyle.bold28White;
    TextStyle _messageStyle =
        (messageStyle != null) ? messageStyle : AppTextStyle.normal20White;
    return defaultDialog(
      context: context,
      status: DialogStatus.error,
      titleWidget: Text(
        title ?? 'Lỗi',
        textScaleFactor: 1.0,
        style: _titleStyle,
      ),
      messageWidget: Text(
        message,
        textScaleFactor: 1.0,
        style: _messageStyle,
        textAlign: TextAlign.center,
      ),
      onPressedOk: onPressedOk,
    );
  }

  static Future<dynamic> showPopUpNotScanWarning({
    required BuildContext context,
    required dynamic Function(BuildContext)? onPressOKPopup,
  }) {
    return CustomizeDialog.waringDialog(
      titleStyle: AppTextStyle.bold28White,
      messageStyle: AppTextStyle.normal20White,
      buttonStyle: AppTextStyle.normal23White,
      context: context,
      title: Localization.localized(context).warning_title_step_one,
      message: Localization.localized(context).warning_message_step_one,
      onPressedOk: (context) {
        onPressOKPopup!(context);
        Navigator.of(context, rootNavigator: true).pop();
      },
    );
  }

  static Future<dynamic> defaultDialog({
    required BuildContext context,
    required DialogStatus status,
    required Widget titleWidget,
    required Widget messageWidget,
    required dynamic Function(BuildContext)? onPressedOk,
    TextStyle? buttonStyle,
  }) {
    Widget dialogIcon;
    switch (status) {
      case DialogStatus.success:
        dialogIcon = IconConstants.successIcon(
          size: 80.0 * UI.ratio,
        );
        break;
      case DialogStatus.waring:
        dialogIcon = IconConstants.warningIcon(
          size: 80.0 * UI.ratio,
        );
        break;
      case DialogStatus.error:
        dialogIcon = IconConstants.errorIcon(
          size: 80.0 * UI.ratio,
        );
        break;
    }

    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return AlertDialog(
          backgroundColor: AppColors.mainGray,
          insetPadding: const EdgeInsets.all(8),
          title: Container(
            child: Column(
              children: <Widget>[
                dialogIcon,
                titleWidget,
              ],
            ),
          ),
          content: messageWidget,
          actions: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(bottom: 10.0),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 100),
                    child: BaseButton(
                      style: buttonStyle,
                      width: 220 * UI.ratio,
                      height: 45 * UI.ratio,
                      text: 'OK',
                      fontSize: 25 * UI.ratio,
                      onPressed: () => onPressedOk!(context),
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}

enum DialogStatus { error, waring, success }
