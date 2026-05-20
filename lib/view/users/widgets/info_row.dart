import 'package:flutter/material.dart';

import '../../../core/constant/app_colors.dart';
import '../../../core/constant/app_sizes.dart';

class InfoRow extends StatelessWidget {
  final IconData icon;
  final String value;

  const InfoRow({
    required this.icon,
    required this.value,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: AppSizes.infoIconSize,
          color: AppColors.gold
              .withValues(
                alpha: 0.6,
              ),
        ),

        const SizedBox(
          width: AppSizes.infoSpacing,
        ),

        Expanded(
          child: Text(
            value,

            overflow:
                TextOverflow.ellipsis,

            style: const TextStyle(
              color:
                  AppColors.textMuted,

              fontSize:
                  AppSizes.infoText,

              letterSpacing: 0.2,
            ),
          ),
        ),
      ],
    );
  }
}
