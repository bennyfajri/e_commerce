import 'dart:ffi';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';

class FirebaseStorageService extends GetxController {
  static FirebaseStorageService get instane => Get.find();

  final _firebaseStorage = FirebaseStorage.instance;

  /// Upload local assetts from IDE
  /// Return a Uint8List containing image data
  Future<Uint8List> getImageDataFromAssets(String path) async {
    try {
      final byteData = await rootBundle.load(path);
      final imageData = byteData.buffer
          .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes);
      return imageData;
    } catch (e) {
      throw "Error loading image data: $e";
    }
  }

  /// Upload image using image data on cloud firebase storage
  /// Return the download URL of hte uploaded image
  Future<String> uploadImageData(
    String path,
    Uint8List image,
    String name,
  ) async {
    try {
      final ref = _firebaseStorage.ref(path).child(name);
      await ref.putData(image);
      final url = await ref.getDownloadURL();
      return url;
    } on FirebaseException catch (e) {
      throw MyFirebaseException(e.code).message;
    } on SocketException catch (e) {
      throw "Network Error ${e.message}";
    } on PlatformException catch (e) {
      throw MyPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong, Please try again";
    }
  }

  /// Upload Image on Cloud firebase storage
  /// Return the download URL of the uploaded image
  Future<String> uploadImageFile(String path, XFile image) async {
    try {
      final ref = _firebaseStorage.ref(path).child(image.name);
      await ref.putFile(File(image.path));
      final url = await ref.getDownloadURL();
      return url;
    } on FirebaseException catch (e) {
      throw MyFirebaseException(e.code).message;
    } on SocketException catch (e) {
      throw "Network Error ${e.message}";
    } on PlatformException catch (e) {
      throw MyPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong, Please try again";
    }
  }
}
