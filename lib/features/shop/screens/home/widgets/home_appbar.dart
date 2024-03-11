import 'package:e_commerce/common/widgets/shimmer/shimmer.dart';
import 'package:e_commerce/features/personalization/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/products/cart/cart_menu_icon.dart';
import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/text_strings.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return MyAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Texts.homeAppBarTitle,
            style: Theme.of(context)
                .textTheme
                .labelMedium
                ?.apply(color: MyColors.grey),
          ),
          Obx(
            () {
              if (controller.profileLoading.value) {
                // display a shimmer loader while user profile is loading
                return const ShimmerEffect(width: 80, height: 15);
              } else {
                return Text(
                  controller.user.value.fullName,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.apply(color: Colors.white),
                );
              }
            },
          ),
        ],
      ),
      actions: [
        CardCounterIcon(
          onPressed: () {},
          iconColor: MyColors.white,
        )
      ],
    );
  }
}
