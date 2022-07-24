import 'package:flutter/material.dart';

class EmailInput extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const EmailInput(this._emailCtrl);

  final TextEditingController _emailCtrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        autocorrect: false,
        keyboardType: TextInputType.emailAddress,
        controller: _emailCtrl,
        minLines: 1,
        maxLines: 2,
        decoration: const InputDecoration(
          labelText: 'Correo',
          prefixIcon: Icon(Icons.alternate_email_rounded),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))
          ),
        ),
        validator: (value) {
          if (value.toString().isEmpty) {
            return "Introduce un correo válido.";
          }
          return null;
        },
      ),
    );
  }
}