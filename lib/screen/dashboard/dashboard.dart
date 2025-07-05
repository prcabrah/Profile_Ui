import 'package:flutter/material.dart';
import 'package:profile_ui/screen/dashboard/favourites.dart';
import 'package:profile_ui/screen/dashboard/home.dart';
import 'package:profile_ui/screen/dashboard/movies.dart';
import 'package:profile_ui/screen/dashboard/profile.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: TabBarView(
          children: [Home(), Movies(), Favourites(), ProfileScreen()],
        ),
        bottomNavigationBar: Container(
          padding: EdgeInsets.symmetric(vertical: 14),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
              top: BorderSide(color: Colors.black.withOpacity(0.05)),
            ),
          ),
          child: TabBar(
            labelColor: Colors.blue[700],
            dividerColor: Colors.transparent,
            indicatorColor: Colors.blue[700],
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: [
              Tab(text: "Home"),
              Tab(text: "Movies"),
              Tab(text: "Favourites"),
              Tab(text: "Profile"),
            ],
          ),
        ),
      ),
    );
  }
}
