import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../icon/circular_icon.dart';

class ProductQtyWithAddRemoveButton extends StatelessWidget {
  const ProductQtyWithAddRemoveButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircularIcon(
          icon: Iconsax.minus,
          width: 32,
          height: 32,
          size: Sizes.md,
          color: HelperFunctions.isDarkMode(context) ? MyColors.white : MyColors.black,
          backgroundColor: HelperFunctions.isDarkMode(context) ? MyColors.darkerGrey : MyColors.light,
        ),
        const SizedBox(width: Sizes.spaceBetweenItems),
        Text("2", style: Theme.of(context).textTheme.titleSmall),
        const SizedBox(width: Sizes.spaceBetweenItems),
        const CircularIcon(
          icon: Iconsax.add,
          width: 32,
          height: 32,
          size: Sizes.md,
          color: MyColors.white,
          backgroundColor: MyColors.primary,
        ),
      ],
    );
  }
}