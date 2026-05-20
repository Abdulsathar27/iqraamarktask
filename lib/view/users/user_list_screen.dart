import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:iqraamarktask/controller/users_controller.dart';

import 'package:iqraamarktask/core/constant/app_colors.dart';
import 'package:iqraamarktask/core/constant/app_sizes.dart';
import 'package:iqraamarktask/core/constant/app_strings.dart';

import 'package:iqraamarktask/view/login/login_screen.dart';

import 'widgets/users_body_widget.dart';

class UserListScreen extends StatelessWidget {
  const UserListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider =
        context.watch<UsersController>();

    WidgetsBinding.instance
        .addPostFrameCallback((_) {
      if (provider.users.isEmpty &&
          !provider.isLoading) {
        context
            .read<UsersController>()
            .initialize();
      }
    });

    return Scaffold(
      backgroundColor: AppColors.bg,

      appBar: AppBar(
        backgroundColor: AppColors.bg,

        elevation: 0,

        automaticallyImplyLeading: false,

        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,

                MaterialPageRoute(
                  builder: (_) =>
                      LoginScreen(),
                ),

                (route) => false,
              );
            },

            icon: const Icon(
              Icons.logout_rounded,

              color: AppColors.gold,
            ),
          ),
        ],

        title: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,

          children: [
            Text(
              AppStrings.directory,

              style: TextStyle(
                fontSize:
                    AppSizes.smallText,

                letterSpacing: 4,

                color: AppColors.gold
                    .withValues(
                      alpha: 0.8,
                    ),

                fontWeight:
                    FontWeight.w500,
              ),
            ),

            const Text(
              AppStrings.users,

              style: TextStyle(
                fontSize:
                    AppSizes.appBarTitle,

                fontWeight:
                    FontWeight.w300,

                color:
                    AppColors.textLight,

                letterSpacing: -0.5,
              ),
            ),
          ],
        ),

        bottom: PreferredSize(
          preferredSize:
              const Size.fromHeight(
            AppSizes.borderHeight,
          ),

          child: Container(
            height:
                AppSizes.borderHeight,

            color:
                AppColors.inputBorder,
          ),
        ),
      ),

      body: UsersBodyWidget(
        provider: provider,
      ),
    );
  }
}
