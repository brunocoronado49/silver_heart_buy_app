import 'package:flutter/material.dart';
import 'package:silver_heart_buy/models/models.dart';
import 'package:silver_heart_buy/presentation/user/widgets/user_avatar.dart';
import 'package:silver_heart_buy/presentation/user/widgets/user_info.dart';
import 'package:silver_heart_buy/presentation/user/widgets/user_social_media.dart';

class UserDetailScreen extends StatelessWidget {
  const UserDetailScreen({Key? key, required this.name, required this.description, required this.email, required this.address, required this.image, required this.user, required this.phone, required this.web}) : super(key: key);

  final String name;
  final String description;
  final String email;
  final String address;
  final String image;
  final String phone;
  final String web;
  final MyUser user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: ListView(
        children: [
           Container(
            padding: const EdgeInsets.all(10),
            child: UserAvatar(avatar: image)
          ),
          UserInfo(
            name: name,
            description: description,
            email: email,
            address: address,
            phone: phone,
            web: web,
          ),
          const UserSocialMedia(),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}