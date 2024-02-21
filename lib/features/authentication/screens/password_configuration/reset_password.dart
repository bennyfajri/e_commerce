import 'package:e_commerce/features/authentication/controller/forget_password/forget_password_controller.dart';
import 'package:e_commerce/features/authentication/screens/login/login.dart';
import 'package:e_commerce/utils/constants/image_strings.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/constants/text_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/helpers/helper_functions.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Sizes.defaultSpace),
          child: Column(
            children: [
              /// Image
              Image(
                image: const AssetImage(Images.deliveredEmailIllustration),
                width: HelperFunctions.screenWidth() / 0.6,
              ),
              const SizedBox(height: Sizes.spaceBetweenSections),

              ///Email, Title & Sbbtitle
              Text(
                email,
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              Text(
                Texts.changeYourPasswordTitle,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: Sizes.spaceBetweenItems,
              ),
              Text(
                Texts.changeYourPasswordSubTitle,
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: Sizes.spaceBetweenSections),

              ///Buttons
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Get.offAll(() => const LoginScreen()),
                  child: const Text(Texts.done),
                ),
              ),
              const SizedBox(height: Sizes.spaceBetweenSections),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: ()  => ForgetPasswordController.instance.resendPasswordResetEmail(email),
                  child: const Text(Texts.resendEmail),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
