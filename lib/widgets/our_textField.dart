import 'package:flutter/material.dart';

Widget ourTextField({
  required String title,
  required String hint,
  required TextEditingController controller,
  bool isPass = false,
  int maxLength = 25,
  String? Function(String?)? validator, //  validation function
}) {
  return TextFormField(
    obscureText: isPass,
    controller: controller,
    maxLength: maxLength,
    maxLines: 1,
    decoration: InputDecoration(
      labelText: title,
      hintText: hint,
      counterText: "",
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
    validator: validator, //  Apply validator
  );
}
