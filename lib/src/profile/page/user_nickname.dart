import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:nb_app/src/common/components/toast.dart';
import 'package:nb_app/src/profile/controllers/profile.dart';

class NicknamePage extends StatelessWidget {
  const NicknamePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ChangeProfileController());

    final formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("修改昵称"),
      ),
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 40),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Form(
              key: formKey,
              child: TextFormField(
                autofocus: true,
                initialValue: controller.nickname.value,
                decoration: const InputDecoration(hintText: '昵称长度2~24个字符'),
                onChanged: (value) {
                  controller.setNickname(value);
                },
                validator: (v) {
                  if (v!.length > 6) {
                    return '昵称不能超过 6 位';
                  }
                  if (v.length < 2) {
                    return '昵称不能小于 2 位';
                  }
                  return v.trim().isNotEmpty ? null : "昵称不能为空";
                },
              ),
            ),
            const Gap(32),
            FilledButton(
              onPressed: () {
                if (!(formKey.currentState as FormState).validate()) {
                  return;
                }
                controller.changeNickname().then((value) {
                  CustomToast.showToast(
                    context,
                    "修改昵称成功！",
                    isSuccess: true,
                  );
                  Get.back();
                }).catchError((e) {
                  CustomToast.showToast(
                    context,
                    "修改昵称失败！",
                    isSuccess: false,
                  );
                });
              },
              child: const Text(
                "保存",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
