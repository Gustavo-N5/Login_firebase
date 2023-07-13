import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  // login pelo google
  lgoinGoogle(BuildContext context) async {
    // Abrindo tela de seleção de email
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
    // Tela de carregamento
    // showDialog(
    //   context: context,
    //   builder: (context) {
    //     return const Center(
    //       child: CircularProgressIndicator(
    //         color: Colors.black,
    //       ),
    //     );
    //   },
    // );

    // Obtendo informações da tela de login
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;

    // Gerando uma credencial para o usuario
    final credencial = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );

    // Navigator.pop(context);
    // Loginatraves da credencial liberando um token
    return await FirebaseAuth.instance.signInWithCredential(credencial);
  }
}
