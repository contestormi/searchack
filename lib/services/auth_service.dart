import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthenticationService {
  Stream<User?> get authStateChanges;

  Future<bool> signIn({required String email, required String password});
  Future<bool> signUp({required String email, required String password});
  Future<void> signOut();
}

class AuthenticationServiceImpl implements AuthenticationService {
  final FirebaseAuth _firebaseAuth;

  AuthenticationServiceImpl(this._firebaseAuth);

  @override
  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  @override
  Future<bool> signIn({required String email, required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return true;
    } on FirebaseException catch (e) {
      throw e.message!;
    }
  }

  @override
  Future<bool> signUp({required String email, required String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return true;
    } on FirebaseException catch (e) {
      throw e.message!;
    }
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
