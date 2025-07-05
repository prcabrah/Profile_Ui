import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'screen/auth/splash_screen.dart';

void main() => runApp(ProfileApp());

class ProfileApp extends StatelessWidget {
  const ProfileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile UI',
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}