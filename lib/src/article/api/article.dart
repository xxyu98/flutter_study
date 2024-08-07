import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nb_app/src/article/model/article.dart';
import 'package:nb_app/src/login/model/user_info.dart';
import '../../config.dart';

class ArticleRepository extends GetConnect {
  static ArticleRepository get to => Get.find();

  final box = GetStorage();

  @override
  void onInit() {
    httpClient.baseUrl = AppConfig.baseUrl;
    super.onInit();
  }

  Future<List<ArticleModel>> getArticleList() async {
    const url = '/my/article/cates';

    final userInfo = UserInfoModel.fromJson(box.read('userInfo'));

    final response = await get(url, headers: {'Authorization': userInfo.token});

    List<dynamic> jsonData = response.body['data'];

    List<ArticleModel> articles =
        jsonData.map((e) => ArticleModel.fromJson(e)).toList();

    return articles;
  }
}
