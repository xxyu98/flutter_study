import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nb_app/src/login/api/login.dart';
import 'package:nb_app/src/login/model/user_info.dart';

class LoginController extends GetxController {
  final username = 'xxy'.obs;
  final password = '123456'.obs;
  final isChecked = false.obs;

  void setUsername(String value) {
    username.value = value;
  }

  void setPassword(String value) {
    password.value = value;
  }

  void setIsChecked(bool? value) {
    if (value == true) {
      isChecked.value = true;
    } else {
      isChecked.value = false;
    }
  }

  final isLoading = false.obs;

  final error = Rxn<String>();

  final repo = Get.find<LoginRepository>();

  final userInfo = Rxn<UserInfoModel>();

  void setError(String? detail) {
    error.value = detail;
  }

  final box = GetStorage();

  Future<void> login() async {
    try {
      isLoading(true);
      error.value = null;
      userInfo.value = await repo.userLogin(username.value, password.value);
      box.write('userInfo', userInfo.value);
      Get.snackbar('welcome', '登录成功');
    } catch (e) {
      final detail = '发生错误 $e';
      Get.snackbar('登录失败', '请稍后重试');
      setError(detail);
    } finally {
      isLoading(false);
    }
  }
}
