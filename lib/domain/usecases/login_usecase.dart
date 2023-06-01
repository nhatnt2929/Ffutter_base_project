import 'package:pes/providers/model/user_model.dart';
import 'package:pes/providers/network/dio_api/api_result.dart';
import 'package:pes/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

abstract class ILoginUseCase {
  Future<ApiResult<User>> callLoginWithEmailPassword(
      String email, String password);
  Future<ApiResult<bool>> checkUserExistSystem();
}

@Injectable(as: ILoginUseCase)
class LoginUseCase extends ILoginUseCase {
  final IAuthenRepository _authenRepo;
  LoginUseCase(this._authenRepo);

  @override
  Future<ApiResult<User>> callLoginWithEmailPassword(
      String email, String password) {
    return _authenRepo.callLoginWithEmailPassword(email, password);
  }

  @override
  Future<ApiResult<bool>> checkUserExistSystem() {
    return _authenRepo.checkUserExistSystem();
  }
}
