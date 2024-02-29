import 'package:e_commerce/common/widgets/appbar/appbar.dart';
import 'package:e_commerce/common/widgets/images/circular_images.dart';
import 'package:e_commerce/common/widgets/loader/shimmer.dart';
import 'package:e_commerce/common/widgets/texts/section_heading.dart';
import 'package:e_commerce/features/personalization/screens/profile/widgets/change_name.dart';
import 'package:e_commerce/features/personalization/screens/profile/widgets/profile_menu_item.dart';
import 'package:e_commerce/utils/constants/image_strings.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../controllers/user_controller.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: const MyAppBar(
        showBackArrow: true,
        title: Text("Profile"),
      ),

      /// Profile Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Sizes.defaultSpace),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    /// Profile Picture
                    Obx(() {
                      final networkImage = controller.user.value.profilePicture;
                      final image =
                          networkImage.isNotEmpty ? networkImage : Images.user;

                      return controller.imageUploading.value
                          ? const ShimmerEffect(
                              width: 80, height: 80, radius: 80)
                          : CircularImage(
                              image: image,
                              width: 80,
                              height: 80,
                              isNetworkImage: true,
                            );
                    }),
                    TextButton(
                        onPressed: () => controller.uploadUserProfilePicture(),
                        child: const Text("Change Profile Picture"))
                  ],
                ),
              ),

              /// Details
              const SizedBox(height: Sizes.spaceBetweenItems / 2),
              const Divider(),
              const SizedBox(height: Sizes.spaceBetweenItems),

              const SectionHeading(
                title: "Profile Information",
                showActionButton: false,
              ),
              const SizedBox(height: Sizes.spaceBetweenItems),

              ProfileMenuItem(
                  title: "Name",
                  value: controller.user.value.fullName,
                  onPressed: () => Get.to(() => const ChangeName())),
              ProfileMenuItem(
                  title: "username",
                  value: controller.user.value.username,
                  onPressed: () {}),

              const SizedBox(height: Sizes.spaceBetweenItems / 2),
              const Divider(),
              const SizedBox(height: Sizes.spaceBetweenItems),

              /// Heading Perfonal Info
              const SectionHeading(
                  title: "Personal Information", showActionButton: false),
              const SizedBox(height: Sizes.spaceBetweenItems),

              ProfileMenuItem(
                title: "User ID",
                value: controller.user.value.id,
                icon: Iconsax.copy,
                onPressed: () {},
              ),
              ProfileMenuItem(
                  title: "E-mail",
                  value: controller.user.value.email,
                  onPressed: () {}),
              ProfileMenuItem(
                  title: "Phone Number",
                  value: controller.user.value.phoneNumber,
                  onPressed: () {}),
              ProfileMenuItem(title: "Gender", value: "Male", onPressed: () {}),
              ProfileMenuItem(
                  title: "Date of Birth", value: "6 June", onPressed: () {}),
              const Divider(),
              const SizedBox(height: Sizes.spaceBetweenItems / 2),

              Center(
                child: TextButton(
                  child: const Text(
                    "Close Account",
                    style: TextStyle(color: Colors.red),
                  ),
                  onPressed: () => controller.deleteAccountWarningPopup(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
