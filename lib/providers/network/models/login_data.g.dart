// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginData _$LoginDataFromJson(Map<String, dynamic> json) => LoginData(
      accessToken: json['access_token'] as String?,
    )
      ..refreshToken = json['refresh_token'] as String?
      ..expiresIn = json['expires_in'] as int?
      ..expiredAt = json['expired_at'] as String?
      ..expiredAtTimestamp = json['expired_at_timestamp'] as int?;

Map<String, dynamic> _$LoginDataToJson(LoginData instance) => <String, dynamic>{
      'access_token': instance.accessToken,
      'refresh_token': instance.refreshToken,
      'expires_in': instance.expiresIn,
      'expired_at': instance.expiredAt,
      'expired_at_timestamp': instance.expiredAtTimestamp,
    };
