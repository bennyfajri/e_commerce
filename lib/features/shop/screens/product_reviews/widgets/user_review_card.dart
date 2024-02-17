import 'package:e_commerce/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:e_commerce/common/widgets/products/ratings/rating_indicator.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/image_strings.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = HelperFunctions.isDarkMode(context);

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(
                    backgroundImage: AssetImage(Images.userProfileImage1)),
                const SizedBox(width: Sizes.spaceBetweenItems),
                Text("John doe", style: Theme.of(context).textTheme.titleLarge),
              ],
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
          ],
        ),
        const SizedBox(height: Sizes.spaceBetweenItems),

        /// Review
        Row(
          children: [
            MyRatingBarIndicator(rating: 4),
            const SizedBox(width: Sizes.spaceBetweenItems),
            Text("17 Feb 2024", style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: Sizes.spaceBetweenItems),
        const ReadMoreText(
          "The user interface of the app is quire intuitive, I was able to navigate and make purchase seamlessly. Great job!",
          trimLines: 2,
          trimExpandedText: " Show Less",
          trimCollapsedText: " Read more",
          trimMode: TrimMode.Line,
          moreStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: MyColors.primary),
          lessStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: MyColors.primary),
        ),
        const SizedBox(height: Sizes.spaceBetweenItems),

        /// Company Review
        RoundedContainer(
          backgroundColor: isDarkMode ? MyColors.darkerGrey : MyColors.grey,
          child: Padding(
            padding: EdgeInsets.all(Sizes.md),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Benny Store",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Text(
                      "17 Feb, 2024",
                      style: Theme.of(context).textTheme.bodyMedium,
                    )
                  ],
                ),

                const ReadMoreText(
                  "The user interface of the app is quire intuitive, I was able to navigate and make purchase seamlessly. Great job!",
                  trimLines: 2,
                  trimExpandedText: " Show Less",
                  trimCollapsedText: " Read more",
                  trimMode: TrimMode.Line,
                  moreStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: MyColors.primary),
                  lessStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: MyColors.primary),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: Sizes.spaceBetweenItems)
      ],
    );
  }
}
