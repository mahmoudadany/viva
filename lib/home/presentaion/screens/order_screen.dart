import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viva/check_out/presentaion/controller/check_out_conttroller.dart';
import 'package:viva/core/components/components.dart';
import 'package:viva/home/presentaion/controller/home_controller.dart';
import 'package:viva/home/presentaion/screens/show_all_order_product.dart';
import 'package:viva/home/presentaion/screens/show_all_product.dart';

class OrderScreen extends GetWidget<HomeController> {
  @override
  Widget build(BuildContext context) {
    controller.getOrderItems();
    return Obx(
      () => Scaffold(
        body: SafeArea(
          child: ListView.builder(
            itemBuilder:
                (context, index) => Padding(
                  padding: const EdgeInsetsDirectional.symmetric(
                    horizontal: 10.0,
                    vertical: 5.0,
                  ),
                  child: Container(
                    height: 150,
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
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "${"order".tr} ${index + 1}",
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                HomeController.orderItems[index]["date"],
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "${"quanlity".tr}: ${HomeController.orderItems[index]["orders"].length}",
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "${"subTotal".tr}: ${HomeController.orderItems[index]["subTotal"]} EGP",
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10.0),
                          Center(
                            child: mainButton(
                              text: "continue".tr,
                              textColor: Colors.black,
                              backGroundColor: Colors.white,
                              onpressed: () {
                                Get.to(
                                  ShowAllOrderProduct(
                                    HomeController.orderItems[index]["orders"],
                                  ),
                                );
                              },
                              child: Text(
                                "details".tr,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
            itemCount: HomeController.orderItems.length,
          ),
        ),
      ),
    );
  }
}
