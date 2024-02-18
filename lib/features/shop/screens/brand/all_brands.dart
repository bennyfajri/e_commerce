import 'package:e_commerce/common/widgets/appbar/appbar.dart';
import 'package:e_commerce/common/widgets/brands/brands_card.dart';
import 'package:e_commerce/common/widgets/layout/grid_product_layout.dart';
import 'package:e_commerce/common/widgets/texts/section_heading.dart';
import 'package:e_commerce/features/shop/screens/brand/brand_products.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        title: Text("Brand"),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Sizes.defaultSpace),
          child: Column(
            children: [
              /// Heading
              const SectionHeading(
                title: "Brands",
                showActionButton: true,
              ),
              const SizedBox(height: Sizes.spaceBetweenItems),

              /// Brands
              GridProductLayout(
                itemCount: 10,
                mainAxisExtent: 80,
                itemBuilder: (context, index) => BrandsCard(
                  showBorder: true,
                  onTap: () => Get.to(
                    () => const BrandProducts(),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
