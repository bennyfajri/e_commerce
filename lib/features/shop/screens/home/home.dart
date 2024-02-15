import 'package:e_commerce/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:e_commerce/features/shop/screens/home/widgets/home_categories.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../common/widgets/texts/section_heading.dart';

class HomeSceen extends StatelessWidget {
  const HomeSceen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Header
            PrimaryHeaderContainer(
              child: Column(
                children: [
                  /// Appbar
                  const HomeAppBar(),
                  const SizedBox(height: Sizes.spaceBetweenSections),

                  /// Searchbar
                  const SearchContainer(
                    text: "Search in Store",
                  ),
                  const SizedBox(height: Sizes.spaceBetweenSections),

                  /// Categories
                  Padding(
                    padding: const EdgeInsets.only(left: Sizes.defaultSpace),
                    child: Column(
                      children: [
                        /// Heading
                        const SectionHeading(
                          title: "Popular Categories",
                          showActionButton: false,
                          textColor: MyColors.white,
                        ),
                        const SizedBox(height: Sizes.spaceBetweenItems),

                        /// Categories
                        HomeCategories()
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}