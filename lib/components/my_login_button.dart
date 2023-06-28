import 'package:flutter/material.dart';

class MyLoginButton extends StatelessWidget {
  final String image;
  const MyLoginButton({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(16),
        color: Colors.grey[200],
      ),
      child: Image.asset(
        image,
        height: 40,
      ),
    );
  }
}
