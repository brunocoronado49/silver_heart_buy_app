import 'package:equatable/equatable.dart';

class AuthUser extends Equatable {
  final String uid;

  const AuthUser(this.uid);

  @override
  List<Object?> get props => [uid];
}

abstract class AuthRepository {
  Stream<AuthUser?> get onAuthStateChanged;

  Future<AuthUser?> signInWithEmailAndPassword(String email, String password);
  Future<AuthUser?> createUserWithEmailAndPassword(String email, String password);
  Future<void> signOut(); 
}
