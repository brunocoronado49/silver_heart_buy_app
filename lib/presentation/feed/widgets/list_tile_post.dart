import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ListTilePost extends StatelessWidget {
  ListTilePost({Key? key, required this.title, this.onTap, required this.seller, required this.price}) : super(key: key);

  final String title;
  final String seller;
  final String price;
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
      subtitle: Text(seller),
      trailing: Text("Precio(MXN): $price"),
      onTap: onTap,
    );
  }
}
