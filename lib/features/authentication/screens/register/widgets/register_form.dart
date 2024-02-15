import 'package:e_commerce/features/authentication/screens/register/verify_email.dart';
import 'package:e_commerce/features/authentication/screens/register/widgets/terms_and_condition_checkbox.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: Texts.firstName,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
              const SizedBox(width: Sizes.spaceBetweenInputFields),
              Expanded(
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: Texts.firstName,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: Sizes.spaceBetweenInputFields),

          /// Username
          TextFormField(
            expands: false,
            decoration: const InputDecoration(
              labelText: Texts.username,
              prefixIcon: Icon(Iconsax.user_edit),
            ),
          ),
          const SizedBox(height: Sizes.spaceBetweenInputFields),

          /// Email
          TextFormField(
            expands: false,
            decoration: const InputDecoration(
              labelText: Texts.email,
              prefixIcon: Icon(Iconsax.direct),
            ),
          ),
          const SizedBox(height: Sizes.spaceBetweenInputFields),

          /// Phone Number
          TextFormField(
            expands: false,
            decoration: const InputDecoration(
              labelText: Texts.phoneNo,
              prefixIcon: Icon(Iconsax.call),
            ),
          ),
          const SizedBox(height: Sizes.spaceBetweenInputFields),

          /// Password
          TextFormField(
            expands: false,
            obscureText: true,
            decoration: const InputDecoration(
                labelText: Texts.password,
                prefixIcon: Icon(Iconsax.password_check),
                suffixIcon: Icon(Iconsax.eye_slash)),
          ),
          const SizedBox(height: Sizes.spaceBetweenInputFields),

          /// Terms&Conditions Checkbox
          const TermsAndConditionCheckbox(),
          const SizedBox(height: Sizes.spaceBetweenSections),

          /// Sign Up Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => Get.to(() => const VerifyEmailScreen()),
              child: const Text(Texts.createAccount),
            ),
          )
        ],
      ),
    );
  }
}
