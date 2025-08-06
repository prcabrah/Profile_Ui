import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:profile_ui/utils/constants/colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({required this.email, super.key});
  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(height: 180, color: AppColors.primary),
                  Positioned(
                    top: 100,
                    child: CircleAvatar(
                      radius: 60,
                      backgroundImage: AssetImage(
                        'assets/profile.jpg',
                      ), // Add your image in assets folder
                    ),
                  ),
                ],
              ),
              SizedBox(height: 80),
              Text(
                'Username: @airboy',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 8),
              Text(
                'Name: Segun Etomu',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'Email: $email',
                style: TextStyle(fontSize: 16, color: AppColors.grey[700]),
              ),
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  'Bio: Flutter developer | Tech enthusiast | Lifelong learner who loves building clean UIs.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: FaIcon(FontAwesomeIcons.twitter, color: AppColors.primary),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: FaIcon(
                      FontAwesomeIcons.linkedin,
                      color: AppColors.primary,
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: FaIcon(FontAwesomeIcons.github, color: AppColors.text),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: FaIcon(
                      FontAwesomeIcons.instagram,
                      color: AppColors.purple,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
