import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:profile_ui/screen/welcome/view/welcome_screen.dart';
import 'package:profile_ui/screen/login/view/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final _storage = GetStorage();

  @override
  void initState() {
    _navigateToNextScreen();
    super.initState();
  }

  void _navigateToNextScreen() {
    Future.delayed(Duration(seconds: 3), () {
      final isFirstTime = _storage.read('isFirstTime') ?? true;

      if (isFirstTime) {
        Get.offAll(() => WelcomeScreen());
      } else {
        Get.offAll(() => LoginScreen());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => WelcomeScreen()),
      );
    });

    return const Scaffold(
      body: Center(
        child: Text(
          'Welcome To My Movie \nApp',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
