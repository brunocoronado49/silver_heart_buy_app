import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ListTileUser extends StatelessWidget {
  ListTileUser({Key? key, required this.title, required this.description, this.onTap, this.avatar}) : super(key: key);

  final String title;
  final String description;
  final String? avatar;
  VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ClipOval(
        child: CircleAvatar(
          backgroundColor: Colors.black,
          child: avatar != null
            ? Image.network(avatar!)
            : Image.asset("assets/profile-user.png"),
        ),
      ),
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
