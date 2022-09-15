import 'package:json_annotation/json_annotation.dart';

part 'dinsvResult.g.dart';

@JsonSerializable()
class DinsvResult {
  DinsvResult(
      {this.code, this.message, this.innerCode, this.innerDesc, this.token});

  ///返回码
  int? code;

  ///描述
  String? message;

  ///内层返回码
  int? innerCode;

  ///内层事件描述
  String? innerDesc;

  ///token
  String? token;

  ///反序列化
  factory DinsvResult.fromJson(Map<String, dynamic> json) =>
      _$DinsvResultFromJson(json);

  ///序列化
  Map<String, dynamic> toJson() => _$DinsvResultToJson(this);
}
