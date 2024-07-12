import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nb_app/src/login/controllers/login.dart';
import 'package:nb_app/src/profile/controllers/profile.dart';

class AvatarPage extends StatelessWidget {
  const AvatarPage({super.key});

  @override
  Widget build(BuildContext context) {
    final userController = Get.find<UserInfoController>();

    final profileController = Get.put(ChangeProfileController());

    return Scaffold(
      appBar: AppBar(
        title: const Text("头像详情"),
      ),
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Obx(
              () => CircleAvatar(
                radius: 150,
                backgroundImage: profileController.file.value == null
                    ? NetworkImage(userController.userInfo.value?.avatar ??
                        'https://houndpos.oss-cn-hangzhou.aliyuncs.com/profile/def_avatar.png')
                    : FileImage(profileController.file.value!),
              ),
            ),
            const Gap(40),
            OutlinedButton(
              onPressed: () {
                profileController.pickCropImage(ImageSource.gallery);
              },
              child: const Text(
                "从相册中选择",
                style: TextStyle(
                  fontSize: 16,
                  color: Color.fromRGBO(51, 51, 51, 1),
                ),
              ),
            ),
            const Gap(24),
            OutlinedButton(
              child: const Text(
                "拍一张照片",
                style: TextStyle(
                  fontSize: 16,
                  color: Color.fromRGBO(51, 51, 51, 1),
                ),
              ),
              onPressed: () {
                profileController.pickCropImage(ImageSource.camera);
              },
            ),
            const Gap(24),
            Obx(
              () => profileController.file.value == null
                  ? Container()
                  : FilledButton(
                      onPressed: () {
                        profileController
                            .changeAvatar(profileController.file.value!)
                            .then(
                          (value) {
                            Get.back();
                            Get.snackbar('提醒', '修改成功！');
                          },
                        ).catchError(
                          (e) {
                            Get.back();
                            Get.snackbar('提醒', '修改失败！请稍后重试');
                          },
                        );
                      },
                      style: ElevatedButton.styleFrom(),
                      child: const Text(
                        "上传为头像",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
            )
          ],
        ),
      ),
    );
  }
}
