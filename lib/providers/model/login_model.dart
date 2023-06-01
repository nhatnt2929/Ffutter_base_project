import 'package:pes/providers/network/models/base/base_model.dart';

class LoginModel extends BaseModel {
  final String idToken;
  final String accessToken;
  final String refreshToken;
  final int expiredIn;
  final String expiredAt;
  final int? expiredAtTimestamp;
  final String email;
  final String nickname;
  final String name;
  bool isExistEX = false;

  LoginModel({
    required this.email,
    required this.nickname,
    required this.name,
    required this.idToken,
    required this.accessToken,
    required this.refreshToken,
    required this.expiredIn,
    required this.expiredAt,
    this.expiredAtTimestamp,
    required this.isExistEX,
  });
}
