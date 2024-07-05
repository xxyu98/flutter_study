import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_info.freezed.dart';
part 'user_info.g.dart';

@freezed
class UserInfoModel with _$UserInfoModel {
  factory UserInfoModel({
    required int id,
    required String username,
    required String nickname,
    required String avatar,
    required String phone,
    required String email,
    required String token,
  }) = _UserInfoModel;

  factory UserInfoModel.fromJson(Map<String, dynamic> json) =>
      _$UserInfoModelFromJson(json);
}

class UserController extends GetxController {
  final box = GetStorage();
  Rx<UserInfoModel> userInfo = UserInfoModel(
    id: 0,
    username: '',
    nickname: '',
    avatar: '',
    phone: '',
    email: '',
    token: '',
  ).obs;

  UserController() {
    _initializeUserInfo();
  }

  void _initializeUserInfo() {
    Map<String, dynamic>? storedUserInfo =
        box.read<Map<String, dynamic>>('userInfo');
    if (storedUserInfo != null) {
      userInfo.value = UserInfoModel.fromJson(storedUserInfo);
    }
  }
}
