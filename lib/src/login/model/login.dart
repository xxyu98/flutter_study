import 'package:freezed_annotation/freezed_annotation.dart';

part 'login.freezed.dart'; // 自动生成的文件，包含 freezed 类定义
part 'login.g.dart'; // 自动生成的文件，包含 JSON 序列化/反序列化的支持

@freezed
class LoginModel with _$LoginModel {
  factory LoginModel({
    required bool success,
    required String message,
    required String token,
  }) = _LoginModel;

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      _$LoginModelFromJson(json);
}
