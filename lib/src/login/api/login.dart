import 'package:get/get.dart';
import 'package:nb_app/src/config.dart';
import 'package:nb_app/src/login/model/login.dart';

class LoginRepository extends GetConnect {
  static LoginRepository get to => Get.find();

  @override
  void onInit() {
    httpClient.baseUrl = AppConfig.baseUrl;
    super.onInit();
  }

  // 这里不对还不会写但能跑
  Future<LoginModel> userLogin(String username, String password) async {
    const url = '/api/login';

    final response =
        await post(url, {'username': username, 'password': password});
    if (response.body['success']) {
      return LoginModel.fromJson(response.body);
    } else {
      if (response.body['message']) {
        throw ('${response.body['message']}');
      } else {
        throw ('登录失败');
      }
    }
  }
}
