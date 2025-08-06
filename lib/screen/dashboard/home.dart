

import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({required this.email, super.key});
  final String email;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Welcome $email', style: TextStyle(fontSize: 24))
    );
  }
}