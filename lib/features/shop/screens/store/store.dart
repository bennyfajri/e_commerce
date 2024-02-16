import 'package:e_commerce/common/products_cart/cart_menu_icon.dart';
import 'package:e_commerce/common/widgets/appbar/appbar.dart';
import 'package:e_commerce/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:e_commerce/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:e_commerce/common/widgets/layout/grid_product_layout.dart';
import 'package:e_commerce/common/widgets/texts/section_heading.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/enums.dart';
import 'package:e_commerce/utils/constants/image_strings.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/images/circular_images.dart';
import '../../../../common/widgets/texts/brand_title_text_with_verified_icon.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: Text(
          "Store",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [
          CardCounterIcon(
            onPressed: () {},
            iconColor: MyColors.white,
          )
        ],
      ),
      body: NestedScrollView(
        headerSliverBuilder: (_, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              automaticallyImplyLeading: false,
              pinned: true,
              floating: true,
              backgroundColor: HelperFunctions.isDarkMode(context)
                  ? MyColors.black
                  : MyColors.white,
              expandedHeight: 440,
              flexibleSpace: Padding(
                padding: EdgeInsets.all(Material.defaultSplashRadius),
                child: ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    /// Search Bar
                    const SizedBox(height: Sizes.spaceBetweenItems),
                    const SearchContainer(
                      text: "",
                      showBorder: true,
                      showBackground: false,
                      padding: EdgeInsets.zero,
                    ),
                    const SizedBox(height: Sizes.spaceBetweenSections),

                    /// Featured Brands
                    SectionHeading(
                      title: "Featured Brands",
                      onPressed: () {},
                    ),
                    const SizedBox(height: Sizes.spaceBetweenItems / 1.5),
                    GridProductLayout(
                      itemCount: 4,
                      mainAxisExtent: 80,
                      itemBuilder: (_, index) {
                        return GestureDetector(
                          onTap: () {},
                          child: RoundedContainer(
                            padding: EdgeInsets.all(Sizes.sm),
                            showBorder: true,
                            backgroundColor: Colors.transparent,
                            child: Row(
                              children: [
                                /// Icon
                                Flexible(
                                  child: CircularImage(
                                    isNetworkImage: false,
                                    image: Images.clothIcon,
                                    backgroundColor: Colors.transparent,
                                    overlayColor:
                                        HelperFunctions.isDarkMode(context)
                                            ? MyColors.white
                                            : MyColors.dark,
                                  ),
                                ),
                                const SizedBox(
                                    width: Sizes.spaceBetweenItems / 2),

                                /// Text
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const BrandTitleTextWithVerifiedIcon(
                                          title: "Nike",
                                          brandTextSize: TextSizes.large),
                                      Text(
                                        "256 products",
                                        overflow: TextOverflow.ellipsis,
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelMedium,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
            )
          ];
        },
        body: Container(),
      ),
    );
  }
}
