import 'dart:convert';
import 'package:get/get.dart';
import 'package:nb_app/src/article/model/article.dart';
import '../../config.dart';

class ArticleRepository extends GetConnect {
  static ArticleRepository get to => Get.find();

  @override
  void onInit() {
    httpClient.baseUrl = AppConfig.baseUrl;
    super.onInit();
  }

  Future<List<ArticleModel>> getArticleList() async {
    const url = '/article/list';

    final response = await get(url);

    List<dynamic> jsonData = jsonDecode(response.body)['data'];

    List<ArticleModel> articles =
        jsonData.map((e) => ArticleModel.fromJson(e)).toList();

    return articles;
  }
}
