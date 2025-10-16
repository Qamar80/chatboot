import 'package:flutter/material.dart';

Widget ourTextField({
  String? title,
  String? hint,
  bool isPass = false,
  controller,
  int maxLength = 25, // Limit to few words (default 20 chars)
}) {
  return TextField(
    obscureText: isPass,
    controller: controller,
    maxLength: maxLength, //  Limit characters
    maxLines: 1,          // Single line
    decoration: InputDecoration(
      labelText: title,
      hintText: hint,
      counterText: "", //  Hide default counter text
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  );
}
