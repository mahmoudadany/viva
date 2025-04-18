import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:viva/core/utilies/app_constant.dart';

class FirebaseServices {

  static final FirebaseAuth auth = FirebaseAuth.instance;

  static final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  static Future<void> setDataInCollection(
    String collectionName,
    Map<String, dynamic> value,
      {
    String? key,
  }) async {
    try {
      await firebaseFirestore.collection(collectionName).doc(key).set(value, SetOptions(merge: true));
    } catch (e) {
      rethrow;
    }
  }

  static Future<void> setIdInCart(
    String collectionName,
    Map<String, dynamic> value,
      {
    String? key,
  }) async {
    try {
      await firebaseFirestore.collection(collectionName).doc(key).set(value);
    } catch (e) {
      rethrow;
    }
  }

  static void updateDataInCollection(
    String collectionName,
    String key,
    Map<String, dynamic> value,
  ) {
    try {
      firebaseFirestore.collection(collectionName).doc(key).update(value);
    } catch (e) {
      rethrow;
    }
  }

  static Future<void> addItemInListOfCollection(
    String collectionName,
    String key,
    List list,
    listName,
  ) async{
    try {
      await firebaseFirestore.collection(collectionName).doc(key).update({
        '$listName': FieldValue.arrayUnion(list),
      });
    } catch (e) {
      rethrow;
    }
  }

  static Future<void> deleteDataInCollection(
    String collectionName,
    String key,
    Map<String, dynamic> value,
  ) async{
    try {
      await firebaseFirestore.collection(collectionName).doc(key).delete();
    } catch (e) {
      rethrow;
    }
  }

  static Future<QuerySnapshot> getCategory(String collection) async {
    try {
      return await firebaseFirestore.collection(collection).get();
    } catch (e) {
      rethrow;
    }
  }

  static Future<DocumentSnapshot> getCartItems() async {
    try {
      return await firebaseFirestore.collection("cart").doc(auth.currentUser!.uid).get();
    } catch (e) {
      rethrow;
    }
  }
  static Future<DocumentSnapshot> getUser() async {
    try {
      await auth.currentUser!.reload();
      return await firebaseFirestore.collection(AppConstant.users).doc(auth.currentUser!.uid).get();
    } catch (e) {
      rethrow;
    }
  }

  // static Future<List<CartItemModel>> getAllItemInCart()async{
  //   List<CartItemModel> list=[];
  //   try{
  //     DocumentSnapshot snapshot= await firebaseFirestore.collection(AppConstant.users).doc('oiIE1VsNfbUBxW6SDX81nnam08P2').get();
  //     if(snapshot.exists){
  //       Map<String,dynamic> map= snapshot.data() as Map<String,dynamic>;
  //         List l=map["cartItem"];
  //         l.forEach((element) {
  //           CartItemModel cartItemModel=CartItemModel.fromFirebase(element);
  //           list.add(cartItemModel);
  //         },);
  //         return list;
  //     }else{
  //       throw Exception();
  //     }
  //   }catch (e){
  //     rethrow;
  //   }
  // }

  static Future<bool> checkEmailVerify() async {
    await auth.currentUser!.reload();
    try {
      return auth.currentUser!.emailVerified ? true : false;
    } catch (e) {
      rethrow;
    }
  }

  static Future<bool> sendVerifyEmail() async {
    try {
      await auth.currentUser!.reload();
      if (auth.currentUser != null) {
        await auth.currentUser!.sendEmailVerification();
        return true;
      } else {
        throw Exception("not fond user please try again");
      }
    } catch (e) {
      rethrow;
    }
  }



}
