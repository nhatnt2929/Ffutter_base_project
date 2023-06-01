// ignore_for_file: depend_on_referenced_packages

import 'dart:io';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pes/providers/network/models/base/error.dart';
import 'package:pes/repository/dio_api/app_api_error_constants.dart';
part 'network_exceptions.freezed.dart';

@freezed
abstract class NetworkExceptions with _$NetworkExceptions {
  const factory NetworkExceptions.requestCancelled() = RequestCancelled;

  const factory NetworkExceptions.unauthorizedRequest(String reason) =
      UnauthorizedRequest;

  const factory NetworkExceptions.badRequest() = BadRequest;

  const factory NetworkExceptions.notFound(String reason) = NotFound;

  const factory NetworkExceptions.methodNotAllowed() = MethodNotAllowed;

  const factory NetworkExceptions.notAcceptable() = NotAcceptable;

  const factory NetworkExceptions.requestTimeout() = RequestTimeout;

  const factory NetworkExceptions.sendTimeout() = SendTimeout;

  const factory NetworkExceptions.conflict() = Conflict;

  const factory NetworkExceptions.internalServerError() = InternalServerError;

  const factory NetworkExceptions.notImplemented() = NotImplemented;

  const factory NetworkExceptions.serviceUnavailable() = ServiceUnavailable;

  const factory NetworkExceptions.noInternetConnection() = NoInternetConnection;

  const factory NetworkExceptions.formatException() = FormatException;

  const factory NetworkExceptions.unableToProcess() = UnableToProcess;

  const factory NetworkExceptions.defaultError(String error) = DefaultError;

  const factory NetworkExceptions.unexpectedError() = UnexpectedError;

  static NetworkExceptions handleResponse(Response? response) {
    ErrorModel? errorModel;
    try {
      errorModel = ErrorModel.fromJson(response?.data);
    } catch (_) {}

    int statusCode = response?.statusCode ?? 0;
    switch (statusCode) {
      case 400:
      case 401:
      case 403:
        return NetworkExceptions.unauthorizedRequest(
            errorModel?.statusMessage ?? AppApiErrorMessage.unexpectedError);
      case 500:
      case 404:
        return NetworkExceptions.notFound(
            errorModel?.statusMessage ?? AppApiErrorMessage.unexpectedError);
      case 409:
        return const NetworkExceptions.conflict();
      case 408:
        return const NetworkExceptions.requestTimeout();
      case 503:
        return const NetworkExceptions.serviceUnavailable();
      default:
        var responseCode = statusCode;
        return NetworkExceptions.defaultError(
          "Received invalid status code: $responseCode",
        );
    }
  }

  static NetworkExceptions getDioException(error) {
    if (error is Exception) {
      try {
        NetworkExceptions networkExceptions;
        if (error is DioError) {
          switch (error.type) {
            case DioErrorType.cancel:
              networkExceptions = const NetworkExceptions.requestCancelled();
              break;
            case DioErrorType.connectTimeout:
              networkExceptions = const NetworkExceptions.requestTimeout();
              break;
            case DioErrorType.other:
              networkExceptions =
                  const NetworkExceptions.noInternetConnection();
              break;
            case DioErrorType.receiveTimeout:
              networkExceptions = const NetworkExceptions.sendTimeout();
              break;
            case DioErrorType.response:
              networkExceptions =
                  NetworkExceptions.handleResponse(error.response);
              break;
            case DioErrorType.sendTimeout:
              networkExceptions = const NetworkExceptions.sendTimeout();
              break;
          }
        } else if (error is SocketException) {
          networkExceptions = const NetworkExceptions.noInternetConnection();
        } else {
          networkExceptions = const NetworkExceptions.unexpectedError();
        }
        return networkExceptions;
      } on FormatException catch (_) {
        return const NetworkExceptions.formatException();
      } catch (_) {
        return const NetworkExceptions.unexpectedError();
      }
    } else {
      if (error is DefaultError) {
        return NetworkExceptions.defaultError(error.error);
      } else if (error.toString().contains("is not a subtype of")) {
        return const NetworkExceptions.unableToProcess();
      } else {
        return const NetworkExceptions.unexpectedError();
      }
    }
  }

  static String getErrorMessage(NetworkExceptions networkExceptions) {
    var errorMessage = "";
    networkExceptions.when(notImplemented: () {
      errorMessage = AppApiErrorMessage.notImplemented;
    }, requestCancelled: () {
      errorMessage = AppApiErrorMessage.requestCancelled;
    }, internalServerError: () {
      errorMessage = AppApiErrorMessage.internalServerError;
    }, notFound: (String reason) {
      errorMessage = reason;
    }, serviceUnavailable: () {
      errorMessage = AppApiErrorMessage.serviceUnavailable;
    }, methodNotAllowed: () {
      errorMessage = AppApiErrorMessage.methodNotAllowed;
    }, badRequest: () {
      errorMessage = AppApiErrorMessage.badRequest;
    }, unauthorizedRequest: (String error) {
      errorMessage = error;
    }, unexpectedError: () {
      errorMessage = AppApiErrorMessage.unexpectedError;
    }, requestTimeout: () {
      errorMessage = AppApiErrorMessage.requestTimeout;
    }, noInternetConnection: () {
      errorMessage = AppApiErrorMessage.noInternetConnection;
    }, conflict: () {
      errorMessage = AppApiErrorMessage.conflict;
    }, sendTimeout: () {
      errorMessage = AppApiErrorMessage.sendTimeout;
    }, unableToProcess: () {
      errorMessage = AppApiErrorMessage.unableToProcess;
    }, defaultError: (String error) {
      errorMessage = error;
    }, formatException: () {
      errorMessage = AppApiErrorMessage.formatException;
    }, notAcceptable: () {
      errorMessage = AppApiErrorMessage.notAcceptable;
    });
    return errorMessage;
  }
}
