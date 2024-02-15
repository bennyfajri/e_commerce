import 'package:e_commerce/common/widgets/login_signup/form_divider.dart';
import 'package:e_commerce/common/widgets/login_signup/social_buttons.dart';
import 'package:e_commerce/features/authentication/screens/register/widgets/register_form.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Sizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Title
              Text(Texts.signupTitle,
                  style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: Sizes.spaceBetweenSections),

              /// Form
              const RegisterForm(),
              const SizedBox(height: Sizes.spaceBetweenSections),

              /// Divider
              FormDivider(dividerText: Texts.orSignUpWith.capitalize!),
              const SizedBox(height: Sizes.spaceBetweenSections),

              /// Social Buttons
              const SocialButton()
            ],
          ),
        ),
      ),
    );
  }
}
