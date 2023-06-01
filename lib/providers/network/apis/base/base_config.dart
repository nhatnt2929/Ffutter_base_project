import 'package:dio/dio.dart';

import 'package:injectable/injectable.dart';
import 'package:pes/providers/local/shared_prefs.dart';
import 'package:pes/providers/network/dio_api/api_constant.dart';
import 'package:pes/repository/dio_api/dio_config.dart';

class ApiKeys {
  static const defaultConnectTimeout = Duration.millisecondsPerMinute;
  static const defaultReceiveTimeout = Duration.millisecondsPerMinute;
  static const contentTypeKey = 'Content-Type';
  static const contentTypeValue = 'application/json; charset=UTF-8';
  static const authorizationKey = 'token';
  static const previTokenStype = '';
  static const unAuthorizationCodes = [401, 403];
}

@injectable
class Configs {
  static DioConfig get config => DioConfig(
        Dio(),
        baseUrl: ApiConstants.baseURL,
        defaultConnectTimeout: ApiKeys.defaultConnectTimeout,
        defaultReceiveTimeout: ApiKeys.defaultReceiveTimeout,
        headers: {
          ApiKeys.contentTypeKey: ApiKeys.contentTypeValue,
          ApiKeys.authorizationKey:
              '${ApiKeys.previTokenStype} ${SharedPrefs.instance.getUser()?.accessToken}'
        },
        unAuthorizationCodes: ApiKeys.unAuthorizationCodes,
      );
}
