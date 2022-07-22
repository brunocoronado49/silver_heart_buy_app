import 'package:flutter/material.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);
  static Widget create(BuildContext context) => const IntroScreen();

  
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
         child: Text('IntroScreen'),
      ),
    );
  }
}