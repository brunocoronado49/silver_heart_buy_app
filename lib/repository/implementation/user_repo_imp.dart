import 'dart:io';

import 'package:silver_heart_buy/repository/user_repository.dart';
import 'package:silver_heart_buy/provider/provider.dart';
import 'package:silver_heart_buy/models/models.dart';

class UserRepoImp extends UserRepository {
  final provider = UserProvider();

  @override
  Future<MyUser?> getUsers() => provider.getUser();

  @override
  Future<void> saveUser(MyUser user, File? image) => provider.saveUser(user, image);
}