import 'package:e_commerce/common/widgets/images/circular_images.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';

class VerticalImageText extends StatelessWidget {
  const VerticalImageText({
    super.key,
    required this.image,
    required this.title,
    this.textColor = MyColors.white,
    this.backgroundColor,
    this.onTap,
    this.isNetworkImage = false,
  });

  final String image, title;
  final Color textColor;
  final Color? backgroundColor;
  final bool isNetworkImage;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = HelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: Sizes.spaceBetweenItems),
        child: Column(
          children: [

            /// Circular Icon
            CircularImage(image: image, fit: BoxFit.fitWidth,
              padding: Sizes.sm * 1.4,
              isNetworkImage: isNetworkImage,
              backgroundColor: backgroundColor,
              overlayColor: HelperFunctions.isDarkMode(context) ? MyColors.light : MyColors.dark,
            ),

            /// Text
            const SizedBox(height: Sizes.spaceBetweenItems / 2),
            SizedBox(
              width: 55,
              child: Text(
                title,
                style: Theme
                    .of(context)
                    .textTheme
                    .labelMedium,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      ),
    );
  }
}
