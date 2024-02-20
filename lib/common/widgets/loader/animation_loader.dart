import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AnimationLoader extends StatelessWidget {
  const AnimationLoader({
    super.key,
    required this.text,
    required this.animation,
    this.showAction = false,
    this.actionText,
    this.onActionPressed,
  });

  final String text, animation;
  final bool showAction;
  final String? actionText;
  final VoidCallback? onActionPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Lottie.asset(animation, width: MediaQuery
            .of(context)
            .size
            .width * 0.8),
        const SizedBox(height: Sizes.defaultSpace),
        Text(
          text,
          style: Theme
              .of(context)
              .textTheme
              .bodyMedium,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: Sizes.defaultSpace),
        showAction ?
        SizedBox(
          width: 250,
          child: OutlinedButton(
            onPressed: onActionPressed,
            style: OutlinedButton.styleFrom(backgroundColor: MyColors.dark),
            child: Text(
              actionText!,
              style: Theme
                  .of(context)
                  .textTheme
                  .bodyMedium
                  ?.apply(color: MyColors.light),
            ),
          ),
        ) : const SizedBox()
      ],
    );
  }
}
