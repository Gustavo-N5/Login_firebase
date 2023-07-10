import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../components/my_button.dart';
import '../components/my_login_button.dart';
import '../components/my_text_field.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;

  const RegisterPage({
    super.key,
    required this.onTap,
  });

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //Controllers
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController passwordConfirmController =
      TextEditingController();

  //metodo de login
  void siginUserIn() async {
    // Tela de carregamento
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(
            color: Colors.black,
          ),
        );
      },
    );

    // metodo de login
    try {
      //  Verificando se o password sao iguais
      if (passwordController.text == passwordConfirmController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
      } else {
        wrongMessageError("Verifique se as senhas estão iaguais");
      }

      // ignore: use_build_context_synchronously
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);

      // Notificar email errado
      if (e.code == "user-not-found") {
        // erro email
        wrongMessageError("Email Invalido");
      }
      // Notificar que a senha esta errada
      else if (e.code == "wrong-password") {
        // Erro senmha
        wrongMessageError("Senha incorreta");
      }
    }
  }

  // Exibindo menssagem de erro
  void wrongMessageError(String mensage) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(mensage),
        );
      },
    );
  }

  // variavel de login
  bool showloginPage = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 70,
            ),
            // Logo
            const Icon(
              Icons.account_circle_sharp,
              size: 60,
            ),
            // Bem vindo
            Text(
              "Seja bem vindo(a)!!!",
              style: TextStyle(
                color: Colors.grey[700],
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            //Email
            MyTextField(
              controller: emailController,
              hintText: "Email",
              obscureText: false,
            ),

            const SizedBox(
              height: 10,
            ),
            // senha
            MyTextField(
              controller: passwordController,
              hintText: "Senha",
              obscureText: true,
            ),
            const SizedBox(
              height: 10,
            ),

            // confirma senha
            MyTextField(
              controller: passwordConfirmController,
              hintText: "Confirmar senha",
              obscureText: true,
            ),

            const SizedBox(
              height: 50,
            ),
            // botao de login

            MyButton(
              text: "Cadastrar",
              onTap: () {
                siginUserIn();
              },
            ),

            const SizedBox(
              height: 50,
            ),

            // divisao
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                children: [
                  Expanded(
                    child: Divider(
                      thickness: 0.5,
                      color: Colors.grey[400],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      "Continue com",
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 0.5,
                      color: Colors.grey[400],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            // google sigin
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyLoginButton(
                  image: "assets/images/google.png",
                )
              ],
            ),

            const SizedBox(
              height: 20,
            ),
            // registri-se
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Possui Login?",
                  style: TextStyle(color: Colors.grey[700]),
                ),
                GestureDetector(
                  onTap: widget.onTap,
                  child: Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.grey[800],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
