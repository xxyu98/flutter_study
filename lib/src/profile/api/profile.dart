import 'package:get/get.dart';
import 'package:nb_app/src/config.dart';
import 'package:nb_app/src/login/controllers/login.dart';

class ProfileRepository extends GetConnect {
  static ProfileRepository get to => Get.find();

  final userController = Get.find<UserInfoController>();

  @override
  void onInit() {
    httpClient.baseUrl = AppConfig.baseUrl;
    super.onInit();
  }

  Future<void> updateNickname(String nickname) async {
    String url = '/my/update/nickname';

    final params = {
      'nickname': nickname,
    };

    final response = await post(
      url,
      params,
      headers: {'Authorization': userController.userInfo.value!.token},
    );

    if (response.hasError) {
      return Future.error(Exception(response.statusText));
    }
  }
}
