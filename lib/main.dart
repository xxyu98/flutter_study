import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_app/src/login/api/login.dart';
import 'package:nb_app/src/login/controllers/login.dart';
import 'package:nb_app/src/routes/routes.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  Get.put(UserInfoRepository(), permanent: true);
  Get.put(UserInfoController(), permanent: true);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'xxy',
      theme: ThemeData(
        useMaterial3: true,

        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF694EEA)),
        primaryColor: const Color(0xFF694EEA),
        fontFamily: 'PingFang SC',
        scaffoldBackgroundColor: const Color.fromRGBO(245, 245, 245, 1),

        // appBar
        appBarTheme: const AppBarTheme(
          color: Colors.white,
          titleTextStyle: TextStyle(
            fontSize: 16,
            color: Color.fromRGBO(51, 51, 51, 1),
          ),
          iconTheme: IconThemeData(
            size: 16,
            color: Color.fromRGBO(51, 51, 51, 1),
          ),
        ),

        // text
        textTheme: const TextTheme(
          bodyLarge: TextStyle(
            fontSize: 16,
            color: Color.fromRGBO(51, 51, 51, 1),
          ),
          bodyMedium: TextStyle(
            fontSize: 14,
            color: Color.fromRGBO(51, 51, 51, 1),
          ),
        ),

        // icon
        iconTheme: const IconThemeData(
          color: Color.fromRGBO(51, 51, 51, 1),
        ),

        // outlinedButtonTheme
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            side: WidgetStateProperty.all(
              const BorderSide(
                width: 1,
                color: Color.fromRGBO(217, 217, 217, 1),
              ),
            ),
            minimumSize: WidgetStateProperty.all(
              const Size.fromHeight(42),
            ),
          ),
        ),

        // filledButton
        filledButtonTheme: FilledButtonThemeData(
          style: ButtonStyle(
            minimumSize: WidgetStateProperty.all(const Size.fromHeight(42)),
            backgroundColor: WidgetStateProperty.all(const Color(0xFF694EEA)),
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
          ),
        ),

        // input
        inputDecorationTheme: InputDecorationTheme(
          contentPadding: const EdgeInsets.all(12),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromRGBO(234, 234, 234, 1),
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFF694EEA),
            ),
          ),
        ),
      ),
      initialRoute: '/',
      getPages: AppRoute.pages,
    );
  }
}
