import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class IconConstants {

  // 戻るボタン
  static SvgPicture backIcon({double? size}) {
    double _size = (size == null) ? 36.0 : size;
    return SvgPicture.asset(
      'assets/images/backIcon.svg',
      semanticsLabel: 'back',
      width: _size,
      height: _size,
    );
  }

  // ホームボタン
  static SvgPicture homeIcon({double? size}) {
    double _size = (size == null) ? 36.0 : size;
    return SvgPicture.asset(
      'assets/images/homeIcon.svg',
      semanticsLabel: 'home',
      width: _size,
      height: _size,
    );
  }

  // ホームボタン
  static SvgPicture logoIcon({double? size}) {
    double _size = (size == null) ? 36.0 : size;
    return SvgPicture.asset(
      'assets/images/logo.svg',
      semanticsLabel: 'logo',
      width: _size,
      height: _size,
    );
  }

    // ホームボタン
  static SvgPicture loadImageSvg(String imageName, {double? width, double? height}) {
    double _width = (width == null) ? 36.0 : width;
    double _height = (height == null) ? 36.0 : height;
    return SvgPicture.asset(
      'assets/images/$imageName',
      semanticsLabel: imageName,
      width: _width,
      height: _height,
    );
  }

  static SvgPicture loadImageSvgWithSize(String imageName, {double? size}) {
    double _width = (size == null) ? 36.0 : size;
    double _height = (size == null) ? 36.0 : size;
    return SvgPicture.asset(
      'assets/images/$imageName',
      semanticsLabel: imageName,
      width: _width,
      height: _height,
    );
  }

  // リストボタン（指示一覧画面）
  static const LIST = Icons.format_list_bulleted;
  // 設定ボタン（設定画面）
  static const SETTING = Icons.settings;
  // チェックボタン（照合画面）
  static SvgPicture collationIcon({double? size}) {
    double _size = (size == null) ? 36.0 : size;
    return SvgPicture.asset(
      'assets/images/collationIcon.svg',
      semanticsLabel: 'collationIcon',
      width: _size,
      height: _size,
    );
  }

  // 削除 (出荷指示)
  static const DELETE = Icons.delete;
  // 検索ボタン
  static const SEARCH = Icons.search_sharp;
  // 閉じるボタン
  static const CLOSE = Icons.close;
  // QRコードアイコン
  static SvgPicture qrcodeIcon({double? size}) {
    double _size = (size == null) ? 36.0 : size;
    return SvgPicture.asset(
      'assets/images/qrcode.svg',
      semanticsLabel: 'qrcode',
      width: _size,
      height: _size,
    );
  }

  static SvgPicture scanIcon({double? size}) {
    double _size = (size == null) ? 36.0 : size;
    return SvgPicture.asset(
      'assets/images/scanIcon.svg',
      semanticsLabel: 'scanIcon',
      width: _size,
      height: _size,
    );
  }

  static SvgPicture listIcon({double? size}) {
    double _size = (size == null) ? 36.0 : size;
    return SvgPicture.asset(
      'assets/images/listIcon.svg',
      semanticsLabel: 'list',
      width: _size,
      height: _size,
    );
  }


static SvgPicture settingIcon({double? size}) {
    double _size = (size == null) ? 36.0 : size;
    return SvgPicture.asset(
      'assets/images/settingIcon.svg',
      semanticsLabel: 'setting',
      width: _size,
      height: _size,
    );
  }

  // カメラ関係
  static const FLASH_ON = Icons.flash_on;
  static const FLASH_OFF = Icons.flash_off;
  static const RESTART = Icons.restart_alt;
  static const FLIP_CAMERA = Icons.flip_camera_ios;
  static SvgPicture reloadCameraIcon({double? size}) {
    double _size = (size == null) ? 36.0 : size;
    return SvgPicture.asset(
      'assets/images/reloadCameraIcon.svg',
      semanticsLabel: 'reloadCamera',
      width: _size,
      height: _size,
    );
  }

  static SvgPicture flashOnIcon({double? size}) {
    double _size = (size == null) ? 36.0 : size;
    return SvgPicture.asset(
      'assets/images/flashOnIcon.svg',
      semanticsLabel: 'flashOn',
      width: _size,
      height: _size,
    );
  }

  static SvgPicture flashOffIcon({double? size}) {
    double _size = (size == null) ? 36.0 : size;
    return SvgPicture.asset(
      'assets/images/flashOffIcon.svg',
      semanticsLabel: 'flashOff',
      width: _size,
      height: _size,
    );
  }

  static SvgPicture flipCameraIcon({double? size}) {
    double _size = (size == null) ? 36.0 : size;
    return SvgPicture.asset(
      'assets/images/flipCameraIcon.svg',
      semanticsLabel: 'flipCamera',
      width: _size,
      height: _size,
    );
  }

  // チェック
  static SvgPicture checkIcon({double? size}) {
    double _size = (size == null) ? 36.0 : size;
    return SvgPicture.asset(
      'assets/images/checkIcon.svg',
      semanticsLabel: 'check',
      width: _size,
      height: _size,
    );
  }

  // バツ
  static SvgPicture ngIcon({double? size}) {
    double _size = (size == null) ? 36.0 : size;
    return SvgPicture.asset(
      'assets/images/ngIcon.svg',
      semanticsLabel: 'ng',
      width: _size,
      height: _size,
    );
  }

  // dialog
  static SvgPicture warningIcon({double? size}) {
    double _size = (size == null) ? 36.0 : size;
    return SvgPicture.asset(
      'assets/images/warningIcon.svg',
      semanticsLabel: 'warning',
      width: _size,
      height: _size,
    );
  }

  static SvgPicture successIcon({double? size}) {
    double _size = (size == null) ? 36.0 : size;
    return SvgPicture.asset(
      'assets/images/successIcon.svg',
      semanticsLabel: 'success',
      width: _size,
      height: _size,
    );
  }

  static SvgPicture errorIcon({double? size}) {
    double _size = (size == null) ? 36.0 : size;
    return SvgPicture.asset(
      'assets/images/errorIcon.svg',
      semanticsLabel: 'error',
      width: _size,
      height: _size,
    );
  }

  static SvgPicture questionIcon({double? size}) {
    double _size = (size == null) ? 36.0 : size;
    return SvgPicture.asset(
      'assets/images/questionIcon.svg',
      semanticsLabel: 'check',
      width: _size,
      height: _size,
    );
  }

  // 完了
  static SvgPicture completeIcon({double? size}) {
    double _size = (size == null) ? 36.0 : size;
    return SvgPicture.asset(
      'assets/images/completeIcon.svg',
      semanticsLabel: 'complete',
      width: _size,
      height: _size,
    );
  }

  // 未完了
  static SvgPicture incompleteIcon({double? size}) {
    double _size = (size == null) ? 36.0 : size;
    return SvgPicture.asset(
      'assets/images/incompleteIcon.svg',
      semanticsLabel: 'incomplete',
      width: _size,
      height: _size,
    );
  }

  // ソート
  static SvgPicture sortIcon({double? size, Color? color}) {
    double _size = (size == null) ? 36.0 : size;
    Color _color = (color == null) ? Colors.white : color;
    return SvgPicture.asset(
      'assets/images/sortIcon.svg',
      semanticsLabel: 'sort',
      width: _size,
      height: _size,
      color: _color,
    );
  }

  // 虫眼鏡
  static SvgPicture loupeIcon({double? size}) {
    double _size = (size == null) ? 36.0 : size;
    return SvgPicture.asset(
      'assets/images/loupeIcon.svg',
      semanticsLabel: 'loupe',
      width: _size,
      height: _size,
    );
  }

  // リスト紙
  static SvgPicture listPaperIcon({double? size}) {
    double _size = (size == null) ? 36.0 : size;
    return SvgPicture.asset(
      'assets/images/listPaperIcon.svg',
      semanticsLabel: 'listPaper',
      width: _size,
      height: _size,
    );
  }
}
