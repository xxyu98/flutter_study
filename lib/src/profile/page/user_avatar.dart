import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:nb_app/src/login/controllers/login.dart';

class AvatarPage extends StatelessWidget {
  const AvatarPage({super.key});

  @override
  Widget build(BuildContext context) {
    final userController = Get.find<UserInfoController>();

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
            CircleAvatar(
              radius: 150,
              backgroundImage: NetworkImage(userController
                      .userInfo.value?.avatar ??
                  'https://houndpos.oss-cn-hangzhou.aliyuncs.com/profile/banner.png'),
            ),
            const Gap(40),
            OutlinedButton(
              onPressed: () {},
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
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
