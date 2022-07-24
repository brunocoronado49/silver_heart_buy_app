import 'package:flutter/material.dart';
import 'package:silver_heart_buy/presentation/intro/widgets/onboarding_page.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);
  static Widget create(BuildContext context) => const IntroScreen();

  
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: OnBoardingPage(),
    );
  }
}