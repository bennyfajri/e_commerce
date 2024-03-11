import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  String id;
  String name;
  String image;
  String parentId;
  bool isFeatured;

  CategoryModel({
    required this.id,
    required this.name,
    required this.image,
    required this.isFeatured,
    this.parentId = "",
  });

  /// Empty Helper Function
  static CategoryModel empty() =>
      CategoryModel(id: "", name: "", image: "", isFeatured: false);

  /// Convert model to Json Structure so that you can store data in firebase
  Map<String, dynamic> toJson() {
    return {
      "Name": name,
      "Image": image,
      "ParentId": parentId,
      "IsFeatured": isFeatured
    };
  }

  /// Map Json oriented codument snapshot from firestore to UserModel
  factory CategoryModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;

      return CategoryModel(id: document.id,
        name: data["Name"] ?? "",
        image: data["Image"] ?? "",
        isFeatured: data["IsFeatured"] ?? "",);
    } else {
      return CategoryModel.empty();
    }
  }
}
