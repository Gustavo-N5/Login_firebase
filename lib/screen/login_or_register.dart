import 'package:flutter/material.dart';
import 'package:teste_firebase/screen/login_page.dart';
import 'package:teste_firebase/screen/register_page.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  bool showLogin = true;

  // mudando o estado do login
  void trocaTela() {
    setState(() {
      showLogin = !showLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLogin) {
      return LoginPage(
        onTap: trocaTela,
      );
    } else {
      return RegisterPage(
        onTap: trocaTela,
      );
    }
  }
}
