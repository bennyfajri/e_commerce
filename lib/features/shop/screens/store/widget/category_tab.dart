import 'package:e_commerce/common/widgets/layout/grid_product_layout.dart';
import 'package:e_commerce/common/widgets/products/product_card_vertical.dart';
import 'package:e_commerce/common/widgets/texts/section_heading.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widgets/brands/brand_showcase.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';

class CategoryTab extends StatelessWidget {
  const CategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(Sizes.defaultSpace),
          child: Column(
            children: [
              /// Brands
              const BrandShowcase(
                images: [
                  Images.productImage3,
                  Images.productImage3,
                  Images.productImage3,
                ],
              ),
              const BrandShowcase(
                images: [
                  Images.productImage3,
                  Images.productImage3,
                  Images.productImage3,
                ],
              ),
              const SizedBox(height: Sizes.spaceBetweenItems),

              /// Products
              SectionHeading(title: "You might like", showActionButton: true, onPressed: (){},),
              const SizedBox(height: Sizes.spaceBetweenItems),

              GridProductLayout(itemCount: 4, itemBuilder: (_, index) => const ProductCardVertical()),
              const SizedBox(height: Sizes.spaceBetweenSections),
            ],
          ),
        )
      ],
    );
  }
}
