part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  @override
  List<Object?> get props => [];
}

class UserStateInitial extends UserState {}

class UserStateLoading extends UserState {}

class UserStateSuccess extends UserState {
  final MyUser user;
  final File? image;
  final bool isSaving;

  UserStateSuccess(this.user, this.image, {this.isSaving = false});

  @override
  List<Object?> get props => [user, image?.path, isSaving];
}

class UserStateSaved extends UserState {}