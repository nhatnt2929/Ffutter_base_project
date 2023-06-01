import 'package:injectable/injectable.dart';
import 'package:pes/providers/model/user_model.dart';
import 'package:pes/providers/local/shared_prefs.dart';
import 'package:pes/providers/network/apis/auth_api.dart';
import 'package:pes/providers/network/dio_api/api_result.dart';
import 'package:pes/providers/network/models/mapper/login_data_mapper.dart';
import 'package:pes/repository/dio_api/network_exceptions.dart';

abstract class IAuthenRepository {
  Future<ApiResult<User>> callLoginWithEmailPassword(
    String email,
    String password,
  );
  Future<User?> getCurrentUser();
  Future<void> signOut();
  Future<ApiResult<bool>> checkUserExistSystem();
}

@Injectable(as: IAuthenRepository)
class AuthenRepository extends IAuthenRepository {
  final LoginDataMapper loginDataMapper;
  final AuthAPI authAPI;

  AuthenRepository({required this.loginDataMapper, required this.authAPI});

  @override
  Future<ApiResult<User>> callLoginWithEmailPassword(
      String email, String password) async {
    final result = await authAPI.callLoginWithEmailPassword(email, password);
    return await result.when(success: (data) {
      return ApiResult.success(data);
    }, failure: (NetworkExceptions error) {
      return ApiResult.failure(error);
    });
  }

  @override
  Future<User?> getCurrentUser() async {
    return SharedPrefs.instance.isSigned
        ? SharedPrefs.instance.getUser()
        : null;
  }

  @override
  Future<void> signOut() async {
    SharedPrefs.instance.isLogined = false;
  }

  @override
  Future<ApiResult<bool>> checkUserExistSystem() async {
    final result = await authAPI.checkUserExistSystem();
    return result;
  }
}
