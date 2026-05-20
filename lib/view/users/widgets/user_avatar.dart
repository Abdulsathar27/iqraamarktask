import 'package:flutter/material.dart';

import '../../../core/constant/app_colors.dart';
import '../../../core/constant/app_sizes.dart';

class UserAvatar extends StatelessWidget {
  final String name;

  const UserAvatar({required this.name, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSizes.avatarSize,
      height: AppSizes.avatarSize,

      decoration: BoxDecoration(
        shape: BoxShape.circle,

        border: Border.all(
          color: AppColors.gold.withValues(
            alpha: 0.4,
          ),
          width: 1,
        ),

        color: AppColors.gold.withValues(
          alpha: 0.08,
        ),
      ),

      child: Center(
        child: Text(
          name.isNotEmpty ? name[0].toUpperCase() : '?',

          style: const TextStyle(
            color: AppColors.gold,

            fontSize: AppSizes.avatarText,

            fontWeight: FontWeight.w300,
          ),
        ),
      ),
    );
  }
}
