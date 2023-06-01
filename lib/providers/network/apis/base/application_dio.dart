import 'package:pes/providers/network/apis/base/base_config.dart';
import 'package:pes/repository/dio_api/dio_client.dart';

class ApplicationDio {
  static final ApplicationDio _singleton = ApplicationDio._internal();
  DioClient? dioClientEX;
  ApplicationDio._internal();

  factory ApplicationDio() => _singleton;

  DioClient getDioClientEX() {
    if (dioClientEX != null) return dioClientEX!;
    dioClientEX = DioClient(
      Configs.config,
      renewTokenCallBack: () async {},
    );
    return dioClientEX!;
  }
}
