import 'package:get/get.dart';
import 'package:nb_app/src/article/binding.dart';
import 'package:nb_app/src/article/page/detail.dart';
import 'package:nb_app/src/article/page/list.dart';
import 'package:nb_app/src/compass/page/compass.dart';
import 'package:nb_app/src/layout/layout.dart';
import 'package:nb_app/src/login/binding.dart';
import 'package:nb_app/src/login/page/login.dart';
import 'package:nb_app/src/profile/page/profile.dart';

class AppRoute {
  static final pages = [
    GetPage(
      name: '/',
      page: () => const HomePage(),
      binding: ArticleListBinding(),
    ),
    GetPage(
      name: '/login',
      page: () => const LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: '/profile',
      page: () => ProfilePage(),
    ),
    GetPage(
      name: '/article',
      page: () => const ArticleListPage(),
    ),
    GetPage(
      name: '/article/:articleId',
      page: () => const ArticleDetailPage(),
    ),
    GetPage(
      name: '/compass',
      page: () => const CompassPage(),
    ),
  ];
}
