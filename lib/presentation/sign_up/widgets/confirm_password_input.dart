import 'package:flutter/material.dart';

class ConfirmPasswordInput extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const ConfirmPasswordInput(
      this._confirmPasswordCtrl, this._showPassword, this._password);

  final TextEditingController _confirmPasswordCtrl;
  final bool _showPassword;
  final String _password;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        autocorrect: false,
        obscureText: !_showPassword,
        keyboardType: TextInputType.visiblePassword,
        controller: _confirmPasswordCtrl,
        decoration: const InputDecoration(
          prefixIcon: Icon(Icons.lock),
          labelText: "Confirma tu contraseña",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
        ),
        validator: (value) {
          if (value.toString().isEmpty || value.toString() != _password) {
            return "Las contraseñas no coinciden.";
          }
          return null;
        },
      ),
    );
  }
}