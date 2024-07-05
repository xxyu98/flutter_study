import 'package:get/get.dart';
import 'package:nb_app/src/config.dart';
import 'package:nb_app/src/login/model/user_info.dart';

class UserInfoRepository extends GetConnect {
  static UserInfoRepository get to => Get.find();

  @override
  void onInit() {
    httpClient.baseUrl = AppConfig.baseUrl;
    super.onInit();
  }

  Future<UserInfoModel> userLogin(String username, String password) async {
    String url = '/api/login';

    final params = {
      'username': username,
      'password': password,
    };

    final response = await post(url, params);

    if (response.body['success'] == true) {
      return UserInfoModel.fromJson(response.body['data']);
    } else {
      throw Exception(response.body['message']);
    }
  }
}
