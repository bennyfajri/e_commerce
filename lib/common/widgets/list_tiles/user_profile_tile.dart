import 'package:e_commerce/features/personalization/controllers/user_controller.dart';
import 'package:e_commerce/features/personalization/screens/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../images/circular_images.dart';

class UserProfileTile extends StatelessWidget {
  const UserProfileTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return ListTile(
      leading: const CircularImage(
        image: Images.user,
        width: 50,
        height: 50,
        padding: 0,
      ),
      title: Text(
        controller.user.value.fullName,
        style: Theme.of(context)
            .textTheme
            .headlineSmall
            ?.apply(color: MyColors.white),
      ),
      subtitle: Text(
        controller.user.value.email,
        style: Theme.of(context)
            .textTheme
            .bodyMedium
            ?.apply(color: MyColors.white),
      ),
      trailing: IconButton(
        onPressed: () => Get.to(() => const ProfileScreen()),
        icon: const Icon(
          Iconsax.edit,
          color: MyColors.white,
        ),
      ),
    );
  }
}
