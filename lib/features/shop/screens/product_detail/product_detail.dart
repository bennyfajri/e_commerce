import 'package:e_commerce/features/shop/screens/product_detail/widgets/product_detail_image_slider.dart';
import 'package:e_commerce/features/shop/screens/product_detail/widgets/product_meta_data.dart';
import 'package:e_commerce/features/shop/screens/product_detail/widgets/rating_and_share.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Product Image Slider
            ProductImageSlider(),

            /// Product Details
            Padding(
              padding: EdgeInsets.only(
                right: Sizes.defaultSpace,
                left: Sizes.defaultSpace,
                bottom: Sizes.defaultSpace,
              ),
              child: Column(
                children: [
                  /// Rating & Share
                  RatingAndShare(),
                  /// Price, Title, Stock & Brand
                  ProductMetaData(),

                  /// Attributes
                  /// Checkout Button
                  /// Description
                  /// Reviews
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
