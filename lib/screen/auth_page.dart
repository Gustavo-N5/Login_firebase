import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:teste_firebase/screen/login_page.dart';

import 'home_page.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  // Classse serve para referenciar
  // Verifica se o usuario tem um token e manda para as respectivas telas.
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        // Usuario logado
        if (snapshot.hasData) {
          return HomePage();
        }
        // Usuario nao logado
        else {
          return const LoginPage();
        }
      },
    );
  }
}
