import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../images/rounded_image.dart';
import '../../texts/brand_title_text_with_verified_icon.dart';
import '../../texts/product_title_text.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        /// Image
        RoundedImage(
          imageUrl: Images.productImage1,
          width: 60,
          height: 60,
          padding: const EdgeInsets.all(Sizes.sm),
          backgroundColor: HelperFunctions.isDarkMode(context) ? MyColors.darkerGrey : MyColors.light,
        ),
        const SizedBox(width: Sizes.spaceBetweenItems),

        /// Title, Price & Size
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BrandTitleTextWithVerifiedIcon(title: "Nike"),
              const Flexible(child: ProductTitleText(title: "Black sport shoes", maxLines: 1)),
              /// Attributes
              Text.rich(
                  TextSpan(
                      children: [
                        TextSpan(text: "Color ", style: Theme.of(context).textTheme.bodySmall),
                        TextSpan(text: "Green ", style: Theme.of(context).textTheme.bodyLarge),
                        TextSpan(text: "Size ", style: Theme.of(context).textTheme.bodySmall),
                        TextSpan(text: "UK 08 ", style: Theme.of(context).textTheme.bodyLarge),
                      ]
                  )
              )
            ],
          ),
        )
      ],
    );
  }
}