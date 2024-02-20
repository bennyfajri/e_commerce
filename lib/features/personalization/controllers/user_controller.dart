import 'package:e_commerce/data/repositories/user/user_repository.dart';
import 'package:e_commerce/features/personalization/models/user_model.dart';
import 'package:e_commerce/utils/popups/loaders.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final userRepository = Get.put(UserRepository());

  /// Save user Record from any Registration Provider
  Future<void> saveUserRecord(UserCredential? userCredentials) async {
    try {
      if (userCredentials != null) {
        // Convert name to first and last name
        final nameParts =
            UserModel.nameParts(userCredentials.user?.displayName! ?? "");
        final username = UserModel.generateUsername(
            userCredentials.user?.displayName! ?? "");

        // Create user model
        final user = UserModel(
          id: userCredentials.user!.uid,
          firstName: nameParts[0],
          lastName: nameParts.length > 1 ? nameParts.sublist(1).join(" ") : "",
          username: username,
          email: userCredentials.user?.email ?? "",
          phoneNumber: userCredentials.user?.phoneNumber ?? "",
          profilePicture: userCredentials.user?.photoURL ?? "",
        );

        // Save user data
        await userRepository.saveUserRecord(user);
      }
    } catch (e) {
      Loaders.warningSnackBar(
        title: "Data not saved",
        message:
            "An error occurred while saving user data. Please try again later.",
      );
    }
  }
}
