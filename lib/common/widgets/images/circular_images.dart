import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/common/widgets/shimmer/shimmer.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';

class CircularImage extends StatelessWidget {
  const CircularImage({
    super.key,
    this.fit = BoxFit.cover,
    required this.image,
    this.isNetworkImage = false,
    this.overlayColor,
    this.backgroundColor,
    this.width = 56,
    this.height = 56,
    this.padding = Sizes.sm,
  });

  final BoxFit? fit;
  final String image;
  final bool isNetworkImage;
  final Color? overlayColor;
  final Color? backgroundColor;
  final double width, height, padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: width,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: backgroundColor ??
            (HelperFunctions.isDarkMode(context)
                ? MyColors.black
                : MyColors.white),
        borderRadius: BorderRadius.circular(100),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Center(
          child: isNetworkImage
              ? CachedNetworkImage(
                  imageUrl: image,
                  color: overlayColor,
                  fit: fit,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      const ShimmerEffect(width: 55, height: 55),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                )
              : Image(
                  image: AssetImage(image),
                  color: overlayColor,
                  fit: fit,
                ),
        ),
      ),
    );
  }
}
