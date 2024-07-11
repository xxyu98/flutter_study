import 'package:get/get.dart';
import 'package:nb_app/src/article/api/article.dart';

class ArticleListBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ArticleRepository());
  }
}
