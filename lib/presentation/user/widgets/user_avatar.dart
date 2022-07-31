import 'package:flutter/material.dart';
import 'package:silver_heart_buy/theme/app_theme.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({Key? key, this.avatar}) : super(key: key);

  final String? avatar;

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: ClipOval(
        child: CircleAvatar(
          backgroundColor: AppTheme.thirdColor,
          radius: 70,
          child: avatar != null ?
            Image.network(avatar!) : 
            Image.asset("assets/profile-user.png")
        ),
      ),
    );
  }
}
