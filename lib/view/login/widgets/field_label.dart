import 'package:flutter/material.dart';

class FieldLabel extends StatelessWidget {
  final String label;
  const FieldLabel({required this.label,super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: const TextStyle(
        fontSize: 10,
        letterSpacing: 2.5,
        color: Color(0xFF888880),
        fontWeight: FontWeight.w500,
      ),
    );
  }
}




