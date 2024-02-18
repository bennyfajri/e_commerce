import 'package:e_commerce/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:e_commerce/common/widgets/images/rounded_image.dart';
import 'package:e_commerce/common/widgets/texts/brand_title_text_with_verified_icon.dart';
import 'package:e_commerce/common/widgets/texts/product_price_text.dart';
import 'package:e_commerce/common/widgets/texts/product_title_text.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/image_strings.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../icon/circular_icon.dart';

class ProductCardHorizontal extends StatelessWidget {
  const ProductCardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);

    return Container(
      width: 310,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Sizes.productImageRadius),
        color: dark ? MyColors.darkerGrey : MyColors.softGrey,
      ),
      child: Row(
        children: [
          /// Thumbnail
          RoundedContainer(
            height: 120,
            padding: const EdgeInsets.all(Sizes.sm),
            backgroundColor: dark ? MyColors.dark : MyColors.light,
            child: Stack(
              children: [
                /// Thumbnail Image
                const SizedBox(
                  height: 120,
                  width: 120,
                  child: RoundedImage(
                    imageUrl: Images.productImage1,
                    applyImageRadius: true,
                  ),
                ),

                /// Sale tag
                Positioned(
                  top: 12,
                  child: RoundedContainer(
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
                ),

                /// Favorited Icon Button
                const Positioned(
                  top: 0,
                  right: 0,
                  child: CircularIcon(
                    icon: Iconsax.heart5,
                    color: Colors.red,
                  ),
                )
              ],
            ),
          ),

          /// Details
          SizedBox(
            width: 172,
            child: Padding(
              padding: const EdgeInsets.only(top: Sizes.sm, left: Sizes.sm),
              child: Column(
                children: [
                  const Column(
                    children: [
                      ProductTitleText(
                          title: "Green Nike Half Sleeves Shirt",
                          smallSize: true),
                      SizedBox(height: Sizes.spaceBetweenItems / 2),
                      BrandTitleTextWithVerifiedIcon(title: "Nike"),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /// Pricing
                      const Flexible(child: ProductPriceText(price: "256")),

                      /// Add to cart
                      Container(
                        decoration: const BoxDecoration(
                          color: MyColors.dark,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(Sizes.cardRadiusMd),
                              bottomRight:
                                  Radius.circular(Sizes.productImageRadius)),
                        ),
                        child: const SizedBox(
                          width: Sizes.iconLg * 1.2,
                          height: Sizes.iconLg * 1.2,
                          child: Center(
                            child: Icon(
                              Iconsax.add,
                              color: MyColors.white,
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
