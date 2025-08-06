import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:profile_ui/screen/register/view/register.dart';
import 'package:profile_ui/screen/dashboard/dashboard.dart';
import 'package:profile_ui/screen/login/view/login.dart';
import 'package:profile_ui/screen/welcome/view/welcome_screen.dart';
import 'screen/splash/view/splash_screen.dart';

void main() async {
  await GetStorage.init();
  runApp(MovieApp());
}

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    final GetStorage box = GetStorage();
    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder:
          (_, _) => GetMaterialApp(
            title: 'Movie App',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(textTheme: GoogleFonts.robotoTextTheme()),
            initialRoute: '/',
            getPages: [
              GetPage(name: '/', page: () => SplashScreen()),
              GetPage(name: '/welcome', page: () => WelcomeScreen()),
              GetPage(name: '/Login', page: () => LoginScreen()),
              GetPage(name: '/signup', page: () => SignupScreen()),
              GetPage(name: '/dashboard', page: () => Dashboard(email: '')),
            ],
          ),
    );
  }
}
