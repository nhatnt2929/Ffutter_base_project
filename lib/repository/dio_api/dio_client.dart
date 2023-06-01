// ignore_for_file: avoid_single_cascade_in_expression_statements

import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pes/repository/dio_api/dio_config.dart';
import 'package:tuple/tuple.dart';

class DioClient {
  DioConfig config;
  Function()? renewTokenCallBack;

  late Dio _dio;
  bool _isWaitRefreshToken = false;
  List<Tuple2<ErrorInterceptorHandler, DioError>>? _requestsPending = [];

  Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );
    return _dio.request<dynamic>(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: options,
    );
  }

  Future<void> addOptionsDio() async {
    _dio
      ..options.baseUrl = config.baseUrl ?? ''
      ..options.connectTimeout = config.defaultConnectTimeout ?? 0
      ..options.receiveTimeout = config.defaultReceiveTimeout ?? 0
      ..httpClientAdapter
      ..options.headers = config.headers;
  }

  Future<void> addInterceptors() async {
    _dio
      ..interceptors.addAll([
        InterceptorsWrapper(onError: (error, handler) async {
          final statusCode = error.response?.statusCode;
          if ((config.unAuthorizationCodes ?? []).contains(statusCode)) {
            _requestsPending?.add(Tuple2(handler, error));
            if (_isWaitRefreshToken == false) {
              _isWaitRefreshToken = true;
              renewTokenCallBack?.call();
            }
            return;
          }
          handler.next(error);
        })
      ]);
  }

  DioClient(this.config, {this.renewTokenCallBack}) {
    _dio = config.dio;
    _dio.interceptors.clear();
    addOptionsDio();
    addInterceptors();
    if (kDebugMode) {
      _dio.interceptors.add(LogInterceptor(
          responseBody: true,
          error: true,
          requestHeader: false,
          responseHeader: false,
          request: false,
          requestBody: false));
    }
  }

  Future<dynamic> retryRequestsPending(DioConfig config) async {
    if ((_requestsPending ?? []).isEmpty) return;
    _requestsPending?.forEach((request) async {
      request.item2.requestOptions.headers = config.headers;
      final response = await _retry(request.item2.requestOptions);
      request.item1.resolve(response);
    });
    _requestsPending = [];
    _isWaitRefreshToken = false;
  }

  Future<dynamic> get(
    String uri, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      reloadConfig();
      var response = await _dio.get(
        uri,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      logSuccess(uri, response);
      return response.data;
    } on SocketException catch (e) {
      logError(uri, e.toString());
      throw SocketException(e.toString());
    } on FormatException catch (e) {
      logError(uri, e.toString());
      throw const FormatException("Unable to process the data");
    } catch (e) {
      logError(uri, e.toString());
      rethrow;
    }
  }

  void reloadConfig() {
    _dio = config.dio;
    _dio.interceptors.clear();
    addOptionsDio();
    addInterceptors();
  }

  Future<dynamic> post(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      reloadConfig();
      var response = await _dio.post(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      logSuccess(uri, response);
      return response.data;
    } on FormatException catch (e) {
      logError(uri, e.toString());
      throw const FormatException("Unable to process the data");
    } catch (e) {
      logError(uri, e.toString());
      rethrow;
    }
  }

  Future<dynamic> patch(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      reloadConfig();
      var response = await _dio.patch(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      logSuccess(uri, response);
      return response.data;
    } on FormatException catch (e) {
      logError(uri, e.toString());
      throw const FormatException("Unable to process the data");
    } catch (e) {
      logError(uri, e.toString());
      rethrow;
    }
  }

  Future<dynamic> delete(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    reloadConfig();
    try {
      var response = await _dio.delete(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      logSuccess(uri, response);
      return response.data;
    } on FormatException catch (e) {
      logError(uri, e.toString());
      throw const FormatException("Unable to process the data");
    } catch (e) {
      logError(uri, e.toString());
      rethrow;
    }
  }

  void logSuccess(String uri, Response<dynamic> response) {
    if (kDebugMode) {
      print("👍  $uri \nRESPONSE: $response");
    }
  }

  void logError(String uri, String error) {
    if (kDebugMode) {
      print("❌  $uri \nERROR: $error");
    }
  }
}
