import 'package:e_commerce/common/widgets/texts/section_heading.dart';
import 'package:e_commerce/features/shop/screens/product_detail/widgets/bottom_add_to_cart.dart';
import 'package:e_commerce/features/shop/screens/product_detail/widgets/product_attributes.dart';
import 'package:e_commerce/features/shop/screens/product_detail/widgets/product_detail_image_slider.dart';
import 'package:e_commerce/features/shop/screens/product_detail/widgets/product_meta_data.dart';
import 'package:e_commerce/features/shop/screens/product_detail/widgets/rating_and_share.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAddToCart(

      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Product Image Slider
            const ProductImageSlider(),

            /// Product Details
            Padding(
              padding: const EdgeInsets.only(
                right: Sizes.defaultSpace,
                left: Sizes.defaultSpace,
                bottom: Sizes.defaultSpace,
              ),
              child: Column(
                children: [
                  /// Rating & Share
                  const RatingAndShare(),

                  /// Price, Title, Stock & Brand
                  const ProductMetaData(),

                  /// Attributes
                  const ProductAttributes(),
                  const SizedBox(height: Sizes.spaceBetweenSections),

                  /// Checkout Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {}, child: const Text("Checkout")),
                  ),
                  const SizedBox(height: Sizes.spaceBetweenSections),

                  /// Description
                  const SectionHeading(
                      title: "Description", showActionButton: false),
                  const SizedBox(height: Sizes.spaceBetweenItems),
                  const ReadMoreText(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.",
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: " Show more",
                    trimExpandedText: " Less",
                    moreStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),

                  /// Reviews
                  const Divider(),
                  const SizedBox(height: Sizes.spaceBetweenItems),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SectionHeading(
                        title: "Reviews (199)",
                        showActionButton: false,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Iconsax.arrow_right3,
                          size: 18,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
