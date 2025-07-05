import 'package:flutter/material.dart';
import 'package:profile_ui/main.dart';
import 'package:profile_ui/screen/auth/signIn_screen.dart';
// import 'package:profile_ui/main.dart';
// import 'package:profile_ui/screen/auth/signIn_screen.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Form(
            key: GlobalKey<FormState>(),
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
                  style: TextStyle(color: Colors.grey.shade300),
                ),
                SizedBox(height: 20),
                TextFormField(
                  // controller: _nameController,
                  decoration: InputDecoration(
                    labelText: "Your Name",
                    border: OutlineInputBorder(),
                    hintText: "Enter your fullname",
                  ),
                  validator: (value) =>
                      value!.isEmpty ? 'Enter your name' : null,
                ),
                SizedBox(height: 16),
                TextFormField(
                  // controller: _usernameController,
                  decoration: InputDecoration(
                    labelText: "Username",
                    border: OutlineInputBorder(),
                    hintText: "Enter Username",
                  ),
                  validator: (value) =>
                      value!.isEmpty ? 'Enter your username' : null,
                ),
                SizedBox(height: 16),
                TextFormField(
                  // controller: _emailController,
                  decoration: InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(),
                    hintText: 'Enter your email address',
                  ),
                  validator: (value) =>
                      value!.contains("@") ? "Enter valid email" : null,
                ),
                SizedBox(height: 16),
                TextFormField(
                  // controller: _passwordController,
                  obscureText: true, // _obscurePassword
                  decoration: InputDecoration(
                    labelText: "Password",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) =>
                      value!.length < 8 ? 'Password too short' : null,
                ),
                SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      "Create Account",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account? "),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                        );
                      },
                      child: Text(
                        "Sign in",
                        style: TextStyle(
                          color: Colors.green,
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
