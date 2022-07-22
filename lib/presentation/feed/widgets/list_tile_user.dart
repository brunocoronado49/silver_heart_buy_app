import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ListTileUser extends StatelessWidget {
  ListTileUser({Key? key, required this.title, required this.description, this.onTap}) : super(key: key);

  final String title;
  final String description;
  VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      subtitle: Text(description),
      onTap: onTap,
    );
  }
}
