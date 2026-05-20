import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final bool obscureText;
  final TextEditingController controller;
  final String? Function(String)? validator;

  const CustomTextField({
    super.key,
    required this.hint,
    required this.controller,
    required this.validator,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      validator: (value) => validator!(value ?? ""),
      decoration: InputDecoration(
        hintText: hint,
        border: OutlineInputBorder(),
      ),
    );
  }
}