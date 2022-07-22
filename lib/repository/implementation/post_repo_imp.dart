import 'package:silver_heart_buy/repository/post_repository.dart';
import 'package:silver_heart_buy/provider/provider.dart';
import 'package:silver_heart_buy/models/models.dart';

class PostRepoImp extends PostRepository{
  final provider = PostProvider();

  @override
  Future<Post?> getPosts() => provider.getPost();

  // TODO: Wihs list
}