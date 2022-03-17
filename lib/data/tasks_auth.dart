import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

final FirebaseAuth auth = FirebaseAuth.instance;

class TaskAuth extends ChangeNotifier {
  TaskAuth() {
    auth.authStateChanges().listen((user) async {
      // Auto relog as anonymous
      if (user == null) {
        await auth.signInAnonymously();
      }
      notifyListeners();
    });
  }

  bool get isLoggedIn =>
      auth.currentUser != null && !auth.currentUser!.isAnonymous;
}
