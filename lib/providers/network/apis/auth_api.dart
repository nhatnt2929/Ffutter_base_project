import 'package:injectable/injectable.dart';
import 'package:pes/providers/model/user_model.dart';
import 'package:pes/providers/network/apis/base/application_dio.dart';
import 'package:pes/providers/network/apis/base/base_api.dart';
import 'package:pes/providers/network/dio_api/api_constant.dart';
import 'package:pes/providers/network/dio_api/api_result.dart';
import 'package:pes/repository/dio_api/network_exceptions.dart';

@injectable
class AuthAPI extends BaseApi {
  AuthAPI() : super(ApplicationDio().getDioClientEX());

  Future<ApiResult<User>> callLoginWithEmailPassword(
    String email,
    String password,
  ) async {
    try {
      final Map<String, dynamic> result = await dioClientEX.post(
          ApiConstants.login,
          data: {'username': email, 'password': password});
      final token = result['data']['token'];
      if (token != null) {
        return ApiResult.success(User(accessToken: token.toString()));
      } else {
        final userMsg = result['errors'][0]['userMsg'].toString();
        return ApiResult.failure(NetworkExceptions.defaultError(userMsg));
      }
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }

  Future<ApiResult<bool>> checkUserExistSystem() async {
    try {
      final Map<String, dynamic> result =
          await dioClientEX.get(ApiConstants.checkUserExist);
      final isExist = result['isExist'];
      return ApiResult.success(isExist);
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }
}
