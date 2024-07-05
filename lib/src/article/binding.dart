import 'package:get/get.dart';
import 'package:nb_app/src/article/api/article.dart';
import 'package:nb_app/src/login/api/login.dart';

class ArticleListBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ArticleRepository());
    Get.lazyPut(() => UserInfoRepository());
  }
}
