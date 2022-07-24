import 'package:flutter/material.dart';

class SignInButton extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const SignInButton(this._signInFunction);

  final Function _signInFunction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextButton(
        onPressed: _signInFunction(),
        child: const Text(
          'Entrar',
          style: TextStyle(
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}