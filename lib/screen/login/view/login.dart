import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profile_ui/screen/register/controller/auth_controller.dart';
import 'package:profile_ui/utils/constants/colors.dart';
import 'package:profile_ui/utils/validators.dart';
import 'package:profile_ui/widget/custom_button.dart';
import 'package:profile_ui/widget/custom_input_field.dart';

class LoginScreen extends StatelessWidget {
  // static const String routeName = '/signin';
  const LoginScreen({super.key});
  // final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AuthController());

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Form(
            key: controller.formKey,
            child: Column(
              children: [
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/image/logo1.jpg', height: 40),
                    Text(
                      'Leafboard',
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Text(
                  'Work without limits',
                  style: TextStyle(fontSize: 12, letterSpacing: 1.5),
                ),
                SizedBox(height: 40),
                CustomInputField(
                  hint: 'Email, Phone & Username',
                  controller: controller.emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: Validators.validateEmail,
                ),
                SizedBox(height: 20),
                Obx(
                  () => CustomInputField(
                    hint: 'Password',
                    controller: controller.passwordController,
                    validator: Validators.validatePassword,
                    obscure: controller.obscurePassword.value,
                    onTap: controller.togglePassword,
                    suffixIcon: Icon(
                      controller.obscurePassword.value
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [Text('Forgot Password ?')],
                ),
                SizedBox(height: 30),
                CustomButton(
                  onPressed: () {
                    if (controller.formKey.currentState?.validate() ?? false) {
                      controller.login();
                    }
                  },
                  text: 'Sign in',
                  color: AppColors.primary,
                  isLoading: controller.isLoading.value,
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Dont't have an account ? "),
                    GestureDetector(
                      onTap: () => Get.toNamed('/signup'),
                      child: Text(
                        'Register Now',
                        style: TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 1,
                        color: AppColors.text.withOpacity(0.05),
                      ),
                    ),
                    SizedBox(width: 10),
                    Text('or'),
                    SizedBox(width: 10),
                    Expanded(
                      child: Divider(
                        thickness: 1,
                        color: AppColors.text.withOpacity(0.05),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.text.withOpacity(0.15)),
                    borderRadius: BorderRadius.circular(999),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/image/google.jpg', height: 20),
                      SizedBox(width: 10),
                      Text(
                        "Sign up with Google",
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors.text,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.text.withOpacity(0.15)),
                    borderRadius: BorderRadius.circular(999),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/image/apple.jpg', height: 20),
                      SizedBox(width: 10),
                      Text(
                        "Sign up with Apple",
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors.text,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
