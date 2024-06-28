import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'dart:math' as math;

class CompassPage extends StatefulWidget {
  const CompassPage({super.key});

  @override
  State createState() => _CompassPageState();
}

class _CompassPageState extends State<CompassPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '罗盘',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromRGBO(31, 28, 43, 1),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 43),
        color: const Color.fromRGBO(31, 28, 43, 1),
        child: Center(
          child: StreamBuilder<CompassEvent>(
            stream: FlutterCompass.events,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Text('设备不支持指南针功能');
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              }

              CompassEvent? event = snapshot.data;
              double? direction = event?.heading;

              // 检查方向是否为null，如果是，将其设置为0
              if (direction == null) {
                return const Text('无法获取方向');
              }

              return Container(
                alignment: Alignment.center,
                child: Transform.rotate(
                  angle: (direction * (math.pi / 180) * -1),
                  child: Image.asset('assets/images/compass.png'),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
