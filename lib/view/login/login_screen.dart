import 'package:flutter/material.dart';
import 'package:iqraamarktask/controller/auth_controller.dart';
import 'package:iqraamarktask/core/constant/app_sizes.dart';
import 'package:iqraamarktask/core/constant/app_strings.dart';
import 'package:iqraamarktask/core/utils/validators.dart';
import 'package:provider/provider.dart';

import '../users/user_list_screen.dart';

import '../../widgets/custom_button.dart';
import '../../widgets/custom_textfield.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AuthController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.login),
      ),
      body: Padding(
        padding: const EdgeInsets.all(
          AppSizes.padding,
        ),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const SizedBox(height: 30),

              CustomTextField(
                hint: AppStrings.email,
                controller: emailController,
                validator: Validators.validateEmail,
              ),

              const SizedBox(height: 20),

              CustomTextField(
                hint: AppStrings.password,
                controller: passwordController,
                validator: Validators.validatePassword,
                obscureText: true,
              ),

              const SizedBox(height: 30),

              provider.isLoading
                  ? const CircularProgressIndicator()
                  : CustomButton(
                      text: AppStrings.login,
                      onTap: () async {
                        if (formKey.currentState!
                            .validate()) {
                          final success =
                              await provider.login(
                            email:
                                emailController.text,
                            password:
                                passwordController.text,
                          );

                          if (success) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) =>
                                    const UserListScreen(),
                              ),
                            );
                          }
                        }
                      },
                    ),
            ],
          ),
        ),
      ),
    );
  }
}