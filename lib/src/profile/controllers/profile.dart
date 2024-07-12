import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nb_app/src/login/controllers/login.dart';
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

  final avatar = ''.obs;

  setAvatar(String value) {
    avatar.value = value;
  }

  Future<void> changeNickname() async {
    try {
      isLoading(true);
      await repo.updateNickname(nickname.value);
      userController.initUserInfo(
        userController.userInfo.value!.copyWith(nickname: nickname.value),
      );
    } catch (e) {
      final detail = 'changeNickname error $e';
      debugPrint(detail);
    } finally {
      isLoading(false);
    }
  }

  final file = Rxn<File>();

  Future<void> pickCropImage(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);

    if (image == null) {
      return;
    }

    final croppedFile = await ImageCropper().cropImage(
      sourcePath: image.path,
      aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: '头像裁剪',
          cropGridColor: const Color(0xFF694EEA),
          initAspectRatio: CropAspectRatioPreset.square,
          lockAspectRatio: true,
        ),
        IOSUiSettings(
          minimumAspectRatio: 1,
          title: '头像裁剪',
          doneButtonTitle: '确定',
          cancelButtonTitle: '取消',
        ),
      ],
    );

    if (croppedFile == null) {
      return;
    }

    file.value = File(croppedFile.path);
  }

  Future<void> changeAvatar(File file) async {
    try {
      isLoading(true);
      final url = await repo.updateFile(file);

      setAvatar(url);

      try {
        await repo.updateAvatar(url);

        userController.initUserInfo(
          userController.userInfo.value!.copyWith(avatar: url),
        );
      } catch (e) {
        final detail = 'changeAvatar error $e';
        debugPrint(detail);
      } finally {
        isLoading(false);
      }
    } catch (e) {
      final detail = 'updateAvatar error $e';
      debugPrint(detail);
    } finally {
      isLoading(false);
    }
  }
}
