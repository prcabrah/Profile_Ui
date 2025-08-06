import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profile_ui/utils/constants/colors.dart';
import 'package:profile_ui/utils/validators.dart';
import 'package:profile_ui/widget/custom_button.dart';
import 'package:profile_ui/widget/custom_input_field.dart';
import 'package:profile_ui/screen/register/controller/auth_controller.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});
  // final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AuthController());
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Form(
            key: formKey,
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/image/logo1.jpg', height: 40),
                    // SizedBox(height: 10),
                    Text(
                      "Leafboard",
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

                SizedBox(height: 30),
                Text(
                  "Let's Get You In",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                ),

                Text(
                  "Create your account",
                  style: TextStyle(color: AppColors.grey.shade600),
                ),

                SizedBox(height: 20),
                CustomInputField(
                  hint: 'Name',
                  controller: controller.nameController,
                  keyboardType: TextInputType.name,
                  validator: Validators.validateNotEmpty,
                ),

                SizedBox(height: 16),
                CustomInputField(
                  hint: 'Phone number',
                  controller: controller.phoneController,
                  keyboardType: TextInputType.name,
                  validator: Validators.validatePhone,
                ),

                SizedBox(height: 16),
                CustomInputField(
                  hint: 'Email adress',
                  controller: controller.emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: Validators.validateEmail,
                ),

                SizedBox(height: 16),
                Obx(() =>
                  CustomInputField(
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
                
                SizedBox(height: 24),
                Obx(() => 
                  CustomButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                      controller.register();
                    }},
                    text: 'Create Account', 
                    color: AppColors.primary,
                    isLoading: controller.isLoading.value,
                  ),
                ),
                
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account? "),
                    GestureDetector(
                      onTap: () => Get.toNamed('/Login'),
                      //   );
                      // },
                      child: Text(
                        "Sign in",
                        style: TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
