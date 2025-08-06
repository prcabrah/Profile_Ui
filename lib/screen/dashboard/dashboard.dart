import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profile_ui/screen/dashboard/favourites.dart';
import 'package:profile_ui/screen/dashboard/home.dart';
import 'package:profile_ui/screen/dashboard/movies.dart';
import 'package:profile_ui/screen/dashboard/profile.dart';
import 'package:profile_ui/screen/home/controller/home_controller.dart';
import 'package:profile_ui/utils/constants/colors.dart';

class Dashboard extends StatelessWidget {
  final String email;
  const Dashboard({required this.email, super.key});


  @override
  Widget build(BuildContext context) {
    final homeController = Get.put(HomeController());
    final List<Widget> pages = [
      Home(email: email),
      Movies(),
      Favourites(),
      ProfileScreen(email: email),
    ];

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: Text('My Movie App')),
      body: Obx(() => pages[homeController.selectedIndex.value]),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          backgroundColor: AppColors.text,
          currentIndex: homeController.selectedIndex.value,
          onTap: homeController.onTabSelected,
          selectedItemColor: AppColors.primary,
          unselectedItemColor: AppColors.grey,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.movie), label: 'Movies'),
            BottomNavigationBarItem(
              icon: Icon(Icons.collections),
              label: 'Favourite',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
        ),
      ),
    );
  }
}
