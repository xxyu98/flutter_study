import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nb_app/src/article/page/list.dart';
import 'package:nb_app/src/compass/page/compass.dart';
import 'package:nb_app/src/profile/page/profile.dart';
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';

void main() {
  runApp(const HomePage());
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Color navigationBarColor = Colors.white;
  int selectedIndex = 2;
  late PageController pageController;
  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        systemNavigationBarColor: navigationBarColor,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: pageController,
          children: [
            const ArticleListPage(),
            const CompassPage(),
            ProfilePage()
          ],
        ),
        bottomNavigationBar: WaterDropNavBar(
          backgroundColor: navigationBarColor,
          onItemSelected: (int index) {
            setState(() {
              selectedIndex = index;
            });
            pageController.animateToPage(
              selectedIndex,
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeOutQuad,
            );
          },
          selectedIndex: selectedIndex,
          barItems: <BarItem>[
            BarItem(
              filledIcon: Icons.book,
              outlinedIcon: Icons.book_outlined,
            ),
            BarItem(
              filledIcon: Icons.compass_calibration,
              outlinedIcon: Icons.compass_calibration_outlined,
            ),
            BarItem(
              filledIcon: Icons.person,
              outlinedIcon: Icons.person_2_outlined,
            ),
          ],
        ),
      ),
    );
  }
}
