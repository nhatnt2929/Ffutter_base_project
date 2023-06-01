import 'package:pes/providers/local/shared_prefs.dart';
import 'package:pes/providers/network/dio_api/api_constant.dart';

class ExSingleton {
  static final ExSingleton _singleton = ExSingleton._internal();

  factory ExSingleton() {
    return _singleton;
  }

  ExSingleton._internal();

  void clearAll() {
    SharedPrefs.instance.clearAll();
  }
}
