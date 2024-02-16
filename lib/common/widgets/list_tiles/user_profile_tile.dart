import 'package:flutter/material.dart';
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
    return ListTile(
      leading: const CircularImage(
        image: Images.user,
        width: 50,
        height: 50,
        padding: 0,
      ),
      title: Text(
        "Muhammad Beni Fajri",
        style: Theme.of(context)
            .textTheme
            .headlineSmall
            ?.apply(color: MyColors.white),
      ),
      subtitle: Text(
        "m.b.fajri@gmail.com",
        style: Theme.of(context)
            .textTheme
            .bodyMedium
            ?.apply(color: MyColors.white),
      ),
      trailing: IconButton(
        onPressed: () {},
        icon: const Icon(
          Iconsax.edit,
          color: MyColors.white,
        ),
      ),
    );
  }
}