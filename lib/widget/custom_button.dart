import 'package:flutter/material.dart';
import 'package:profile_ui/utils/constants/colors.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final bool isLoading;
  final Color color;

  const CustomButton({
    required this.onPressed,
    required this.text,
    required this.color,
    this.isLoading = false,    
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          padding: EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))
        ),
        child: isLoading 
        ? CircularProgressIndicator(color: AppColors.background,) 
        : Text(text, style: TextStyle(color: AppColors.background),)
      )
    );
  }
}
