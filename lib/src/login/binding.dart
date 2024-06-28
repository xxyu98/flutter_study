import 'package:get/get.dart';
import 'package:nb_app/src/login/api/login.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginRepository());
  }
}
