import 'package:get/get.dart';
import 'package:nb_app/src/profile/api/profile.dart';

class ProfileBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileRepository());
  }
}
