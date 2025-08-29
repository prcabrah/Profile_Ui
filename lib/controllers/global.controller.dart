import 'dart:io';

import 'package:get/get.dart';

class GlobalController extends GetxController {
  File? profileImage;

  void updateProfileImage(File pictureFile) {
    profileImage = pictureFile;
    update();
  }

  void deleteProfileImage() {
    profileImage = null;
    update();
  }
}


// 