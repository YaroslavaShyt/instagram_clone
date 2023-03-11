import 'package:firebase_auth/firebase_auth.dart';

class Authentication {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> logIn(
      {required String email, required String password}) async {
    String errorMessage = '';
    try {
      email.isNotEmpty
          ? password.isNotEmpty
              ? await _auth.signInWithEmailAndPassword(
                  email: email, password: password)
              : errorMessage += '\nВведіть пароль'
          : errorMessage = '\nВведіть ел. пошту';
    } catch (error) {
      errorMessage = error.toString();
    }
    return errorMessage;
  }
}
