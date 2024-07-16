import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nb_app/src/common/components/icon_font.dart';
import 'package:nb_app/src/compass/page/compass.dart';
import 'package:nb_app/src/monitor/page/monitor.dart';
import 'package:nb_app/src/profile/page/profile.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

void main() async {
  runApp(const HomePage());
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MyHomePage();
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
      value: const SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: pageController,
          children: [const MonitorPage(), const CompassPage(), ProfilePage()],
        ),
        bottomNavigationBar: ConvexAppBar(
          color: const Color.fromRGBO(191, 191, 191, 1),
          activeColor: const Color(0xFF694EEA),
          backgroundColor: Colors.white,
          style: TabStyle.react,
          items: const <TabItem>[
            TabItem(
              title: '监控',
              icon: Icon(
                IconFonts.hound,
                color: Color.fromRGBO(191, 191, 191, 1),
                size: 22,
              ),
              activeIcon: Icon(
                IconFonts.hound,
                color: Color(0xFF694EEA),
                size: 30,
              ),
            ),
            TabItem(
              title: '罗盘',
              icon: Icon(
                IconFonts.compass,
                color: Color.fromRGBO(191, 191, 191, 1),
                size: 22,
              ),
              activeIcon: Icon(
                IconFonts.compass,
                color: Color(0xFF694EEA),
                size: 30,
              ),
            ),
            TabItem(
              title: '我的',
              icon: Icon(
                IconFonts.profile,
                color: Color.fromRGBO(191, 191, 191, 1),
                size: 22,
              ),
              activeIcon: Icon(
                IconFonts.profile,
                color: Color(0xFF694EEA),
                size: 30,
              ),
            ),
          ],
          initialActiveIndex: selectedIndex,
          onTap: (int index) {
            setState(() {
              selectedIndex = index;
            });
            pageController.animateToPage(
              selectedIndex,
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeOutQuad,
            );
          },
        ),
      ),
    );
  }
}
