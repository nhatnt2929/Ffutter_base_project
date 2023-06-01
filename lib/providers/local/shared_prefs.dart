import 'dart:convert';
import 'package:pes/providers/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_udid/flutter_udid.dart';
part 'shared_prefs_key.dart';

class SharedPrefs {
  late SharedPreferences _prefs;
  static final SharedPrefs _singleton = SharedPrefs();

  static SharedPrefs get instance => _singleton;

  Future<void> setup() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<String> getUniqueDeviceId() async {
    return await FlutterUdid.udid;
  }

  bool get isSigned => (getUser()?.accessToken ?? '').isNotEmpty;

  String get idToken {
    if (!_prefs.containsKey(SharedPrefsKey.idToken)) return '';
    return _prefs.getString(SharedPrefsKey.idToken) ?? '';
  }

  set idToken(String value) {
    _prefs.setString(SharedPrefsKey.idToken, value);
  }

  //
  set isLogined(bool value) {
    _prefs.setBool(SharedPrefsKey.isLogined, value);
  }

  bool get isLogined {
    if (_prefs.containsKey(SharedPrefsKey.isLogined) == false) return false;
    return _prefs.getBool(SharedPrefsKey.isLogined) ?? false;
  }
  //

  String get refreshToken {
    if (!_prefs.containsKey(SharedPrefsKey.refreshToken)) return '';
    return _prefs.getString(SharedPrefsKey.refreshToken) ?? '';
  }

  set refreshToken(String value) {
    _prefs.setString(SharedPrefsKey.refreshToken, value);
  }

  String get accessToken {
    if (!_prefs.containsKey(SharedPrefsKey.accessToken)) return '';
    return _prefs.getString(SharedPrefsKey.accessToken) ?? '';
  }

  set accessToken(String value) {
    _prefs.setString(SharedPrefsKey.accessToken, value);
  }

  int get accessTokenExpiredDate {
    if (!_prefs.containsKey(SharedPrefsKey.accessTokenExpiredDate)) return 0;
    return _prefs.getInt(SharedPrefsKey.accessTokenExpiredDate) ?? 0;
  }

  set accessTokenExpiredDate(int value) {
    _prefs.setInt(SharedPrefsKey.accessTokenExpiredDate, value);
  }

  bool get isExpiredAccessToken {
    final timeStamp = accessTokenExpiredDate;

    if (timeStamp == 0) return true;
    return DateTime.now().millisecondsSinceEpoch > timeStamp;
  }

  String get deviceId {
    if (!_prefs.containsKey(SharedPrefsKey.deviceID)) return '';
    return _prefs.getString(SharedPrefsKey.deviceID) ?? '';
  }

  set deviceId(String value) {
    _prefs.setString(SharedPrefsKey.deviceID, value);
  }

  Future clearUser() async {
    await _prefs.remove(SharedPrefsKey.accessToken);
    await _prefs.remove(SharedPrefsKey.accessTokenExpiredDate);
    await _prefs.remove(SharedPrefsKey.userProfile);
  }

  set user(User user) {
    final json = jsonEncode(user);
    _prefs.setString(SharedPrefsKey.userProfile, json);
  }

  bool get isExistUser {
    final user = getUser();
    return user?.isExistEX ?? false;
  }

  User? getUser() {
    if (_prefs.getString(SharedPrefsKey.userProfile) != null) {
      final userJson =
          json.decode(_prefs.getString(SharedPrefsKey.userProfile) ?? '');
      final userObject = User.fromJson(userJson);
      return userObject;
    } else {
      return null;
    }
  }

  clearAll() {
    accessToken = '';
    accessTokenExpiredDate = 0;
    clearUser();
  }
}
