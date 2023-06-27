import 'package:flutter/material.dart';
import 'package:teste_firebase/components/my_button.dart';
import 'package:teste_firebase/components/my_login_button.dart';
import 'package:teste_firebase/components/my_text_field.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  //Controllers
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  //metodo de login
  void siginUserIn() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 80,
            ),
            // Logo
            const Icon(
              Icons.account_circle_sharp,
              size: 100,
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
            //user naem TextField
            MyTextField(
              controller: usernameController,
              hintText: "Email",
              obscureText: false,
            ),

            const SizedBox(
              height: 10,
            ),
            // Passord TextField
            MyTextField(
              controller: passwordController,
              hintText: "Senha",
              obscureText: true,
            ),
            const SizedBox(
              height: 10,
            ),

            // Esqueceu a senha

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Esqueceu a senha?",
                    style: TextStyle(
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            // botao de login
            MyButton(onTap: siginUserIn),
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
                  "Ainda não tem registro?",
                  style: TextStyle(color: Colors.grey[700]),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Registri-se",
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
