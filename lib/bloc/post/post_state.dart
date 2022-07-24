part of 'post_bloc.dart';

abstract class PostState extends Equatable {
  @override
  List<Object?> get props => [];
}

class PostStateInitial extends PostState {}

class PostStateLoading extends PostState {}

class PostStateSuccess extends PostState {
  final Post post;
  final File? image;
  final bool isCharged;

  PostStateSuccess(this.post, this.image, {this.isCharged = false});

  @override
  List<Object?> get props => [post, image?.path, isCharged];
}

class PostStateError extends PostState {
  final String message;

  PostStateError(this.message);

  @override
  List<Object?> get props => [message];
}