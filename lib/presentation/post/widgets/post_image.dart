import 'package:flutter/material.dart';

class PostImage extends StatelessWidget {
  const PostImage({Key? key, required this.image}) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Image.network(image),
    );
  }
}
