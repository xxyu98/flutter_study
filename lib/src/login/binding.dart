import 'package:get/get.dart';
import 'package:nb_app/src/login/api/login.dart';

class UserInfoBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UserInfoRepository());
  }
}
