import 'package:e_commerce/features/authentication/controller/login/login_controller.dart';
import 'package:e_commerce/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:e_commerce/features/authentication/screens/register/register.dart';
import 'package:e_commerce/utils/validators/validation.dart';
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
    final controller = Get.put(LoginController());

    return Form(
      key: controller.loginFormKey,
      child: Padding(
        padding:
            const EdgeInsets.symmetric(vertical: Sizes.spaceBetweenSections),
        child: Column(
          children: [
            /// Email
            TextFormField(
              controller: controller.email,
              validator: (value) => Validator.validateEmail(value),
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.direct_right),
                  labelText: Texts.email),
            ),
            const SizedBox(height: Sizes.spaceBetweenInputFields),

            /// Password
            Obx(
              () => TextFormField(
                controller: controller.password,
                validator: (value) => Validator.validatePassword(value),
                expands: false,
                obscureText: controller.hidePassword.value,
                decoration: InputDecoration(
                  labelText: Texts.password,
                  prefixIcon: const Icon(Iconsax.password_check),
                  suffixIcon: IconButton(
                    onPressed: () => controller.hidePassword.value =
                        !controller.hidePassword.value,
                    icon: Icon(
                      controller.hidePassword.value
                          ? Iconsax.eye_slash
                          : Iconsax.eye,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: Sizes.spaceBetweenInputFields / 2),

            /// Remember me & Forget Password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// Remember Me
                Row(
                  children: [
                    Obx(
                      () => Checkbox(
                        value: controller.rememberMe.value,
                        onChanged: (value) =>
                            controller.rememberMe.value = value!,
                      ),
                    ),
                    const Text(Texts.rememberMe)
                  ],
                ),

                /// Forget Password
                TextButton(
                    onPressed: () => Get.to(() => const ForgetPassword()),
                    child: const Text(Texts.forgetPassword))
              ],
            ),
            const SizedBox(height: Sizes.spaceBetweenSections),

            /// Sign In Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                child: const Text(Texts.signIn),
                onPressed: ()  => controller.signInWithEmailAndPassword(),
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
