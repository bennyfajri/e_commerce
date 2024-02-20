import 'package:e_commerce/data/repositories/authentication/authentication_repository.dart';
import 'package:e_commerce/utils/constants/image_strings.dart';
import 'package:e_commerce/utils/helpers/network_manager.dart';
import 'package:e_commerce/utils/popups/full_screen_loader.dart';
import 'package:e_commerce/utils/popups/loaders.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  /// Variables
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();


  @override
  void onInit() {
    super.onInit();
    if (localStorage.read("REMEMBER_ME_EMAIL") != null) {
      email.text = localStorage.read("REMEMBER_ME_EMAIL");
      password.text = localStorage.read("REMEMBER_ME_PASSWORD");
      rememberMe.value = true;
    }
  }

  /// Email and Password SignIn
  Future<void> signInWithEmailAndPassword() async {
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
      if (!loginFormKey.currentState!.validate()) {
        FullScreenLoader.stopLoading();
        return;
      }

      // Save data if Remember me is selected
      if (rememberMe.value) {
        localStorage.write("REMEMBER_ME_EMAIL", email.text.trim());
        localStorage.write("REMEMBER_ME_PASSWORD", password.text.trim());
      } else {
        localStorage.remove("REMEMBER_ME_EMAIL");
        localStorage.remove("REMEMBER_ME_PASSWORD");
      }

      // login user using email & password authentication
      await AuthenticationRepository.instance.loginWIthEmailAndPassword(email.text.trim(), password.text.trim());

      // Remove loader
      FullScreenLoader.stopLoading();

      // Redirect
      AuthenticationRepository.instance.screenRedirect();

    } catch (e) {
      FullScreenLoader.stopLoading();
      Loaders.errorSnackBar(title: "Oh Snap", message: e.toString());
    }
  }
}
