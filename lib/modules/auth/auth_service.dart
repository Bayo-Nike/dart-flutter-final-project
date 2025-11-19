import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final _auth = FirebaseAuth.instance;
  final _db = FirebaseFirestore.instance;

  /// LOGIN
  Future<AuthResult> login(String email, String password) async {
    try {
      final result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final userDoc =
          await _db.collection("users").doc(result.user!.uid).get();

      if (!userDoc.exists) {
        return AuthResult(error: "User profile not found");
      }

      return AuthResult(
        user: AppUser(
          uid: result.user!.uid,
          name: userDoc["name"],
          role: userDoc["role"],
        ),
      );
    } catch (e) {
      return AuthResult(error: e.toString());
    }
  }

  /// REGISTER
  Future<AuthResult> register({
    required String name,
    required String email,
    required String password,
    required String role,
  }) async {
    try {
      final result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await _db.collection("users").doc(result.user!.uid).set({
        "name": name,
        "email": email,
        "role": role,
        "createdAt": DateTime.now().millisecondsSinceEpoch,
      });

      return AuthResult(
        user: AppUser(
          uid: result.user!.uid,
          name: name,
          role: role,
        ),
      );
    } catch (e) {
      return AuthResult(error: e.toString());
    }
  }
}

class AuthResult {
  final AppUser? user;
  final String? error;

  AuthResult({this.user, this.error});
}

class AppUser {
  final String uid;
  final String name;
  final String role;

  AppUser({
    required this.uid,
    required this.name,
    required this.role,
  });
}
