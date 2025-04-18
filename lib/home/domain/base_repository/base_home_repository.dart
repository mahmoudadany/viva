import 'package:firebase_auth/firebase_auth.dart';
import 'package:viva/auth/domain/entities/user.dart';
import 'package:viva/home/data/model/cart_item_nodel.dart';
import 'package:viva/home/domain/entities/Product.dart';
import 'package:viva/home/domain/entities/ad.dart';


abstract class BaseHomeRepository{
  Future<MainUser> getUser();

  Future<List<Product>> getProduct();

  Future<List<Ad>> getAd();

   Future<List<CartItemModel>> getCartItem();

  Future<void> addToCart(CartItemModel cartModel);
}