import 'package:get/get.dart';
import 'package:nb_app/src/article/binding.dart';
import 'package:nb_app/src/article/page/detail.dart';
import 'package:nb_app/src/article/page/list.dart';
import 'package:nb_app/src/profile/page/profile.dart';

class AppRoute {
  static final pages = [
    GetPage(
      name: '/',
      page: () => const ArticleListPage(),
      binding: ArticleListBinding(),
    ),
    GetPage(
      name: '/profile',
      page: () => const ProfilePage(),
    ),
    GetPage(
      name: '/article/:articleId',
      page: () => const ArticleDetailPage(),
    )
  ];
}
