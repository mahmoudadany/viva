
import 'package:viva/auth/domain/entities/user.dart';
import 'package:viva/core/utilies/services/firebase_services/firebase_services.dart';
import 'package:viva/home/data/data_source/remote/home_remote_datasource.dart';
import 'package:viva/home/data/model/cart_item_nodel.dart';
import 'package:viva/home/domain/base_repository/base_home_repository.dart';
import 'package:viva/home/domain/entities/Product.dart';
import 'package:viva/home/domain/entities/ad.dart';

class HomeRepository extends BaseHomeRepository {
  BaseHomeRemoteDataSource baseHomeRemoteDataSource;

  HomeRepository(this.baseHomeRemoteDataSource);

  @override
  Future<List<Product>> getProduct() async {
    try {
      return await baseHomeRemoteDataSource.getProduct();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Ad>> getAd() async {
    try {
      return await baseHomeRemoteDataSource.getAd();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> addToCart(CartItemModel cartModel) async {
    try {
      await baseHomeRemoteDataSource.addToCart(
          cartModel, FirebaseServices.auth.currentUser!.uid);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<CartItemModel>> getCartItem() async {
    try {
      return await baseHomeRemoteDataSource.getCartItems();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<MainUser> getUser() async {
    try {
      return await baseHomeRemoteDataSource.getUser();
    }catch (e){
      rethrow;
    }

  }


}