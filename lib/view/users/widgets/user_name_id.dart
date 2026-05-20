import 'package:flutter/material.dart';

import '../../../core/constant/app_colors.dart';
import '../../../core/constant/app_sizes.dart';

class UserNameId extends StatelessWidget {
  final String name;
  final int id;

  const UserNameId({
    required this.name,
    required this.id,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          MainAxisAlignment.spaceBetween,

      children: [
        Expanded(
          child: Text(
            name,

            overflow:
                TextOverflow.ellipsis,

            style: const TextStyle(
              color:
                  AppColors.textLight,

              fontSize:
                  AppSizes.userNameText,

              fontWeight:
                  FontWeight.w500,

              letterSpacing: 0.2,
            ),
          ),
        ),

        Container(
          padding:
              const EdgeInsets.symmetric(
            horizontal:
                AppSizes.idHorizontalPadding,

            vertical:
                AppSizes.idVerticalPadding,
          ),

          decoration: BoxDecoration(
            color:
                AppColors.gold.withValues(
              alpha: 0.1,
            ),

            borderRadius:
                BorderRadius.circular(
              AppSizes.idRadius,
            ),

            border: Border.all(
              color: AppColors.gold
                  .withValues(
                    alpha: 0.25,
                  ),

              width:
                  AppSizes.borderWidth,
            ),
          ),

          child: Text(
            '#$id',

            style: const TextStyle(
              color: AppColors.gold,

              fontSize:
                  AppSizes.idText,

              fontWeight:
                  FontWeight.w600,

              letterSpacing: 1,
            ),
          ),
        ),
      ],
    );
  }
}
