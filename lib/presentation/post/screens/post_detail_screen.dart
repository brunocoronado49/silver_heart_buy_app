import 'package:flutter/material.dart';
import 'package:silver_heart_buy/presentation/post/widgets/post_image.dart';
import 'package:silver_heart_buy/presentation/post/widgets/post_info.dart';

class PostDetailScreen extends StatelessWidget {
  const PostDetailScreen(
      {Key? key,
      required this.name,
      required this.description,
      required this.price,
      required this.seller,
      required this.imageUrl})
      : super(key: key);

  final String name;
  final String description;
  final String price;
  final String seller;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            PostImage(image: imageUrl),
            const SizedBox(height: 20),
            PostInfo(
                name: name,
                price: price,
                description: description,
                seller: seller),
          ],
        ),
      ),
    );
  }
}
