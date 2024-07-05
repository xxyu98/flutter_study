import 'package:get/get.dart';
import 'package:nb_app/src/article/binding.dart';
import 'package:nb_app/src/article/page/list.dart';
import 'package:nb_app/src/compass/page/compass.dart';
import 'package:nb_app/src/layout/layout.dart';
import 'package:nb_app/src/login/binding.dart';
import 'package:nb_app/src/login/page/login.dart';
import 'package:nb_app/src/profile/page/profile.dart';
import 'package:nb_app/src/routes/middleware/auth.dart';

class AppRoute {
  static final pages = [
    GetPage(
      name: '/',
      page: () => const HomePage(),
      binding: ArticleListBinding(),
      middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: '/login',
      page: () => const LoginPage(),
      binding: UserInfoBinding(),
    ),
    GetPage(
      name: '/profile',
      page: () => const ProfilePage(),
      binding: UserInfoBinding(),
    ),
    GetPage(
      name: '/article',
      page: () => const ArticleListPage(),
    ),
    GetPage(
      name: '/compass',
      page: () => const CompassPage(),
    ),
  ];
}
