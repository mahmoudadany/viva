import 'package:firebase_auth/firebase_auth.dart';
import 'package:viva/auth/domain/entities/user.dart';

class UserModel extends MainUser {
  UserModel({
    required super.id,
    super.name,
    super.email,
    super.picture,
    super.phoneNumber,
  });



  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(
    id: user.uid,
    name: user.displayName,
    email: user.email,
    picture: user.photoURL,
    phoneNumber: user.phoneNumber,
  );
  }

  factory UserModel.fromFirebaseUserMap(Map<String,dynamic> user) {
    return UserModel(
     id: user['id'],
      name: user['name'],
      email: user['email'],
      picture: user['picture'],
      phoneNumber: user['phoneNumber'],
    );
  }
}
