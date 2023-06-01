import 'package:dio/dio.dart';

class DioConfig {
  final Dio dio;
  String? baseUrl;
  int? defaultConnectTimeout;
  int? defaultReceiveTimeout;
  Map<String, dynamic>? headers;
  List<int>? unAuthorizationCodes;

  DioConfig(
    this.dio, {
    this.baseUrl,
    this.defaultConnectTimeout,
    this.defaultReceiveTimeout,
    this.headers,
    this.unAuthorizationCodes,
  });
}
