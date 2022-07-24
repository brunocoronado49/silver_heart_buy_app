import 'package:flutter/material.dart';

class SignUpButton extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const SignUpButton(this._signUpFunction);
  final Function _signUpFunction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextButton(
        onPressed: _signUpFunction(),
        child: const Text(
          'Registrarse',
          style: TextStyle(
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}