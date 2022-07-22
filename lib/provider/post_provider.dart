import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as path;

import 'package:silver_heart_buy/models/models.dart';

class PostProvider {
  FirebaseFirestore get firestore => FirebaseFirestore.instance;
  FirebaseStorage get storage => FirebaseStorage.instance;

  User? get currentUser {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) throw Exception("Not authenticated!");
    return user;
  }

  Future<Post?> getPost() async {
    final snapshot = await firestore.doc("post").get();

    if (snapshot.exists) return Post.fromFirebaseMap(snapshot.data()!);
    return null;
  }

  // TODO: Wish list
}