import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/colors.dart';

class CustomTextFormField extends StatelessWidget {
   final TextEditingController controller;
  final String hintText;
  final IconData prefixIcon;
  final bool isPassword;
  final RxBool? isPasswordVisible;
  final String? Function(String?)? validator; // <-- Add validator here

  const CustomTextFormField({
    super.key,
     required this.controller,
    required this.hintText,
    required this.prefixIcon,
    this.isPassword = false,
    this.isPasswordVisible,
    this.validator, // <-- accept validator in constructor
  });

  @override
  Widget build(BuildContext context) {
    // If it's not a password field, no need for Obx
    if (!isPassword) {
      return _buildTextField(obscureText: false);
    }

    // For password fields, wrap in Obx to react to visibility changes
    return Obx(() {
      final showPassword = isPasswordVisible?.value ?? false;
      return _buildTextField(obscureText: !showPassword);
    });
  }

  // Helper widget for reusability
  Widget _buildTextField({required bool obscureText}) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      validator: validator, // <-- apply validator here
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: Icon(prefixIcon, color: Colors.grey),
        suffixIcon: isPassword
            ? IconButton(
          icon: Icon(
            obscureText ? Icons.visibility_off : Icons.visibility,
            color: Colors.grey,
          ),
          onPressed: () {
            if (isPasswordVisible != null) {
              isPasswordVisible!.toggle();
            }
          },
        )
            : null,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: primaryColor, width: 1.5),
        ),
      ),
    );
  }
}
