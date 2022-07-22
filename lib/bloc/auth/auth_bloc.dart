import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:silver_heart_buy/repository/repositories.dart';

part 'auth_state.dart';
part 'auth_event.dart';

class Authcubit extends Cubit<AuthState> {
  final AuthRepository _repository;
  late StreamSubscription _subscription;

  Authcubit(this._repository) : super(AuthStateInitial());

  void init() {
    _subscription = _repository.onAuthStateChanged.listen(_authStateChanged);
  }

  void _authStateChanged(AuthUser? user) {
    user == null ? emit(AuthStateSignedOut()) : emit(AuthStateSuccess(user));
  }

  Future<void> reset() async => emit(AuthStateInitial());

  Future<void> _signIn(Future<AuthUser?> auxUser) async {
    try {
      emit(AuthStateLoading());
      final user = await auxUser;

      if(user == null) {
        emit(AuthStateError("Error to access"));
      } else {
        emit(AuthStateSuccess(user));
      }
    } catch (err) {
      emit(AuthStateError(err.toString()));
    }
  }

  Future<void> createUserWithEmailAndPassword(String email, String password) async {
    _signIn(_repository.createUserWithEmailAndPassword(email, password));
  }

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    _signIn(_repository.signInWithEmailAndPassword(email, password));
  }

  Future<void> signOut() async {
    await _repository.signOut();
    emit(AuthStateSignedOut());
  }

  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }

}