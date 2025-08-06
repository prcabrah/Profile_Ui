import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final TextEditingController? controller;
  final String hint;
  final bool obscure;
  final VoidCallback? onTap;
  final FormFieldValidator<String>? validator;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;

  const CustomInputField({
    this.controller,
    this.obscure = false,
    required this.hint,
    this.keyboardType,
    this.onTap,
    this.suffixIcon,
    this.validator,
    
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscure,
      decoration: InputDecoration(
        hintText: hint,
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
      validator: validator,
      keyboardType: keyboardType,
      onTap: onTap,
    );
  }
}
