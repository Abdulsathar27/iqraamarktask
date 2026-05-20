import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:iqraamarktask/controller/auth_controller.dart';

import 'package:iqraamarktask/core/constant/app_colors.dart';
import 'package:iqraamarktask/core/constant/app_sizes.dart';
import 'package:iqraamarktask/core/constant/app_strings.dart';

import 'package:iqraamarktask/core/utils/validators.dart';

import 'package:iqraamarktask/view/login/widgets/background_circles.dart';
import 'package:iqraamarktask/view/login/widgets/demo.dart';
import 'package:iqraamarktask/view/login/widgets/field_label.dart';
import 'package:iqraamarktask/view/login/widgets/golden_button.dart';
import 'package:iqraamarktask/view/login/widgets/styled_text_field.dart';

import '../users/user_list_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController emailController =
      TextEditingController();

  final TextEditingController passwordController =
      TextEditingController();

  final GlobalKey<FormState> formKey =
      GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final provider =
        context.watch<AuthController>();

    return Scaffold(
      backgroundColor: AppColors.bg,

      body: Stack(
        children: [
          const BackgroundCircles(),

          SafeArea(
            child: SingleChildScrollView(
              padding:
                  const EdgeInsets.symmetric(
                horizontal:
                    AppSizes.screenPadding,
              ),

              child: Form(
                key: formKey,

                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,

                  children: [
                    const SizedBox(
                      height:
                          AppSizes.topSpacing,
                    ),

                    Text(
                      AppStrings.welcomeBack,

                      style: TextStyle(
                        fontSize:
                            AppSizes.labelText,

                        letterSpacing: 4,

                        color: AppColors.gold
                            .withValues(
                              alpha: 0.8,
                            ),

                        fontWeight:
                            FontWeight.w500,
                      ),
                    ),

                    const SizedBox(height: 14),

                    const Text(
                      AppStrings.signIn,

                      style: TextStyle(
                        fontSize:
                            AppSizes.headline,

                        height: 1.05,

                        fontWeight:
                            FontWeight.w300,

                        color:
                            AppColors.textLight,

                        letterSpacing: -1,
                      ),
                    ),

                    const SizedBox(height: 16),

                    Container(
                      width: 36,
                      height: 2,
                      color: AppColors.gold,
                    ),

                    const SizedBox(
                      height:
                          AppSizes.sectionGap,
                    ),

                    const FieldLabel(
                      label:
                          AppStrings.emailLabel,
                    ),

                    const SizedBox(height: 8),

                    StyledTextField(
                      hint:
                          AppStrings.email,

                      controller:
                          emailController,

                      validator:
                          Validators
                              .validateEmail,

                      obscureText: false,
                    ),

                    const SizedBox(height: 24),

                    const FieldLabel(
                      label:
                          AppStrings.passwordLabel,
                    ),

                    const SizedBox(height: 8),

                    StyledTextField(
                      hint:
                          AppStrings.passwordHint,

                      controller:
                          passwordController,

                      validator:
                          Validators
                              .validatePassword,

                      obscureText: true,
                    ),

                    const SizedBox(height: 40),

                    provider.isLoading
                        ? const Center(
                            child:
                                CircularProgressIndicator(
                              color:
                                  AppColors.gold,

                              strokeWidth:
                                  AppSizes
                                      .loaderStroke,
                            ),
                          )
                        : GoldButton(
                            label:
                                AppStrings.login,

                            onTap: () async {
                              if (formKey
                                  .currentState!
                                  .validate()) {
                                final success =
                                    await context
                                        .read<
                                            AuthController>()
                                        .login(
                                          email:
                                              emailController
                                                  .text
                                                  .trim(),

                                          password:
                                              passwordController
                                                  .text
                                                  .trim(),
                                        );

                                if (success &&
                                    context
                                        .mounted) {
                                  Navigator
                                      .push(
                                    context,

                                    MaterialPageRoute(
                                      builder:
                                          (_) =>
                                              const UserListScreen(),
                                    ),
                                  );
                                }
                              }
                            },
                          ),

                    if (provider
                        .errorMessage
                        .isNotEmpty) ...[
                      const SizedBox(
                        height: 20,
                      ),

                      Center(
                        child: Text(
                          provider
                              .errorMessage,

                          style:
                              const TextStyle(
                            color:
                                AppColors.red,

                            fontSize: 13,

                            letterSpacing:
                                0.3,
                          ),
                        ),
                      ),
                    ],

                    const SizedBox(height: 48),

                    Container(
                      padding: const EdgeInsets.all(
                        AppSizes.cardPadding,
                      ),

                      decoration: BoxDecoration(
                        color:
                            AppColors.surface,

                        borderRadius:
                            BorderRadius.circular(
                          AppSizes.radius,
                        ),

                        border: Border.all(
                          color: AppColors
                              .inputBorder,

                          width: AppSizes
                              .borderWidth,
                        ),
                      ),

                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment
                                .start,

                        children: [
                          Text(
                            AppStrings
                                .demoLogin,

                            style: TextStyle(
                              fontSize:
                                  AppSizes
                                      .smallText,

                              letterSpacing:
                                  2.5,

                              color: AppColors
                                  .gold
                                  .withValues(
                                alpha: 0.7,
                              ),

                              fontWeight:
                                  FontWeight
                                      .w600,
                            ),
                          ),

                          const SizedBox(
                            height: 12,
                          ),

                          const DemoRow(
                            label: AppStrings
                                .demoEmail,

                            value: AppStrings
                                .demoEmailValue,
                          ),

                          const SizedBox(
                            height: 6,
                          ),

                          const DemoRow(
                            label: AppStrings
                                .demoPassword,

                            value: AppStrings
                                .demoPasswordValue,
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
