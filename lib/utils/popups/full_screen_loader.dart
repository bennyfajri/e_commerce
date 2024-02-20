import 'package:e_commerce/common/widgets/loader/animation_loader.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FullScreenLoader {
  static void openLoadingDialog(String text, String animation) {
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false,
      builder: (_) => PopScope(
        child: Container(
          color: HelperFunctions.isDarkMode(Get.context!) ? MyColors.dark : MyColors.white,
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              const SizedBox(height: 250),
              AnimationLoader(text: text, animation: animation)
            ],
          ),
        ),
      ),
    );
  }

  static stopLoading() {
   Get.back();
  }
}
