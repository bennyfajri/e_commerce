import 'package:e_commerce/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:e_commerce/features/shop/screens/home/widgets/home_categories.dart';
import 'package:e_commerce/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/image_strings.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../common/widgets/texts/section_heading.dart';

class HomeSceen extends StatelessWidget {
  const HomeSceen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Header
            PrimaryHeaderContainer(
              child: Column(
                children: [
                  /// Appbar
                  HomeAppBar(),
                  SizedBox(height: Sizes.spaceBetweenSections),

                  /// Searchbar
                  SearchContainer(
                    text: "Search in Store",
                  ),
                  SizedBox(height: Sizes.spaceBetweenSections),

                  /// Categories
                  Padding(
                    padding: EdgeInsets.only(left: Sizes.defaultSpace),
                    child: Column(
                      children: [
                        /// Heading
                        SectionHeading(
                          title: "Popular Categories",
                          showActionButton: false,
                          textColor: MyColors.white,
                        ),
                        SizedBox(height: Sizes.spaceBetweenItems),

                        /// Categories
                        HomeCategories()
                      ],
                    ),
                  )
                ],
              ),
            ),

            Padding(
                padding: EdgeInsets.all(Sizes.defaultSpace),
                child: PromoSlider(
                  banners: [
                    Images.promoBanner1,
                    Images.promoBanner2,
                    Images.promoBanner3,
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
