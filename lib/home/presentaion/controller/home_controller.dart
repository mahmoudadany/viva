import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viva/auth/domain/entities/user.dart';
import 'package:viva/core/utilies/app_constant.dart';
import 'package:viva/core/utilies/local_storage/get_storage.dart';
import 'package:viva/home/data/data_source/remote/home_remote_datasource.dart';
import 'package:viva/home/data/model/cart_item_nodel.dart';
import 'package:viva/home/data/model/product_model.dart';
import 'package:viva/home/data/repository/home_repository.dart';
import 'package:viva/home/domain/base_repository/base_home_repository.dart';
import 'package:viva/home/domain/entities/Product.dart';
import 'package:viva/home/domain/use_case/add_to_cart_usecase.dart';
import 'package:viva/home/domain/use_case/get_ad_usecase.dart';
import 'package:viva/home/domain/use_case/get_cart_items_usecase.dart';
import 'package:viva/home/domain/use_case/get_product_usecase.dart';
import 'package:viva/home/domain/use_case/get_user_usecase.dart';
import 'package:viva/home/presentaion/components/account_component.dart';
import 'package:viva/home/presentaion/components/cared_component.dart';
import 'package:viva/home/presentaion/components/home_component.dart';
import 'package:viva/home/presentaion/screens/home_screen.dart';

import '../../../core/utilies/services/firebase_services/firebase_services.dart';
import '../screens/cart_screen.dart';

class HomeController extends GetxController {
  final RxBool homeLoading = false.obs;
  final RxBool cartLoading = true.obs;
  static RxInt bottomBarIndex = 0.obs;
  RxBool male = false.obs;
  RxBool feMale = false.obs;
  RxBool darkMode = false.obs;
  RxBool isArabic = false.obs;
  RxBool visibleSimilarProduct = false.obs;
  RxBool visibleDescription = false.obs;
  RxBool visibleReviews = false.obs;
  RxList allProduct = [].obs;
  RxList similarProduct = [].obs;
  RxList futureProduct = [].obs;
  RxList customProduct = [].obs;
  RxList femaleProduct = [].obs;
  RxList topRatedProduct = [].obs;
  RxList allAd = [].obs;
  var cartItems = <CartItemModel>[].obs;
  Rx<MainUser?> userData = GetLocalStorage.getUser().obs;
  RxList featureProduct = [].obs;
  late Product cartProduct;
  var productPrice = 0.obs;
  RxInt discount = 0.obs;
  RxInt total = 0.obs;
  RxInt colorSelected = 0.obs;
  RxString sizeSelected = 'M'.obs;



  //   List<ProductModel> list=
  //  [
  //   ProductModel("test 11", "description test 1","sss", "male", "suit", "75", "15-02-2025",5, ["https://media.licdn.com/dms/image/v2/D4D35AQHiceQdQCakTA/profile-framedphoto-shrink_200_200/B4DZVOvPvcHkAY-/0/1740782763286?e=1743379200&v=beta&t=RaV3uD_qjLpWIxoA0CR8Bi_HPOwJxlMpj3jCmtKh4JU"],['M','L','XL'],["red","blue","green"],{'5':60,'4':50,'3':40,'2':30,'1':20},),
  //   ProductModel("test 12", "description test 12","ssdfsd", "male", "suit", "75", "15-02-2025",5, ["https://media.licdn.com/dms/image/v2/D4D35AQHiceQdQCakTA/profile-framedphoto-shrink_200_200/B4DZVOvPvcHkAY-/0/1740782763286?e=1743379200&v=beta&t=RaV3uD_qjLpWIxoA0CR8Bi_HPOwJxlMpj3jCmtKh4JU"],['M','L','XL'],["red","blue","green"],{'5':60,'4':50,'3':40,'2':30,'1':20},),
  //   ProductModel("test 13", "description test 13","ssdfsd", "male", "suit", "75", "15-02-2025",5, ["https://media.licdn.com/dms/image/v2/D4D35AQHiceQdQCakTA/profile-framedphoto-shrink_200_200/B4DZVOvPvcHkAY-/0/1740782763286?e=1743379200&v=beta&t=RaV3uD_qjLpWIxoA0CR8Bi_HPOwJxlMpj3jCmtKh4JU"],['M','L','XL'],["red","blue","green"],{'5':60,'4':50,'3':40,'2':30,'1':20},),
  //   ProductModel("test 14", "description test 14","ssdfsd", "male", "suit", "75", "15-02-2025",5, ["https://media.licdn.com/dms/image/v2/D4D35AQHiceQdQCakTA/profile-framedphoto-shrink_200_200/B4DZVOvPvcHkAY-/0/1740782763286?e=1743379200&v=beta&t=RaV3uD_qjLpWIxoA0CR8Bi_HPOwJxlMpj3jCmtKh4JU"],['M','L','XL'],["red","blue","green"],{'5':60,'4':50,'3':40,'2':30,'1':20},),
  //   ProductModel("test 15", "description test 15","ssdfsd", "male", "suit", "75", "15-02-2025",5, ["https://media.licdn.com/dms/image/v2/D4D35AQHiceQdQCakTA/profile-framedphoto-shrink_200_200/B4DZVOvPvcHkAY-/0/1740782763286?e=1743379200&v=beta&t=RaV3uD_qjLpWIxoA0CR8Bi_HPOwJxlMpj3jCmtKh4JU"],['M','L','XL'],["red","blue","green"],{'5':60,'4':50,'3':40,'2':30,'1':20},),
  //   ProductModel("test 16", "description test 16", "sdsdsd","female", "suit", "75", "15-02-2025",5, ["https://media.licdn.com/dms/image/v2/D4D35AQHiceQdQCakTA/profile-framedphoto-shrink_200_200/B4DZVOvPvcHkAY-/0/1740782763286?e=1743379200&v=beta&t=RaV3uD_qjLpWIxoA0CR8Bi_HPOwJxlMpj3jCmtKh4JU"],['M','L','XL'],["red","blue","green"],{'5':60,'4':50,'3':40,'2':30,'1':20},),
  //   ProductModel("test 17", "description test 17", "sdsdsd","female", "suit", "75", "15-02-2025",5, ["https://media.licdn.com/dms/image/v2/D4D35AQHiceQdQCakTA/profile-framedphoto-shrink_200_200/B4DZVOvPvcHkAY-/0/1740782763286?e=1743379200&v=beta&t=RaV3uD_qjLpWIxoA0CR8Bi_HPOwJxlMpj3jCmtKh4JU"],['M','L','XL'],["red","blue","green"],{'5':60,'4':50,'3':40,'2':30,'1':20},),
  //   ProductModel("test 18", "description test 18", "sdsdsd","female", "suit", "75", "15-02-2025",5, ["https://media.licdn.com/dms/image/v2/D4D35AQHiceQdQCakTA/profile-framedphoto-shrink_200_200/B4DZVOvPvcHkAY-/0/1740782763286?e=1743379200&v=beta&t=RaV3uD_qjLpWIxoA0CR8Bi_HPOwJxlMpj3jCmtKh4JU"],['M','L','XL'],["red","blue","green"],{'5':60,'4':50,'3':40,'2':30,'1':20},),
  //   ProductModel("test 19", "description test 9", "sdsdsd","female", "suit", "75", "15-02-2025",5, ["https://media.licdn.com/dms/image/v2/D4D35AQHiceQdQCakTA/profile-framedphoto-shrink_200_200/B4DZVOvPvcHkAY-/0/1740782763286?e=1743379200&v=beta&t=RaV3uD_qjLpWIxoA0CR8Bi_HPOwJxlMpj3jCmtKh4JU"],['M','L','XL'],["red","blue","green"],{'5':60,'4':50,'3':40,'2':30,'1':20},),
  //   ProductModel("test 20", "description test 20", "sdsdsd","female", "suit", "75", "15-02-2025",5, ["https://media.licdn.com/dms/image/v2/D4D35AQHiceQdQCakTA/profile-framedphoto-shrink_200_200/B4DZVOvPvcHkAY-/0/1740782763286?e=1743379200&v=beta&t=RaV3uD_qjLpWIxoA0CR8Bi_HPOwJxlMpj3jCmtKh4JU"],['M','L','XL'],["red","blue","green"],{'5':60,'4':50,'3':40,'2':30,'1':20},),
  // ];

  @override
  void onInit() {
    super.onInit();
    getWearCategory();
  }

  Rx<Widget> component() {
    switch (bottomBarIndex.value) {
      case 0:
        return HomeComponent().obs;
      case 1:
        return CaretComponent().obs;
      case 2:
        return AccountComponent().obs;
      default:
        return HomeComponent().obs;
    }
    throw Exception();
  }

  Future<void> setData(List<ProductModel> list) async {
    list.forEach((element) async {
      try {
        await FirebaseServices.setDataInCollection(
          "product",
          element.toFirebase(),
        );
      } catch (e) {
        rethrow;
      }
    });
  }

  // void addToCart() async {
  //   try {
  //     await FirebaseServices.addItemInListOfCollection(
  //       AppConstant.users,
  //       'oiIE1VsNfbUBxW6SDX81nnam08P2',
  //       [CartItemModel.fromProduct(cartProduct, 1, true).toFirebase()],
  //       'cartItem',
  //     ).then((value) async {
  //       getCartItems();
  //     });
  //   } catch (e) {
  //     print("glal ${e.toString()}");
  //     Get.snackbar("firebase", "message");
  //   }
  // }

  void addToCart(Product product,String color) {
    try{
      CartItemModel cartModel=CartItemModel.fromProduct(product, 1, true,sizeSelected.value,color);
      BaseHomeRemoteDataSource baseHomeRemoteDataSource=HomeRemoteDataSource();
      BaseHomeRepository baseHomeRepository=HomeRepository(baseHomeRemoteDataSource);
       AddToCartUseCase(baseHomeRepository).execute(cartModel).then((value) async{
         bottomBarIndex.value = 1;
         Get.to(HomeScreen());
          await getCartItems();
       },);
    }catch (e){
      Get.snackbar("add to cart", "message");
    }

  }

  Future<void> getCartItems() async {
    BaseHomeRemoteDataSource baseHomeRemoteDataSource= HomeRemoteDataSource();
    BaseHomeRepository baseHomeRepository=HomeRepository(baseHomeRemoteDataSource);
    await GetCartItemsUseCase(baseHomeRepository).execute().then((value) {
      cartItems.value=value;
      cartLoading.value=false;
      cartItems.refresh();

    },);
  }

  void getWearCategory() async {
    try {
       // await setData(list);
      homeLoading.value = true;
      BaseHomeRemoteDataSource baseHomeRemoteDataSource =
          HomeRemoteDataSource();
      BaseHomeRepository baseHomeRepository = HomeRepository(
        baseHomeRemoteDataSource,
      );
      await GetWearProductUseCase(baseHomeRepository).execute().then((value) {
        allProduct.value = value;
         chooseGender();
        homeLoading.value = false;
      });
      await GetAdUseCase(baseHomeRepository).execute().then((value) {
        allAd.value=[];
        allAd.value = value;
      },);
    } catch (e) {
      print("eeee ${e.toString()}");
    }
  }

  int dataMethod(String date) {
    List<String> parts = date.split('-');
    int day = int.parse(parts[0]);
    int month = int.parse(parts[1]);
    int year = int.parse(parts[2]);
    DateTime today = DateTime.now();
    DateTime givenDate = DateTime(year, month, day);
    Duration difference = today.difference(givenDate);
    return difference.inDays;
  }

  void getProductPrice() {
    int count = 0;
     cartItems.forEach((element) {
      CartItemModel cartItemModel = element;
      if(cartItemModel.check){
        count += int.parse(element.price)*element.userItemCount;
      }
    }

    );
    productPrice.value=count;
    getTotal();
    productPrice.refresh();
  }

  void getTotal() {
    cartItems.forEach((element) {
      total.value = productPrice.value - discount.value;
      total.refresh();
    });
  }

  static Future<MainUser> getUserData() async{
    BaseHomeRemoteDataSource baseHomeRemoteDataSource=HomeRemoteDataSource();
    BaseHomeRepository baseHomeRepository=HomeRepository(baseHomeRemoteDataSource);
      return await GetUserUseCase(baseHomeRepository).execute();
  }

  void chooseGender(){
    String gender=GetLocalStorage.getGenderState();
    if(gender=="male"){
      male.value = true;
      feMale.value = false;
      getCustomProduct(gender);
    }else{
      feMale.value = true;
      male.value = false;
      getCustomProduct(gender);
    }
  }

  void getCustomProduct(String type) {
    homeLoading.value=true;
    customProduct.value=[];
    allProduct.forEach((element) {
      Product product=element;
      if(product.mainCategory==type){
        customProduct.add(product);
      }
    },);
    getFutureProduct();
    homeLoading.value=false;
    // update();
  }

  void getTopRatedProduct(String type) {
    homeLoading.value=true;
    topRatedProduct.value=[];
    customProduct.forEach((element) {
      Product product=element;
      int allRate=0;
      product.ratings.values.map((e) {
        allRate+=e as int;
      } ,).toList();
      if(allRate*100>=80){
        topRatedProduct.add(product);
      }
    },);
    getFutureProduct();
    homeLoading.value=false;
    // update();
  }

  void getSimilarProduct(String productCatagory){
    similarProduct.value=[];
    allProduct.value.forEach((element) {
      if(productCatagory==element.mainCategory){
        similarProduct.value.add(element);
      }
    },);
    similarProduct.refresh();
  }

  void getFutureProduct() {
    homeLoading.value=true;
    featureProduct.value=[];
    customProduct.forEach((element) {
      Product product=element;
      int days=dataMethod(product.date);
      if(days<=7){
        featureProduct.add(product);
      }
    },);
    print("dddd ${featureProduct.length}");
    homeLoading.value=false;
    update();
  }

  void plus(int index) async{
    cartItems[index].userItemCount++;
    cartItems.refresh();
    await updateCartItem(cartItems[index]);
    getProductPrice();
  }

  void minus(int index) async{
    cartItems[index].userItemCount--;
    cartItems.refresh();
    await updateCartItem(cartItems[index]);
    getProductPrice();
  }

  void changeCheckBox(int index) async{
    cartItems[index].check=!cartItems[index].check;
    cartItems.refresh();
    await updateCartItem(cartItems[index]);
    getProductPrice();
  }

  Future<void> updateCartItem(CartItemModel cartModel) async{
    await FirebaseServices.setDataInCollection(
      AppConstant.cart,
      {cartModel.productId: cartModel.toFirebase()},
      key: FirebaseServices.auth.currentUser!.uid);
  }
}


// print("llll ${value.length}");
// for (int i=0;i<value.length;i++) {
// int date=dataMethod(value[i].date);
// print("ssss $date");
// if(date<=7){
// // featureProduct.add(element);
// }
// }
