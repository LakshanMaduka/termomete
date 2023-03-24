import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class EmailSignUp with ChangeNotifier {
  void emailSignIn({String? email, String? password}) async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: password!);
        notifyListeners();
  }

  void emailSignUp({String? email, String? password}) async {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email!, password: password!);
        notifyListeners();
  }

  
}
