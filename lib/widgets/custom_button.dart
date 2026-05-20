import 'package:flutter/material.dart';
import 'package:iqraamarktask/core/constant/app_colors.dart';
import 'package:iqraamarktask/core/constant/app_sizes.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const CustomButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSizes.buttonHeight,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary),
        onPressed: onTap,
        child: Text(text),
      ),
    );
  }
}
