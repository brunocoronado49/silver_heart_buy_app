import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);
  static Widget create(BuildContext context) => const SignInScreen();
  
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
         child: Text('SignInScreen'),
      ),
    );
  }
}