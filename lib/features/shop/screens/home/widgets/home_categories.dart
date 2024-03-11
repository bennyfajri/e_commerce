import 'package:e_commerce/common/widgets/shimmer/category_shimmer.dart';
import 'package:e_commerce/features/shop/controllers/CategoryController.dart';
import 'package:e_commerce/features/shop/screens/sub_category/sub_categories.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/image_text_widget/vertical_image_text.dart';
import '../../../../../utils/constants/image_strings.dart';

class HomeCategories extends StatelessWidget {
  const HomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final categoryController = Get.put(CategoryController());


    return Obx(() {
      if (categoryController.isLoading.value) return const CategoryShimmer();

      if (categoryController.featuredCategories.isEmpty) {
        return Center(
          child: Text("No data found!", style: Theme
              .of(context)
              .textTheme
              .bodyMedium!
              .apply(color: Colors.white),),
        );
      }

      return SizedBox(
        height: 80,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: categoryController.featuredCategories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            final category = categoryController.featuredCategories[index];
            return VerticalImageText(
              image: category.image,
              title: category.name,
              onTap: () => Get.to(() => const SubCategoriesScreen()), isNetworkImage: true,
            );
          },
        ),
      );
    });
  }
}