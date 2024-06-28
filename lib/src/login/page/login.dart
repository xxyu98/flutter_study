import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:nb_app/src/login/widgets/login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 292,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/login_bg.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned.fill(
                  top: 292 - 46,
                  left: 0,
                  right: 0,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                      child: Container(
                        height: 100,
                        color: Colors.white.withOpacity(0.5),
                        child: Row(
                          children: [
                            Container(
                                width: 136,
                                height: 46,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/login_type.png'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                child: Stack(
                                  children: [
                                    const Center(
                                      child: Text(
                                        '密码登录',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Color.fromRGBO(51, 51, 51, 1),
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 38,
                                      left: 56,
                                      child: Container(
                                        margin: const EdgeInsets.only(top: 4),
                                        width: 24,
                                        height: 4,
                                        decoration: BoxDecoration(
                                          color: const Color(0xFF694EEA),
                                          borderRadius:
                                              BorderRadius.circular(2),
                                        ),
                                      ),
                                    )
                                  ],
                                ))
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 40),
              child: LoginForm(),
            )
          ],
        ),
      ),
    );
  }
}
