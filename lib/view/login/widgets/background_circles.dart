import 'package:flutter/material.dart';

import '../../../core/constant/app_colors.dart';

class BackgroundCircles extends StatelessWidget {
  const BackgroundCircles({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: -80,
          right: -80,
          child: Container(
            width: 260,
            height: 260,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.gold
                    .withOpacity(0.08),
                width: 1,
              ),
            ),
          ),
        ),

        Positioned(
          top: -40,
          right: -40,
          child: Container(
            width: 160,
            height: 160,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.gold
                    .withOpacity(0.12),
                width: 1,
              ),
            ),
          ),
        ),
      ],
    );
  }
}