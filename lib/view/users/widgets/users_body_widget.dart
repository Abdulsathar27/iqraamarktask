import 'package:flutter/material.dart';
import 'package:iqraamarktask/core/constant/app_colors.dart';
import 'package:iqraamarktask/core/constant/app_sizes.dart';

import '../../../controller/users_controller.dart';



import 'user_card.dart';

class UsersBodyWidget extends StatelessWidget {
  final UsersController provider;

  const UsersBodyWidget({
    super.key,
    required this.provider,
  });

  @override
  Widget build(BuildContext context) {
    if (provider.isLoading) {
      return const Center(
        child: CircularProgressIndicator(
          color: AppColors.gold,
          strokeWidth: 1.5,
        ),
      );
    }

    if (provider.errorMessage.isNotEmpty) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.error_outline,
              color: AppColors.gold
                  .withOpacity(0.4),
              size: AppSizes.errorIconSize,
            ),

            const SizedBox(height: 16),

            Text(
              provider.errorMessage,
              style: const TextStyle(
                color: AppColors.textMuted,
                fontSize: 14,
                letterSpacing: 0.3,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.symmetric(
        horizontal:
            AppSizes.bodyPadding,
        vertical:
            AppSizes.verticalPadding,
      ),
      itemCount: provider.users.length,
      itemBuilder: (context, index) {
        final user = provider.users[index];

        return UserCard(user: user);
      },
    );
  }
}