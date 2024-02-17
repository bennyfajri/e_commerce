import 'package:e_commerce/common/widgets/images/circular_images.dart';
import 'package:e_commerce/common/widgets/texts/brand_title_text_with_verified_icon.dart';
import 'package:e_commerce/common/widgets/texts/product_price_text.dart';
import 'package:e_commerce/common/widgets/texts/product_title_text.dart';
import 'package:e_commerce/utils/constants/enums.dart';
import 'package:e_commerce/utils/constants/image_strings.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

class ProductMetaData extends StatelessWidget {
  const ProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = HelperFunctions.isDarkMode(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Price & Sale Price
        Row(
          children: [
            /// Sale Tag
            RoundedContainer(
              radius: Sizes.md,
              backgroundColor: MyColors.secondary.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(
                  horizontal: Sizes.sm, vertical: Sizes.xs),
              child: Text(
                "25%",
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .apply(color: MyColors.black),
              ),
            ),
            const SizedBox(width: Sizes.spaceBetweenItems),

            /// Price
            Text(
              "\$250",
              style: Theme.of(context)
                  .textTheme
                  .titleSmall
                  ?.apply(decoration: TextDecoration.lineThrough),
            ),
            const SizedBox(width: Sizes.spaceBetweenItems),
            const ProductPriceText(
              price: "175",
              isLarge: true,
            )
          ],
        ),
        const SizedBox(height: Sizes.spaceBetweenItems / 1.5),

        /// Title
        const ProductTitleText(title: "Nike Green Shoes"),
        const SizedBox(height: Sizes.spaceBetweenItems / 1.5),

        /// Stock Status
        Row(
          children: [
            const ProductTitleText(title: "Status"),
            const SizedBox(width: Sizes.spaceBetweenItems),
            Text(
              "In Stock",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
        const SizedBox(height: Sizes.spaceBetweenItems / 1.5),

        /// Brand
        Row(
          children: [
            CircularImage(
              image: Images.shoeIcon,
              width: 32,
              height: 32,
              overlayColor: isDarkMode ? MyColors.white : MyColors.black,
            ),
            const BrandTitleTextWithVerifiedIcon(
              title: "Nike",
              brandTextSize: TextSizes.medium,
            ),
          ],
        )
      ],
    );
  }
}
