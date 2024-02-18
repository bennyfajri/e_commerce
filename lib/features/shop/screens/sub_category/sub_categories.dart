import 'package:e_commerce/common/widgets/appbar/appbar.dart';
import 'package:e_commerce/common/widgets/images/rounded_image.dart';
import 'package:e_commerce/common/widgets/products/product_cards/product_card_horizontal.dart';
import 'package:e_commerce/common/widgets/texts/section_heading.dart';
import 'package:e_commerce/utils/constants/image_strings.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        showBackArrow: true,
        title: Text("Sports"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(Sizes.defaultSpace),
          child: Column(
            children: [
              /// Banner
              RoundedImage(
                imageUrl: Images.promoBanner3,
                applyImageRadius: true,
                width: double.infinity,
              ),
              const SizedBox(height: Sizes.spaceBetweenSections),

              /// Sub-Categories
              Column(
                children: [
                  /// Heading
                  SectionHeading(
                    title: "Sports shirts",
                    onPressed: () {},
                  ),
                  const SizedBox(height: Sizes.spaceBetweenItems / 2),

                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) =>
                          const ProductCardHorizontal(),
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: Sizes.spaceBetweenItems),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
