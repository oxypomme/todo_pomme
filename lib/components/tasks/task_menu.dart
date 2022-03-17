import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_pomme/data/tasks_auth.dart';

class TaskMenu extends StatelessWidget {
  const TaskMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskAuth>(
        builder: ((context, auth, child) => PopupMenuButton(
            itemBuilder: ((ctx) => [
                  ...(auth.isLoggedIn
                      ? [
                          PopupMenuItem(
                            child: const Text('Se déconnecter'),
                            onTap: () {
                              FirebaseAuth.instance.signOut();
                            },
                          )
                        ]
                      : [
                          // PopupMenuItem(
                          //   child: const Text("S'inscrire"),
                          //   onTap: () {
                          //     // Argument here is if we're registering someone
                          //     Navigator.pushNamed(context, '/auth',
                          //         arguments: true);
                          //   },
                          // ),
                          PopupMenuItem(
                            child: const Text('Se connecter'),
                            onTap: () {
                              // Argument here is if we're registering someone
                              Navigator.pushNamed(context, '/auth',
                                  arguments: false);
                            },
                          )
                        ]),
                ]))));
  }
}
