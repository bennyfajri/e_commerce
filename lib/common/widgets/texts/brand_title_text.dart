

import 'package:flutter/material.dart';

import '../../../utils/constants/enums.dart';

class BrandTitleText extends StatelessWidget {
  const BrandTitleText({
    super.key,
    this.textColor,
    this.maxLines = 1,
    required this.title,
    this.textAlign = TextAlign.center,
    this.brandTextSizes = TextSizes.small,
  });

  final String title;
  final Color? textColor;
  final int maxLines;
  final TextAlign textAlign;
  final TextSizes brandTextSizes;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      // Check which brandSize is required and set that style
      style: brandTextSizes == TextSizes.small
          ? Theme.of(context).textTheme.labelMedium?.apply(color: textColor)
          : brandTextSizes == TextSizes.medium
          ? Theme.of(context).textTheme.titleLarge?.apply(color: textColor)
          : Theme.of(context).textTheme.bodyMedium?.apply(color: textColor),
    );
  }
}