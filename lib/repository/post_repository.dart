import 'package:silver_heart_buy/models/models.dart';

abstract class PostRepository {
  Future<Post?> getPosts();
}
