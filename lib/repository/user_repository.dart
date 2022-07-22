import 'dart:io';

import 'package:silver_heart_buy/models/models.dart';

abstract class UserRepository {
  Future<MyUser?> getUsers();
  Future<void> saveUser(MyUser user, File? image);
}
