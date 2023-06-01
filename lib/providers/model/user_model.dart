import 'package:pes/providers/network/models/base/base_model.dart';

class User extends BaseModel {
  String idToken = '';
  String accessToken = '';
  String refreshToken = '';
  String name = '';
  String nickname = '';
  String email = '';
  bool isExistEX = false;
  String t2msession = '';

  User({
    required this.accessToken,
  });

  User.fromJson(Map<String, dynamic> json)
      : idToken = json['idToken'],
        accessToken = json['accessToken'],
        refreshToken = json['refreshToken'],
        name = json['name'],
        nickname = json['nickname'],
        isExistEX = json['isExist'],
        email = json['email'];

  Map<String, dynamic> toJson() => {
        'idToken': idToken,
        'accessToken': accessToken,
        'refreshToken': refreshToken,
        'name': name,
        'nickname': nickname,
        'isExistEX': isExistEX,
        'email': email,
      };
}
