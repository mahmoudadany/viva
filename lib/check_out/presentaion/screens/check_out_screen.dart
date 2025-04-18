import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viva/check_out/presentaion/components/check_out_component.dart';
import 'package:viva/check_out/presentaion/components/chek_out_empty_component.dart';
import 'package:viva/check_out/presentaion/controller/check_out_conttroller.dart';
import 'package:viva/home/data/model/cart_item_nodel.dart';

class CheckOutScreen extends GetWidget<CheckOutController> {
  int cartProductPrice;
  List<CartItemModel> cartItem;
  CheckOutScreen(this.cartProductPrice, this.cartItem,{super.key});

  @override
  Widget build(BuildContext context) {
    controller.cartProductPrice.value=cartProductPrice;
    controller.cartList.value=cartItem;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Check out",
          style: TextStyle(
            fontWeight: FontWeight.bold
          ),
        ),
          leading: IconButton(onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
          ),
      ),
      body: false? checkOutEmpty(): CheckOutComponent(),
    );
  }
}
