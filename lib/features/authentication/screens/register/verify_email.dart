import 'package:e_commerce/data/repositories/authentication/authentication_repository.dart';
import 'package:e_commerce/features/authentication/controller/signup/verify_email_controller.dart';
import 'package:e_commerce/utils/constants/image_strings.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/constants/text_strings.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key, this.email});

  final String? email;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyEmailController());

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => AuthenticationRepository.instance.logout(),
            icon: const Icon(CupertinoIcons.clear),
          )
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

              /// Title & Sbbtitle
              Text(
                Texts.confirmEmail,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: Sizes.spaceBetweenItems,
              ),
              Text(
               email ?? "",
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: Sizes.spaceBetweenItems,
              ),
              Text(
                Texts.confirmEmailSubTitle,
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: Sizes.spaceBetweenSections),

              /// Buttons
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => controller.checkEmailVerificationStatus(),
                  child: const Text(Texts.tContinue),
                ),
              ),
              const SizedBox(height: Sizes.spaceBetweenItems),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () => controller.sendEmailVerification() ,
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
