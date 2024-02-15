import 'package:e_commerce/common/widgets/success_screen/success_screen.dart';
import 'package:e_commerce/features/authentication/screens/login/login.dart';
import 'package:e_commerce/utils/constants/image_strings.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/constants/text_strings.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => Get.offAll(() => const LoginScreen()),
            icon: const Icon(CupertinoIcons.clear),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(Sizes.defaultSpace),
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
                "m.b.fajri06@gmail.com",
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
                  onPressed: () => Get.to(() => SuccessScreen(
                    image: Images.staticSuccessIllustration,
                    title: Texts.yourAccountCreatedTitle,
                    subTitle: Texts.yourAccountCreatedSubTitle,
                    onPressed: () => Get.to(() => const LoginScreen()),
                  )),
                  child: const Text(Texts.tContinue),
                ),
              ),
              const SizedBox(height: Sizes.spaceBetweenItems),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {},
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
