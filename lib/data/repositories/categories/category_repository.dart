import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/data/repositories/categories/firebase_storage_service.dart';
import 'package:e_commerce/features/shop/models/category_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../utils/exceptions/firebase_auth_exceptions.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/format_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';

class CategoryRepository extends GetxController {
  static CategoryRepository get instance => Get.find();

  /// Variable
  final _db = FirebaseFirestore.instance;

  /// Get all Categories
  Future<List<CategoryModel>> getAllCategories() async {
    try {
      final snapshot = await _db.collection("Categories").get();
      final list = snapshot.docs
          .map((document) => CategoryModel.fromSnapshot(document))
          .toList();
      return list;
    } on FirebaseException catch (e) {
      throw MyFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw MyPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong, Please try again";
    }
  }

  ///  Get Sub Categories
  ///  Upload Categories to the cloud Firebase
  Future<void> uploadDummyData(List<CategoryModel> categories) async {
    try {
      // Upload all the categories along with their images
      final storage = Get.put(FirebaseStorageService());

      // loop through each category
      for(var category  in categories) {
        // Get ImageData link from local assets
        final file = await storage.getImageDataFromAssets(category.image);

        // Upload image nad get its url
        final url = await storage.uploadImageData("Categories", file, category.name);

        // Assign URL to category image attribute
        category.image = url;

        await _db.collection("Categories").doc(category.id).set(category.toJson());
      }
    } on FirebaseException catch (e) {
      throw MyFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw MyPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong, Please try again";
    }
  }
}
