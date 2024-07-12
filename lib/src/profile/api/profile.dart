import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_app/src/config.dart';
import 'package:nb_app/src/login/controllers/login.dart';

class ProfileRepository extends GetConnect {
  static ProfileRepository get to => Get.find();

  final userController = Get.find<UserInfoController>();

  @override
  void onInit() {
    httpClient.baseUrl = AppConfig.baseUrl;
    super.onInit();
  }

  Future<void> updateNickname(String nickname) async {
    String url = '/my/update/nickname';

    final params = {
      'nickname': nickname,
    };

    final response = await post(
      url,
      params,
      headers: {'Authorization': userController.userInfo.value!.token},
    );

    if (response.hasError) {
      return Future.error(Exception(response.statusText));
    }
  }

  Future<void> updateAvatar(String avatar) async {
    String url = '/my/update/avatar';

    debugPrint('updateAvatar $avatar');

    final params = {
      'avatar': avatar,
    };

    final response = await post(
      url,
      params,
      headers: {'Authorization': userController.userInfo.value!.token},
    );

    debugPrint('updateAvatar response ${response.bodyString}');

    if (response.hasError) {
      return Future.error(Exception(response.statusText));
    }
  }

  Future<String> updateFile(File file) async {
    String url = '/my/upload';

    debugPrint(file.path);
    final formData = FormData({
      'image': MultipartFile(file, filename: file.path.split('/').last),
    });

    final response = await post(
      url,
      formData,
      headers: {'Authorization': userController.userInfo.value!.token},
    );

    if (response.hasError) {
      return Future.error(Exception(response.statusText));
    }

    debugPrint(response.bodyString);
    return response.body['url'];
  }
}
