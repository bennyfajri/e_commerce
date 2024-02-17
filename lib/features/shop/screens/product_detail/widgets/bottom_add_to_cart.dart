import 'package:e_commerce/common/widgets/icon/circular_icon.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class BottomAddToCart extends StatelessWidget {
  const BottomAddToCart({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = HelperFunctions.isDarkMode(context);
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: Sizes.defaultSpace, vertical: Sizes.defaultSpace / 2),
      decoration: BoxDecoration(
        color: isDarkMode ? MyColors.darkerGrey : MyColors.light,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(Sizes.cardRadiusLg),
          topLeft: Radius.circular(Sizes.cardRadiusLg),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const CircularIcon(
                icon: Iconsax.minus,
                backgroundColor: MyColors.darkGrey,
                width: 40,
                height: 40,
                color: MyColors.white,
              ),
              const SizedBox(width: Sizes.spaceBetweenItems),
              Text(
                "2",
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(width: Sizes.spaceBetweenItems),
              const CircularIcon(
                icon: Iconsax.add,
                backgroundColor: MyColors.black,
                width: 40,
                height: 40,
                color: MyColors.white,
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(Sizes.md),
              backgroundColor: MyColors.black,
              side: const BorderSide(color: MyColors.black),
            ),
            child: const Text("Add to Cart"),
          )
        ],
      ),
    );
  }
}
