import 'package:injectable/injectable.dart';
import 'package:pes/providers/model/login_model.dart';
import 'package:pes/providers/network/models/login_data.dart';
import 'base/base_remote_data_mapper.dart';

@injectable
class LoginDataMapper extends BaseRemoteDataMapper<LoginData, LoginModel> {
  LoginDataMapper();
  @override
  LoginModel mapToEntity(LoginData? data) {
    return LoginModel(
      accessToken: data?.accessToken ?? '',
      refreshToken: data?.refreshToken ?? '',
      expiredIn: data?.expiresIn ?? 0,
      expiredAt: data?.expiredAt ?? '',
      expiredAtTimestamp: data?.expiredAtTimestamp ?? 0,
      email: '',
      idToken: '',
      name: '',
      nickname: '',
      isExistEX: false,
    );
  }
}
