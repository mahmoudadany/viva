import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:viva/auth/data/model/user_model.dart';
import 'package:viva/core/utilies/services/firebase_services/firebase_services.dart';
import 'package:viva/home/data/model/ad_model.dart';
import 'package:viva/home/data/model/cart_item_nodel.dart';
import 'package:viva/home/data/model/product_model.dart';



abstract class BaseHomeRemoteDataSource{

  Future<void> addToCart(CartItemModel cartModel,String key);
  Future<UserModel> getUser();
  Future<List<ProductModel>> getProduct();
   Future<List<CartItemModel>> getCartItems();
  Future<List<AdModel>> getAd();
}

class HomeRemoteDataSource extends BaseHomeRemoteDataSource{

  @override
  Future<List<ProductModel>> getProduct() async{
    List<ProductModel> allProduct=[];
    try{
      await FirebaseServices.getCategory("product").then((value) {
        value.docs.forEach((element) {
         ProductModel productModel= ProductModel.fromFirebase(element.data() as Map<String,dynamic>);
         allProduct.add(productModel);
        },);
      },);
      return allProduct;
    }catch (e){
      rethrow;
    }
  }

  @override
  Future<List<AdModel>> getAd() async{
    List<AdModel> allProduct=[];
    try{
      await FirebaseServices.getCategory("ad").then((value) {
        value.docs.forEach((element) {
          AdModel adModel= AdModel.fromFirebase(element.data() as Map<String,dynamic>);
          allProduct.add(adModel);
        },);
      },);
      return allProduct;
    }catch (e){
      rethrow;
    }
  }

  @override
  Future<void> addToCart(CartItemModel cartModel,String key) async{
    try{
     await FirebaseServices.setDataInCollection(
       "cart",
       {cartModel.productId: cartModel.toFirebase()},
       key: key
     );
    }catch (e){
      rethrow;
    }
  }

  @override
  Future<List<CartItemModel>> getCartItems() async{
   try{
     List<CartItemModel> cart=[];
     DocumentSnapshot documentSnapshot= await FirebaseServices.getCartItems();
     if(documentSnapshot.exists){
       Map<String,dynamic> map= documentSnapshot.data() as Map<String,dynamic>;
       map.forEach((key, value) {
         cart.add(CartItemModel.fromFirebase(value));
       },);
       return cart;
     }else{
       throw Exception();
     }
   }catch (e){
     rethrow;
   }
  }

  @override
  Future<UserModel> getUser() async{
    try{
      DocumentSnapshot response= await FirebaseServices.getUser();
      if(response.exists){
        Map<String,dynamic> user=response.data() as Map<String,dynamic>;
        return UserModel.fromFirebaseUserMap(user);
      }else{
        throw Exception();
      }
    }catch (e){
      rethrow;
    }
  }

}