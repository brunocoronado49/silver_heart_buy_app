import 'package:flutter/material.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({Key? key, this.avatar}) : super(key: key);

  final String? avatar;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(20)
        ),
      ),
      child: FadeInImage(
        image: NetworkImage(avatar!),
        placeholder: const AssetImage("assets/loading.gif"),
        width: double.infinity,
        height: 150,
        fit: BoxFit.cover,
        fadeInDuration: const Duration(milliseconds: 300),
      ),
    );
  }
}
