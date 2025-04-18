import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viva/home/data/model/cart_item_nodel.dart';

class CheckOutController extends GetxController{
  RxInt cartProductPrice = 0.obs;
  RxInt total = 0.obs;
  RxInt delivery = 0.obs;
  // RxInt discount = 0.obs;
  var cartList=<CartItemModel>[].obs;
  static RxBool paymentState=false.obs;
  TextEditingController cityController = TextEditingController();
  TextEditingController streetNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  RxInt selectedShipping=1.obs;
  RxInt currentStep=0.obs;
  RxInt paymentMethod=0.obs;


  void payment(int amount, String currency, var context) async{
    try{
      // await StripeManager.paymentIn(amount, currency, context);
      // if(paymentState.value){
      //   await FirebaseServices.addItemInListOfCollection(AppConstant.order, FirebaseServices.auth.currentUser!.uid, cartList, "orders");
      //   await FirebaseServices.deleteDataInCollection(AppConstant.cart, FirebaseServices.auth.currentUser!.uid, {});
      // }
    }catch (e){

    }
  }


}