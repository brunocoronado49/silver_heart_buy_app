import 'package:flutter/material.dart';
import 'package:silver_heart_buy/presentation/post/widgets/post_image.dart';
import 'package:silver_heart_buy/presentation/profile/widgets/profile_post_info.dart';

class ProfilePostDetailScreen extends StatelessWidget {
  const ProfilePostDetailScreen({Key? key, required this.name, required this.description, required this.price, required this.seller, required this.imageUrl, required this.ref, required this.uid, required this.type}) : super(key: key);

  final String name;
  final String description;
  final String price;
  final String seller;
  final String imageUrl;
  final String ref;
  final String uid;
  final String type;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            PostImage(
              imageUrl: imageUrl,
              uid: uid,
              type: type,
            ),
            const SizedBox(height: 20),
            ProfilePostInfo(
              name: name,
              price: price,
              description: description,
              seller: seller,
              ref: ref,
            )
          ],
        ),
      ),
    );
  }
}