import 'dart:io';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:profile_ui/controllers/global.controller.dart';
import 'package:profile_ui/utils/constants/colors.dart';

// I've converted your widget to a StatefulWidget to manage the image state.
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({required this.email, super.key});
  final String email;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // State variable to hold the selected image file
  final globalController = Get.find<GlobalController>();
  final ImagePicker _picker = ImagePicker();

  /// Shows a modal bottom sheet with options to pick an image.
  void _showImageSourceActionSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('Take Photo'),
                onTap: () {
                  Navigator.of(context).pop();
                  _pickImage(ImageSource.camera);
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Choose from Gallery'),
                onTap: () {
                  Navigator.of(context).pop();
                  _pickImage(ImageSource.gallery);
                },
              ),
              // Only show delete option if an image has been selected
              GetBuilder<GlobalController>(
                builder: (ctx) {
                  if (globalController.profileImage == null) {
                    return const SizedBox.shrink();
                  }
                  return ListTile(
                    leading: const Icon(Icons.delete, color: Colors.red),
                    title: const Text(
                      'Delete Photo',
                      style: TextStyle(color: Colors.red),
                    ),
                    onTap: () {
                      Navigator.of(context).pop();
                      _deleteImage();
                    },
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  /// Picks an image from the specified source (camera or gallery).
  Future<void> _pickImage(ImageSource source) async {
    try {
      final XFile? pickedFile = await _picker.pickImage(source: source);
      if (pickedFile != null) {
        final picFile = File(pickedFile.path);
        globalController.updateProfileImage(picFile);
      }
    } catch (e) {
      // Handle any errors, e.g., permissions denied
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Failed to pick image: $e')));
    }
  }

  /// Deletes the currently selected profile image.
  void _deleteImage() {
    globalController.deleteProfileImage();
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Profile image removed')));
  }

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
                clipBehavior: Clip.none, // Allow the camera icon to overflow
                children: [
                  Container(height: 180, color: AppColors.primary),
                  Positioned(
                    top: 100,
                    // I've wrapped your CircleAvatar with a GestureDetector to make it tappable
                    child: GestureDetector(
                      onTap: () => _showImageSourceActionSheet(context),
                      child: Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          GetBuilder<GlobalController>(
                            builder: (_) {
                              return CircleAvatar(
                                radius: 60,
                                // The background image now dynamically changes based on whether an image has been picked
                                backgroundImage:
                                    globalController.profileImage != null
                                        ? FileImage(
                                              globalController.profileImage!,
                                            )
                                            as ImageProvider
                                        :  null,
                              );
                            },
                          ),
                          // This is the small camera icon overlay
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: AppColors.primary,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: AppColors.background,
                                width: 2,
                              ),
                            ),
                            child: const Icon(
                              Icons.camera_alt,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 80),
              const Text(
                'Username: @airboy',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 8),
              const Text(
                'Name: Segun Etomu',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                'Email: ${widget.email}', // Use widget.email in StatefulWidget
                style: TextStyle(fontSize: 16, color: Colors.grey[700]),
              ),
              const SizedBox(height: 16),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  'Bio: Flutter developer | Tech enthusiast | Lifelong learner who loves building clean UIs.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: FaIcon(
                      FontAwesomeIcons.twitter,
                      color: AppColors.primary,
                    ),
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
                    icon: FaIcon(
                      FontAwesomeIcons.github,
                      color: AppColors.text,
                    ),
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
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
