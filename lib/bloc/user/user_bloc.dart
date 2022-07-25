import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:silver_heart_buy/repository/repositories.dart';
import 'package:silver_heart_buy/models/models.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Cubit<UserState> {
  final UserRepository _repository;
  late MyUser _user;
  File? _imagePicked;

  UserBloc(this._repository) : super(UserStateInitial());

  void setImage(File? imagePicked) async {
    _imagePicked = imagePicked;
    emit(UserStateSuccess(_user, _imagePicked));
  }

  Future<void> getUser() async {
    emit(UserStateLoading());
    _user = (await _repository.getUser()) ??
    const MyUser('', '', '', '', '');
    emit(UserStateSuccess(_user, _imagePicked));
  }

  Future<void> saveUser(String uid, String name, String description, String address, String email) async {
    _user = MyUser(uid, name, description, address, email, image: _user.image);
    emit(UserStateSuccess(_user, _imagePicked, isSaving: true));
    await Future.delayed(const Duration(seconds: 3));
    await _repository.saveUser(_user, _imagePicked);
    emit(UserStateSaved());
    emit(UserStateSuccess(_user, _imagePicked, isSaving: false));
  }
}
