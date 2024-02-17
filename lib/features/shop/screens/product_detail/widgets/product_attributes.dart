import 'package:e_commerce/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:e_commerce/common/widgets/texts/product_price_text.dart';
import 'package:e_commerce/common/widgets/texts/product_title_text.dart';
import 'package:e_commerce/common/widgets/texts/section_heading.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widgets/chips/choice_chip.dart';

class ProductAttributes extends StatelessWidget {
  const ProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = HelperFunctions.isDarkMode(context);

    return Column(
      children: [
        /// Selected Attribute Pricing & Description
        RoundedContainer(
          padding: const EdgeInsets.all(Sizes.md),
          backgroundColor: isDarkMode ? MyColors.darkerGrey : MyColors.grey,
          child: Column(
            children: [
              /// Title, Price and Stock Status
              Row(
                children: [
                  const SectionHeading(
                    title: "Variation",
                    showActionButton: false,
                  ),
                  const SizedBox(
                    width: Sizes.spaceBetweenItems,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const ProductTitleText(
                            title: "Price : ",
                            smallSize: true,
                          ),

                          /// Actual Price
                          Text(
                            "\$25",
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.apply(decoration: TextDecoration.lineThrough),
                          ),
                          const SizedBox(width: Sizes.spaceBetweenItems),

                          /// Sale Price
                          const ProductPriceText(price: "20")
                        ],
                      ),

                      /// Stock
                      Row(
                        children: [
                          const ProductTitleText(
                            title: "Stock : ",
                            smallSize: true,
                          ),
                          Text(
                            "In Stock",
                            style: Theme.of(context).textTheme.titleMedium,
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),

              /// Variation, Description
              const ProductTitleText(
                title:
                    "This is hte Description of the product and it can go up to max 4 lines",
                smallSize: true,
                maxLines: 4,
              ),
            ],
          ),
        ),
        const SizedBox(height: Sizes.spaceBetweenItems),

        /// Attributes
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionHeading(
              title: "Colors",
              showActionButton: false,
            ),
            const SizedBox(height: Sizes.spaceBetweenItems / 2),
            Wrap(
              spacing: 8,
              children: [
                MyChoiceChip(
                  text: "Green",
                  selected: true,
                  onSelected: (value) {},
                ),
                MyChoiceChip(
                  text: "Blue",
                  selected: false,
                  onSelected: (value) {},
                ),
                MyChoiceChip(
                  text: "Yellow",
                  selected: false,
                  onSelected: (value) {},
                ),
              ],
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionHeading(title: "Size", showActionButton: false,),
            const SizedBox(height: Sizes.spaceBetweenItems / 2),
            Wrap(
              spacing: 8,
              children: [
                MyChoiceChip(
                  text: "EU 34",
                  selected: true,
                  onSelected: (value) {},
                ),
                MyChoiceChip(
                  text: "EU 36",
                  selected: false,
                  onSelected: (value) {},
                ),
                MyChoiceChip(
                  text: "EU 38",
                  selected: false,
                  onSelected: (value) {},
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}
