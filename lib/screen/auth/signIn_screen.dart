// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:profile_ui/screen/auth/signup_screen.dart';
import 'package:profile_ui/screen/dashboard/dashboard.dart';
// import 'package:profile_ui/main.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Form(
            key: _formKey,
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
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Your email address",
                    border: OutlineInputBorder(),
                    hintText: "@domain.com",
                  ),
                  validator: (value) => value!.isEmpty || !value.contains('@')
                      ? 'Email not correct'
                      : null,
                ),
                SizedBox(height: 20),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                    hintText: 'Enter your password',
                  ),
                  validator: (value) =>
                      value!.length < 8 ? 'Password not correct' : null,
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      final res = _formKey.currentState?.validate();
                      if (res == true) {
                        Navigator.of(
                          context,
                        ).push(MaterialPageRoute(builder: (_) => Dashboard()));
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey.shade50,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(999),
                      ),
                      elevation: 0,
                    ),
                    child: Text(
                      "Continue",
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Dont't have an account ? "),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignupScreen(),
                          ),
                        );
                      },
                      child: Text(
                        'Register Now',
                        style: TextStyle(
                          color: Color(0xFF6B61FF),
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
                        color: Colors.black.withOpacity(0.05),
                      ),
                    ),
                    SizedBox(width: 10),
                    Text('or'),
                    SizedBox(width: 10),
                    Expanded(
                      child: Divider(
                        thickness: 1,
                        color: Colors.black.withOpacity(0.05),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black.withOpacity(0.15)),
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
                          color: Colors.black,
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
                    border: Border.all(color: Colors.black.withOpacity(0.15)),
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
                          color: Colors.black,
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
