import 'package:get/get.dart';
import 'package:nb_app/src/article/binding.dart';
import 'package:nb_app/src/article/page/list.dart';
import 'package:nb_app/src/compass/page/compass.dart';
import 'package:nb_app/src/layout/layout.dart';
import 'package:nb_app/src/login/page/login.dart';
import 'package:nb_app/src/profile/binging.dart';
import 'package:nb_app/src/profile/page/user_avatar.dart';
import 'package:nb_app/src/profile/page/profile.dart';
import 'package:nb_app/src/profile/page/setting.dart';
import 'package:nb_app/src/profile/page/user_nickname.dart';
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
    ),
    GetPage(
      name: '/profile',
      page: () => ProfilePage(),
      children: [
        GetPage(
          name: '/setting',
          page: () => SettingPage(),
        ),
        GetPage(
          name: '/avatar',
          page: () => const AvatarPage(),
        ),
        GetPage(
          name: '/nickname',
          page: () => const NicknamePage(),
          binding: ProfileBinding(),
        ),
      ],
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
