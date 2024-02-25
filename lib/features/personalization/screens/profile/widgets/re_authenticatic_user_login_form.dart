import 'package:e_commerce/common/widgets/appbar/appbar.dart';
import 'package:e_commerce/features/personalization/controllers/user_controller.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/validators/validation.dart';

class ReAuthLoginForm extends StatelessWidget {
  const ReAuthLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: const MyAppBar(
        title: Text("Re-authenticate User"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Sizes.defaultSpace),
          child: Form(
            key: controller.reAuthFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Email
                TextFormField(
                  controller: controller.verifyEmail,
                  validator: Validator.validateEmail,
                  decoration: const InputDecoration(
                    labelText: Texts.email,
                    prefixIcon: Icon(Iconsax.direct_right),
                  ),
                ),
                const SizedBox(height: Sizes.spaceBetweenInputFields),

                Obx(
                  () => TextFormField(
                    obscureText: controller.hidePassword.value,
                    controller: controller.verifyPassword,
                    validator: (value) =>
                        Validator.validateEmptyText("Password", value),
                    decoration: InputDecoration(
                      labelText: Texts.password,
                      prefix: const Icon(Iconsax.password_check),
                      prefixIcon: IconButton(
                        onPressed: () => controller.hidePassword.value =
                            !controller.hidePassword.value,
                        icon: const Icon(Iconsax.eye_slash),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text("Continue"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
