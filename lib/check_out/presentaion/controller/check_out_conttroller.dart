import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viva/check_out/data/data_source/stripe_payment/stripe_manager.dart';
import 'package:viva/core/utilies/app_constant.dart';
import 'package:viva/core/utilies/services/firebase_services/firebase_services.dart';
import 'package:viva/home/data/model/cart_item_nodel.dart';
import 'package:viva/home/presentaion/controller/home_controller.dart';
import 'package:viva/home/presentaion/screens/order_screen.dart';

class CheckOutController extends GetxController{
  RxInt cartProductPrice = 0.obs;
  RxInt total = 0.obs;
  RxInt delivery = 0.obs;
  static var cartList=<CartItemModel>[].obs;
  static RxBool paymentState=false.obs;
  TextEditingController cityController = TextEditingController();
  TextEditingController streetNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  RxInt selectedShipping=1.obs;
  RxInt currentStep=0.obs;
  RxInt paymentMethod=0.obs;


  void payment(int amount, String currency, var context) async{
    try{
      await StripeManager.paymentIn(amount, currency, context).then((value) async{
        if(paymentState.value){
          await FirebaseServices.addItemInOrderCollection(AppConstant.order, FirebaseServices.auth.currentUser!.uid, llist(),cityController.text,streetNameController.text,phoneNumberController.text,total.value);
          await FirebaseServices.deleteDataInCollection(AppConstant.cart, FirebaseServices.auth.currentUser!.uid, {});
          cartList.value=[];
          HomeController.cartItems.value=[];
          HomeController.bottomBarIndex.value=0;
          Get.off(OrderScreen());

        }
      },);

    }catch (e){
      print("again ${e.toString()}");
    }
  }

  List<Map> llist(){
    List<Map> l=[];
    cartList.forEach((element) {
      l.add(element.toFirebase());
    },);
    return l;
  }

}