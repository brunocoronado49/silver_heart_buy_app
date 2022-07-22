part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AuthStateInitial extends AuthState {}

class AuthStateLoading extends AuthState {}

class AuthStateSuccess extends AuthState {
  final AuthUser user;

  AuthStateSuccess(this.user);

  @override
  List<Object?> get props => [user];
}

class AuthStateError extends AuthState {
  final String error;

  AuthStateError(this.error);

  @override
  List<Object?> get props => [error];
}

class AuthStateSignedOut extends AuthState {}
