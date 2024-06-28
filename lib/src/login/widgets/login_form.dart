import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_app/src/login/controllers/login.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    final formKey = GlobalKey<FormState>();

    return Obx(
      () => Column(
        children: [
          Form(
            key: formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                TextFormField(
                  autofocus: true,
                  decoration: const InputDecoration(
                    hintText: "请输入账号",
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromRGBO(234, 234, 234, 1),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF694EEA),
                      ),
                    ),
                  ),
                  initialValue: controller.username.value,
                  validator: (v) {
                    return v!.trim().isNotEmpty ? null : "账号不能为空";
                  },
                  onChanged: (value) {
                    controller.setUsername(value);
                  },
                ),
                const SizedBox(height: 24),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: "请输入密码",
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromRGBO(234, 234, 234, 1),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF694EEA),
                      ),
                    ),
                  ),
                  initialValue: controller.password.value,
                  validator: (v) {
                    return v!.trim().length > 4 ? null : "密码不能少于4位";
                  },
                  onChanged: (value) {
                    controller.setPassword(value);
                  },
                ),
                const SizedBox(height: 8),
                FormField<bool>(
                  initialValue: controller.isChecked.value,
                  validator: (value) {
                    if (value == null || !value) {
                      return '请先勾选用户协议';
                    }
                    return null;
                  },
                  builder: (FormFieldState<bool> state) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              value: state.value,
                              onChanged: (value) {
                                state.didChange(value);
                                controller.setIsChecked(value);
                              },
                            ),
                            const Text(
                              '我已阅读并同意',
                              style: TextStyle(color: Colors.grey),
                            ),
                            const Text(
                              '《用户协议》',
                              style: TextStyle(color: Color(0xFF694EEA)),
                            ),
                            const Text(
                              '《隐私政策》',
                              style: TextStyle(color: Color(0xFF694EEA)),
                            ),
                          ],
                        ),
                        if (state.hasError)
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 5),
                            child: Text(
                              state.errorText ?? '',
                              style: const TextStyle(
                                color: Color.fromRGBO(186, 26, 26, 1),
                                fontSize: 12,
                              ),
                            ),
                          ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 59),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF694EEA),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      "登录",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  onPressed: () {
                    if (!(formKey.currentState as FormState).validate()) {
                      return;
                    }
                    controller.login().then((value) {
                      if (controller.error.value == null) {
                        Get.toNamed('/');
                      }
                    });
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const SizedBox(
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '忘记密码？',
                  style: TextStyle(color: Colors.grey, fontSize: 13),
                ),
                Text(
                  '注册账号',
                  style: TextStyle(color: Colors.grey, fontSize: 13),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
