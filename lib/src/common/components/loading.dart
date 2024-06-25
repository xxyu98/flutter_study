import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('loading')),
      body: const Center(
        child: CircularProgressIndicator(
          color: Colors.purple,
          semanticsLabel: '加载中...',
        ),
      ),
    );
  }
}