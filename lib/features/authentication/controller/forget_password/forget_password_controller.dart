import 'package:e_commerce/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:e_commerce/utils/constants/image_strings.dart';
import 'package:e_commerce/utils/popups/full_screen_loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../data/repositories/authentication/authentication_repository.dart';
import '../../../../utils/helpers/network_manager.dart';
import '../../../../utils/popups/loaders.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  /// Variables
  final email = TextEditingController();
  final forgetPasswordFormKey = GlobalKey<FormState>();

  /// Send Password Reset Email
  Future<void> sendPasswordResetEmail() async {
    try {
      // Start Loading
      FullScreenLoader.openLoadingDialog(
        "Logging you in",
        Images.docerAnimation,
      );

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }

      // Form validation
      if (!forgetPasswordFormKey.currentState!.validate()) {
        FullScreenLoader.stopLoading();
        return;
      }

      // Send email to reset password
      await AuthenticationRepository.instance.sendPassowrdResetEmail(email.text.trim());

      // Remove loader
      FullScreenLoader.stopLoading();

      // show success screen;
      Loaders.successSnackBar(
        title: "Email Sent",
        message: "A password reset link has been sent to your email.",
      );

      // Redirect
      Get.to(() => ResetPasswordScreen(email: email.text.trim()));

    } catch (e) {
      FullScreenLoader.stopLoading();
      Loaders.errorSnackBar(title: "Oh Snap! ", message: e.toString());
    }
  }

  /// Send Password Reset Email
  Future<void> resendPasswordResetEmail(String email) async {
    try {
      // Start Loading
      FullScreenLoader.openLoadingDialog(
        "Logging you in",
        Images.docerAnimation,
      );

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }

      // Send email to reset password
      await AuthenticationRepository.instance.sendPassowrdResetEmail(email);

      // Remove loader
      FullScreenLoader.stopLoading();

      // show success screen;
      Loaders.successSnackBar(
        title: "Email Sent",
        message: "A password reset link has been sent to your email.".tr,
      );

    } catch (e) {
      FullScreenLoader.stopLoading();
      Loaders.errorSnackBar(title: "Oh Snap! ", message: e.toString());
    }
  }
}