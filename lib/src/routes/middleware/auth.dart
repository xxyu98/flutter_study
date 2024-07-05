import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nb_app/src/login/model/user_info.dart';

class AuthMiddleware extends GetMiddleware {
  final box = GetStorage();

  @override
  RouteSettings? redirect(String? route) {
    readUserInfo() {
      try {
        return UserInfoModel.fromJson(box.read('userInfo'));
      } catch (e) {
        return null;
      }
    }

    final whiteList = ['/login'];

    final userInfo = readUserInfo();

    if (userInfo != null || whiteList.contains(route)) {
      return null;
    }
    return const RouteSettings(name: '/login');
  }
}
