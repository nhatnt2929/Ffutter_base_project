import 'package:pes/repository/dio_api/dio_client.dart';

class BaseApi {
  late DioClient dioClientEX;
  BaseApi(DioClient client) {
    dioClientEX = client;
  }
}
