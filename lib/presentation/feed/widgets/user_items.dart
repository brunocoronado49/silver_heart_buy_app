import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:silver_heart_buy/core/helpers/carousel_options.dart';
import 'package:silver_heart_buy/models/models.dart';
import 'package:silver_heart_buy/presentation/feed/widgets/list_tile_user.dart';
import 'package:silver_heart_buy/theme/app_theme.dart';

class UserItems extends StatelessWidget {
  const UserItems({Key? key, required this.user}) : super(key: key);

  final MyUser user;

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> _userStream = 
    FirebaseFirestore.instance.collection("user")
      .where("id", isNotEqualTo: FirebaseAuth.instance.currentUser!.uid)
      .snapshots();

    return Container(
      padding: const EdgeInsets.all(10),
      child: StreamBuilder(
        stream: _userStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          return CarouselSlider(
            options: Carousel.options,
            items: snapshot.data?.docs.map((DocumentSnapshot document) {
               Map<String, dynamic> data = document.data()! as Map<String, dynamic>;

               return Builder(
                builder: (context) {
                  return Card(
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    color: AppTheme.backgroundColor,
                    child: Column(
                      children: [
                        FadeInImage(
                          image: NetworkImage(data["image"]),
                          placeholder: const AssetImage("assets/loading.gif"),
                          width: double.infinity,
                          height: 150,
                          fit: BoxFit.cover,
                          fadeInDuration: const Duration(milliseconds: 300),
                        ),
                        ListTileUser(
                          title: data["name"],
                          description: data["description"],
                          onTap: () {

                          },
                        ),
                      ],
                    ),
                  );
                },
               );
            }).toList() ?? [
              const Text("Sin Usuarios"),
            ],
          );
        },
      ),
    );
  }
}