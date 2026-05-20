import 'package:flutter/material.dart';

class DemoRow extends StatelessWidget {
  final String label;
  final String value;
  const DemoRow({required this.label, required this.value,super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '$label: ',
          style: const TextStyle(
            fontSize: 13,
            color: Color(0xFF666660),
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 13,
            color: Color(0xFFF5F0E8),
            letterSpacing: 0.3,
          ),
        ),
      ],
    );
  }
}