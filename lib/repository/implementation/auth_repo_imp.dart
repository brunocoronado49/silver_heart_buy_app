import 'package:firebase_auth/firebase_auth.dart';

import 'package:silver_heart_buy/repository/auth_repository.dart';

class AuthRepoImp extends AuthRepository {
  final _auth = FirebaseAuth.instance;

  AuthUser? _userFromFirebase(User? user) => user == null ? null : AuthUser(user.uid);

  @override
  Stream<AuthUser?> get onAuthStateChanged => _auth.authStateChanges().asyncMap(_userFromFirebase);

  @override
  Future<AuthUser?> createUserWithEmailAndPassword(String email, String password) async {
    final authResult = await _auth.createUserWithEmailAndPassword(email: email, password: password);
    return _userFromFirebase(authResult.user);
  }

  @override
  Future<AuthUser?> signInWithEmailAndPassword(String email, String password) async {
    final authResult = await _auth.signInWithEmailAndPassword(email: email, password: password);
    return _userFromFirebase(authResult.user);
  }

  @override
  Future<void> signOut() async {
    await _auth.signOut();
  }

}
