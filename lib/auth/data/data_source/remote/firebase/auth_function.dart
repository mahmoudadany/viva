import 'package:firebase_auth/firebase_auth.dart';
import 'package:viva/auth/domain/entities/user.dart';
import 'package:viva/core/utilies/app_constant.dart';


import '../../../../../core/utilies/services/firebase_services/firebase_services.dart';

abstract class BaseFirebaseAuthRemoteDataSource {
  final FirebaseAuth _auth = FirebaseServices.auth;

  Future<User> authWithGoogleOrFacebook(AuthCredential credential);

  Future<User> authWithEmailAndPassword(String email, String password);

  Future<User> signUpWithEmailAndPassword(String email, String password);

  Future<bool> addUserInUserCollection(MainUser user);



  // Future<UserModel> authWithFacebookAccount(AuthCredential credential);
}

class FirebaseAuthRemoteDataSource extends BaseFirebaseAuthRemoteDataSource {

  FirebaseAuthRemoteDataSource._();
  static  final FirebaseAuthRemoteDataSource _firebaseAuthRemoteDataSource=FirebaseAuthRemoteDataSource._();
  factory FirebaseAuthRemoteDataSource()=>_firebaseAuthRemoteDataSource;

  @override
  Future<User> authWithGoogleOrFacebook(AuthCredential credential) async {
    UserCredential userCredential = await _auth.signInWithCredential(
      credential,
    );
    if (userCredential.user != null) {
      return userCredential.user!;
    } else {
      throw Exception();
    }
  }

  @override
  Future<User> authWithEmailAndPassword(String email, String password) async {
    UserCredential userCredential = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    if (userCredential.user != null) {
      return userCredential.user!;
    } else {
      throw Exception();
    }
  }

  @override
  Future<User> signUpWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return credential.user!;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> addUserInUserCollection(MainUser user) async {
    try {
      FirebaseServices.setDataInCollection(AppConstant.users, user.toMap(),key: user.id,);
      return true;
    } catch (e) {
      throw Exception();
    }
  }






}

// @override
// Future<UserModel> authWithFacebookAccount(AuthCredential credential) async {
//   UserCredential userCredential= await FirebaseAuth.instance.signInWithCredential(credential);
//   if(userCredential.user!=null){
//     return UserModel.fromFirebaseUser(userCredential.user!);
//   }else{
//     throw Exception();
//   }
// }

// _auth.authStateChanges().listen((event) async {
// if (event != null) {
// await event.reload();
// if (event.emailVerified) {}
// }
// });
