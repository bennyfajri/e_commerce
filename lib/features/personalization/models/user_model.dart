import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/utils/formatters/formatter.dart';

class UserModel {
  final String id;
  String firstName;
  String lastName;
  final String username;
  final String email;
  String phoneNumber;
  String profilePicture;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.email,
    required this.phoneNumber,
    required this.profilePicture,
  });

  String get fullName => "$firstName $lastName";

  String get formattedPhoneNo => MyFormatter.formatPhoneNumber(phoneNumber);

  static List<String> nameParts(fullName) => fullName.split(" ");

  static String generateUsername(fullname) {
    List<String> nameParts = fullname.split(" ");
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : "";

    String camelCaseUsername = "$firstName$lastName";
    String usernameWithPrefix = "cwt_$camelCaseUsername";
    return usernameWithPrefix;
  }

  static UserModel empty() => UserModel(
      id: "",
      firstName: "",
      lastName: "",
      username: "",
      email: "",
      phoneNumber: "",
      profilePicture: "");

  Map<String, dynamic> toJson() {
    return {
      "FirstName": firstName,
      "LastName": lastName,
      "Username": username,
      "Email": email,
      "PhoneNumber": phoneNumber,
      "ProfilePicture": profilePicture,
    };
  }

  factory UserModel.fromSnapshot(
    DocumentSnapshot<Map<String, dynamic>> documentSnapshot,
  ) {
    if(documentSnapshot.data() != null) {
      final data = documentSnapshot.data()!;
      return UserModel(
        id: documentSnapshot.id,
        firstName: data['FirstName'],
        lastName: data["LastName"],
        username: data["Username"],
        email: data["Email"],
        phoneNumber: data["phoneNumber"],
        profilePicture: data["ProfilePicture"],
      );
    } else {
      return UserModel.empty();
    }

  }
}
