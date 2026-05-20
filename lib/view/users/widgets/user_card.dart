import 'package:flutter/material.dart';

import 'package:iqraamarktask/core/constant/app_colors.dart';
import 'package:iqraamarktask/core/constant/app_sizes.dart';

import 'package:iqraamarktask/view/users/widgets/info_row.dart';
import 'package:iqraamarktask/view/users/widgets/user_avatar.dart';
import 'package:iqraamarktask/view/users/widgets/user_name_id.dart';

class UserCard extends StatelessWidget {
  final dynamic user;

  const UserCard({
    required this.user,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: AppSizes.cardBottomMargin,
      ),

      decoration: BoxDecoration(
        color: AppColors.surface,

        borderRadius: BorderRadius.circular(
          AppSizes.cardRadius,
        ),

        border: Border.all(
          color: AppColors.inputBorder,

          width: AppSizes.borderWidth,
        ),
      ),

      child: Padding(
        padding: const EdgeInsets.all(
          AppSizes.cardPadding,
        ),

        child: Row(
          crossAxisAlignment:
              CrossAxisAlignment.start,

          children: [
            UserAvatar(
              name: user.name,
            ),

            const SizedBox(
              width: AppSizes.avatarSpacing,
            ),

            Expanded(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,

                children: [
                  UserNameId(
                    name: user.name,
                    id: user.id,
                  ),

                  const SizedBox(height: 10),

                  Container(
                    height:
                        AppSizes.dividerHeight,

                    color:
                        AppColors.inputBorder,
                  ),

                  const SizedBox(height: 10),

                  InfoRow(
                    icon: Icons
                        .mail_outline_rounded,

                    value: user.email,
                  ),

                  const SizedBox(height: 6),

                  InfoRow(
                    icon:
                        Icons.phone_outlined,

                    value: user.phone,
                  ),

                  const SizedBox(height: 6),

                  InfoRow(
                    icon: Icons
                        .location_on_outlined,

                    value:
                        user.address.city,
                  ),

                  const SizedBox(height: 6),

                  InfoRow(
                    icon: Icons
                        .business_outlined,

                    value:
                        user.company.name,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}