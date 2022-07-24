import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:silver_heart_buy/models/models.dart';
import 'package:silver_heart_buy/repository/repositories.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Cubit<PostState> {
  PostBloc(this._repository) : super(PostStateInitial());

  final PostRepository _repository;
  File? image;
  Post? _post;

  Future<void> getPosts() async {
    emit(PostStateLoading());
    _post = (await _repository.getPosts()) ??
    const Post("", "", "", "", "", "", "");

    emit(PostStateSuccess(_post!, image));
  }
}