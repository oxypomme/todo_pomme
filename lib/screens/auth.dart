import 'package:flutter/material.dart';
import 'package:todo_pomme/components/sign_form.dart';

class Auth extends StatelessWidget {
  const Auth({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    final isRegister = ModalRoute.of(context)!.settings.arguments as bool?;

    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: SignForm(isRegister: isRegister ?? false));
  }
}
