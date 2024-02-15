import 'package:e_commerce/features/authentication/screens/register/register.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding:
        const EdgeInsets.symmetric(vertical: Sizes.spaceBetweenSections),
        child: Column(
          children: [
            /// Email
            TextFormField(
              decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.direct_right),
                  labelText: Texts.email),
            ),
            const SizedBox(height: Sizes.spaceBetweenInputFields),

            /// Password
            TextFormField(
              decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.password_check),
                  labelText: Texts.password,
                  suffixIcon: Icon(Iconsax.eye_slash)),
            ),
            const SizedBox(height: Sizes.spaceBetweenInputFields / 2),

            /// Remember me & Forget Password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// Remember Me
                Row(
                  children: [
                    Checkbox(value: true, onChanged: (value) {}),
                    const Text(Texts.rememberMe)
                  ],
                ),

                /// Forget Password
                TextButton(
                    onPressed: () {}, child: const Text(Texts.forgetPassword))
              ],
            ),
            const SizedBox(height: Sizes.spaceBetweenSections),

            /// Sign In Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                child: const Text(Texts.signIn),
                onPressed: () {

                },
              ),
            ),
            const SizedBox(height: Sizes.spaceBetweenItems),

            /// Create Account Button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                child: const Text(Texts.createAccount),
                onPressed: () {
                  Get.to(() {
                    return const RegisterScreen();
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}