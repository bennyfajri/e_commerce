import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../../controller/signup/register_controller.dart';

class TermsAndConditionCheckbox extends StatelessWidget {
  const TermsAndConditionCheckbox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = RegisterController.instance;

    final isDark = HelperFunctions.isDarkMode(context);
    return Row(
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: Obx(
            () => Checkbox(
                value: controller.privacyPolicy.value,
                onChanged: (value) => controller.privacyPolicy.value =
                    value!),
          ),
        ),
        const SizedBox(width: Sizes.spaceBetweenItems),
        Text.rich(TextSpan(children: [
          TextSpan(
            text: "${Texts.iAgreeTo} ",
            style: Theme.of(context).textTheme.bodySmall,
          ),
          TextSpan(
            text: Texts.privacyPolicy,
            style: Theme.of(context).textTheme.bodyMedium?.apply(
                color: isDark ? MyColors.white : MyColors.primary,
                decoration: TextDecoration.underline,
                decorationColor: isDark ? MyColors.white : MyColors.primary),
          ),
          TextSpan(
            text: " ${Texts.and} ",
            style: Theme.of(context).textTheme.bodySmall,
          ),
          TextSpan(
            text: Texts.termsOfUse,
            style: Theme.of(context).textTheme.bodyMedium?.apply(
                color: isDark ? MyColors.white : MyColors.primary,
                decoration: TextDecoration.underline,
                decorationColor: isDark ? MyColors.white : MyColors.primary),
          ),
        ]))
      ],
    );
  }
}
