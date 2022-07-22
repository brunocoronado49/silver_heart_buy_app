import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:silver_heart_buy/models/models.dart';
import 'package:silver_heart_buy/presentation/feed/widgets/list_tile_post.dart';
import 'package:silver_heart_buy/theme/app_theme.dart';

class PostItems extends StatefulWidget {
  const PostItems({Key? key, required this.user}) : super(key: key);

  final MyUser user;

  @override
  State<PostItems> createState() => _PostItemsState();
}

class _PostItemsState extends State<PostItems> {
  List<Map<String, dynamic>> files = [];

  Future<List<Map<String, dynamic>>> _loadPosts() async {
    final result = await FirebaseStorage.instance.ref().child("/posts/").listAll();
    final allFiles = result.items;

    try {
      await Future.forEach<Reference>(allFiles, (file) async {
        final String fileUrl = await file.getDownloadURL();
        final FullMetadata fileMeta = await file.getMetadata();

        files.add({
          "url": fileUrl,
          "path": file.fullPath,
          "seller": fileMeta.customMetadata?['seller'] ?? 'nobody',
          "description":
              fileMeta.customMetadata?['description'] ?? 'no description',
          "name": fileMeta.customMetadata?["title"] ?? "no title",
          "price": fileMeta.customMetadata?["price"] ?? "no price",
          "material": fileMeta.customMetadata?["material"] ?? "no material",
        });
      });
    } catch (error) {
      throw Exception(error.toString());
    }

    return files;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: FutureBuilder(
        future: _loadPosts(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.data != null) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: snapshot.data?.length ?? 0,
              itemBuilder: (context, index) {
                final Map<String, dynamic> post = snapshot.data![index];

                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  color: AppTheme.backgroundColor,
                  child: Column(
                    children: [
                      FadeInImage(
                        image: NetworkImage(post['url']),
                        placeholder: const AssetImage("assets/loading.gif"),
                        width: double.infinity,
                        height: 150,
                        fit: BoxFit.cover,
                        fadeInDuration: const Duration(milliseconds: 300),
                      ),
                      ListTilePost(
                        title: post["name"],
                        seller: post["seller"],
                        price: post["price"],
                        onTap: () {},
                      ),
                    ],
                  ),
                );
              }
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}