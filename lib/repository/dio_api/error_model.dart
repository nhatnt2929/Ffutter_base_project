import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class ErrorModel {
  @JsonKey(name: 'status')
  int statusCode;
  @JsonKey(name: 'message')
  String statusMessage;
  @JsonKey(name: 'error')
  String statusError;

  ErrorModel(this.statusCode, this.statusMessage, this.statusError);

  factory ErrorModel.fromJson(Map<String, dynamic> json) {
    return _$ErrorModelFromJson(json);
  }
  Map<String, dynamic> toJson() => _$ErrorModelToJson(this);
}

ErrorModel _$ErrorModelFromJson(Map<String, dynamic> json) => ErrorModel(
      json['status'] as int,
      json['message'] as String,
      json['error'] as String,
    );

Map<String, dynamic> _$ErrorModelToJson(ErrorModel instance) =>
    <String, dynamic>{
      'status_code': instance.statusCode,
      'message': instance.statusMessage,
      'success': instance.statusError,
    };
