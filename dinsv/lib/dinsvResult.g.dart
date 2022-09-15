// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dinsvResult.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DinsvResult _$DinsvResultFromJson(Map<String, dynamic> json) {
  return DinsvResult(
    code: json['code'] as int?,
    message: json['message'] as String?,
    innerCode: json['innerCode'] as int?,
    innerDesc: json['innerDesc'] as String?,
    token: json['token'] as String?,
  );
}

Map<String, dynamic> _$DinsvResultToJson(DinsvResult instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'innerCode': instance.innerCode,
      'innerDesc': instance.innerDesc,
      'token': instance.token,
    };
