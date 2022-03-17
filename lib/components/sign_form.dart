import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

final FirebaseAuth auth = FirebaseAuth.instance;

class SignForm extends StatefulWidget {
  const SignForm({Key? key, required this.isRegister}) : super(key: key);

  final bool isRegister;

  @override
  State<SignForm> createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  // final _contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: const <Widget>[
          GoogleSignInButton(
            clientId: 'private',
            action: AuthAction.link,
          )
        ],
      ),
    );
  }
}
