import 'package:firebase_auth/firebase_auth.dart'; // Ensure Firebase is added to your project

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Sign in method
  Future<User?> signIn(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user; // Return the User
    } catch (e) {
      print(e);
      return null; // Return null on error
    }
  }

  // Registration method
  Future<User?> register(String email, String password) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user; // Return the User
    } catch (e) {
      print(e);
      return null; // Return null on error
    }
  }
}
