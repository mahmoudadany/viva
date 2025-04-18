import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viva/check_out/presentaion/screens/check_out_screen.dart';
import 'package:viva/home/presentaion/controller/home_controller.dart';
import 'package:viva/home/presentaion/screens/display_item.dart';

import '../../../core/globle/app_color/app_color_light.dart';


class CaretComponent extends GetWidget<HomeController>{
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.getProductPrice();
      controller.getTotal();
      controller.getCartItems();
    },);

    return Obx(
      () =>  Scaffold(
        // appBar: AppBar
        //   (
        //   title: Text("Your Cart",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25.0),),
        //   centerTitle: true,
        // ),
        body:  controller.cartLoading.value?
        const Center(child: CircularProgressIndicator(),):
        Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemBuilder:
                    (context, index) => Padding(
                  padding: const EdgeInsetsDirectional.symmetric(
                    horizontal: 10.0,
                    vertical: 5.0,
                  ),
                  child: Container(
                    padding: EdgeInsets.only(left: 10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 10,
                          offset: Offset(4, 4),
                        ),
                      ],
                    ),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 130,
                          width: 120,
                          child: GestureDetector(
                            onTap: () {
                              Get.to(DisplayItem(controller.cartItems[index]));
                            },
                            child: Image(
                              image: NetworkImage(
                                controller.cartItems[index].images[0],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 5.0),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 10.0),
                              Row(

                                children: [
                                  Expanded(
                                    child: Text(
                                      controller.cartItems[index].title,
                                      maxLines: 1,
                                      style: const TextStyle(
                                        fontSize: 13.0,
                                        overflow: TextOverflow.ellipsis,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Obx(() =>  Checkbox(
                                    value: controller.cartItems[index].check,
                                    activeColor:
                                    AppColorLight.ratingStarColor,
                                    onChanged: (value) {
                                      controller.changeCheckBox(index);
                                    },

                                  ),
                                  ),
                                ],
                              ),
                              Text(
                                "\$ ${controller.cartItems[index].price}",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0,
                                ),
                              ),
                              const SizedBox(height: 5.0),
                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Size: ${controller.cartItems[index].selectedSize}",
                                        style: const TextStyle(
                                          color: Colors.grey,
                                          fontSize: 12.0,
                                        ),
                                      ),
                                      Text(
                                        "Color: ${controller.cartItems[index].selectedColor}",
                                        maxLines: 1,
                                        style: const TextStyle(
                                          fontSize: 16.0,
                                          color: Colors.grey,
                                          overflow: TextOverflow.ellipsis
                                        ),
                                      ),
                                    ],
                                  ),
                                  Expanded(child: SizedBox()),
                                  Container(
                                    padding: EdgeInsetsDirectional.symmetric(
                                      horizontal: 5.0,
                                      vertical: 5.0,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade200,
                                      borderRadius: BorderRadius.circular(
                                        10.0,
                                      ),
                                    ),
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    child: Row(
                                      children: [
                                        GestureDetector(
                                          child: Icon(
                                            Icons.remove,
                                            color: Colors.grey,
                                          ),
                                          onTap: () {
                                            int count=controller.cartItems[index].userItemCount;
                                            if(count==1){
                                              Get.snackbar("Cart failure", "you shoud chose one item",snackPosition: SnackPosition.BOTTOM);
                                              return;
                                            }
                                             controller.minus(index);
                                          },
                                        ),
                                        const SizedBox(width: 10.0),
                                        Obx(() => Text(
                                          controller.cartItems[index].userItemCount.toString(),
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20.0,
                                          ),
                                        ),
                                        ),
                                        const SizedBox(width: 10.0),
                                        GestureDetector(
                                          child: Icon(
                                            Icons.add,
                                            color: Colors.grey,
                                          ),
                                          onTap: () {
                                            int count=controller.cartItems[index].userItemCount;
                                            if(count>controller.cartItems[index].itemCount){
                                              Get.snackbar("Cart failure", "you shoud chose one item2");
                                              return;
                                            }
                                            controller.plus(index);

                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 10.0),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                itemCount: controller.cartItems.length,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 10.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Product Price",
                            style: TextStyle(color: Colors.grey, fontSize: 14.0),
                          ),
                          Obx(()=> Text("\$${controller.productPrice.value}", style: TextStyle(fontSize: 14.0))),
                        ],
                      ),
                      const SizedBox(height: 10.0),
                      Container(
                        height: 1.0,
                        width: double.infinity,
                        color: Colors.grey.shade300,
                      ),
                      const SizedBox(height: 10.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Shipping",
                            style: TextStyle(color: Colors.grey, fontSize: 14.0),
                          ),
                          Text("Freeship", style: TextStyle(fontSize: 14.0)),
                        ],
                      ),
                      const SizedBox(height: 10.0),
                      Container(
                        height: 1.0,
                        width: double.infinity,
                        color: Colors.grey.shade300,
                      ),
                      const SizedBox(height: 10.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total",
                            style: TextStyle(color: Colors.grey, fontSize: 14.0),
                          ),
                          Obx(()=> Text("\$${controller.total.value}", style: TextStyle(fontSize: 14.0))),
                        ],
                      ),
                      const SizedBox(height: 10.0),
                      Container(
                        height: 1.0,
                        width: double.infinity,
                        color: Colors.grey.shade300,
                      ),
                      const SizedBox(height: 10.0),
                      GestureDetector(
                        child: Container(
                          padding: EdgeInsetsDirectional.symmetric(
                            vertical: 10.0,
                            horizontal: 30.0,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            color: AppColorLight.containerCartColor,
                          ),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: Text(
                            "Proceed to checkout",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        onTap: () {
                          Get.to(CheckOutScreen(controller.total.value,controller.cartItems));
                        },
                      ),
                      const SizedBox(height: 5.0),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}
