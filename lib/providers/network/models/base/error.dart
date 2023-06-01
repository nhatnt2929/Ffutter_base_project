class ErrorModel {
  int statusCode;
  String statusMessage;
  bool success;

  ErrorModel(this.statusCode, this.statusMessage, this.success);

  factory ErrorModel.fromJson(Map<String, dynamic> json) {
    return _$ErrorModelFromJson(json);
  }
  Map<String, dynamic> toJson() => _$ErrorModelToJson(this);
}

ErrorModel _$ErrorModelFromJson(Map<String, dynamic> json) => ErrorModel(
      json['status_code'] as int,
      json['message'] as String,
      json['success'] as bool,
    );

Map<String, dynamic> _$ErrorModelToJson(ErrorModel instance) =>
    <String, dynamic>{
      'status_code': instance.statusCode,
      'message': instance.statusMessage,
      'success': instance.success,
    };
