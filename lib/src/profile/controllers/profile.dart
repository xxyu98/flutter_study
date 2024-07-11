import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_app/src/login/controllers/login.dart';
import 'package:nb_app/src/login/model/user_info.dart';
import 'package:nb_app/src/profile/api/profile.dart';

class ChangeProfileController extends GetxController {
  final repo = Get.find<ProfileRepository>();

  final userController = Get.find<UserInfoController>();

  final error = Rxn(String);

  final isLoading = false.obs;

  final nickname = ''.obs;

  setNickname(String value) {
    nickname.value = value;
  }

  Future<void> changeNickname() async {
    try {
      isLoading(true);
      await repo.updateNickname(nickname.value);
      UserInfoModel userInfo = userController.readUserInfo();

      UserInfoModel updatedUserInfo = UserInfoModel(
        id: userInfo.id,
        username: userInfo.username,
        nickname: nickname.value,
        avatar: userInfo.avatar,
        email: userInfo.email,
        phone: userInfo.phone,
        token: userInfo.token,
      );

      userController.userInfo.value = updatedUserInfo;

      userController.writeUserInfo(updatedUserInfo);
      userController.setUsername(userInfo.username);
    } catch (e) {
      final detail = 'changeProfile error $e';
      debugPrint(detail);
    } finally {
      isLoading(false);
    }
  }
}
