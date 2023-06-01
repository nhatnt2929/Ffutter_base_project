import 'package:json_annotation/json_annotation.dart';
import 'package:pes/providers/network/models/base_data.dart';

part 'login_data.g.dart';

@JsonSerializable()
class LoginData extends BaseData {
  @JsonKey(name: 'access_token')
  String? accessToken;

  @JsonKey(name: 'refresh_token')
  String? refreshToken;

  @JsonKey(name: 'expires_in')
  int? expiresIn;

  @JsonKey(name: 'expired_at')
  String? expiredAt;

  @JsonKey(name: 'expired_at_timestamp')
  int? expiredAtTimestamp;
  

  LoginData({required this.accessToken});

  factory LoginData.fromJson(Map<String, dynamic> json) =>
      _$LoginDataFromJson(json);

  Map<String, dynamic> toJson() => _$LoginDataToJson(this);
}
