import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_info.freezed.dart';
part 'user_info.g.dart';

@freezed
class UserInfoModel with _$UserInfoModel {
  factory UserInfoModel({
    required int id,
    required String username,
    String? nickname,
    String? avatar,
    String? phone,
    String? email,
    required String token,
  }) = _UserInfoModel;

  factory UserInfoModel.fromJson(Map<String, dynamic> json) =>
      _$UserInfoModelFromJson(json);
}
