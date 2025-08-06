import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:profile_ui/screen/dashboard/dashboard.dart';

class AuthController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  // final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final businessController = TextEditingController();
  final phoneController = TextEditingController();

  var obscurePassword = true.obs;
  var isLoading = false.obs;

  void togglePassword() {
    obscurePassword.value = !obscurePassword.value;
  }

  void login() {
    // if (formKey.currentState?.validate() ?? false) {
    isLoading.value = true;
    Future.delayed(Duration(seconds: 2), () {
      isLoading.value = false;
      Get.snackbar('Success', 'Login successful');
      Get.offAll(() => Dashboard(email: emailController.text.trim()));
    });
    // }
  }

  void register() {
    // if (formKey.currentState?.validate() ?? false) {
    isLoading.value = true;
    Future.delayed(Duration(seconds: 2), () {
      isLoading.value = false;
      Get.snackbar('Success', 'Registration successful');
      Get.offAll(() => Dashboard(email: emailController.text.trim()));
    });
    // }
  }
}
