import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viva/check_out/data/data_source/stripe_payment/stripe_manager.dart';
import 'package:viva/home/presentaion/controller/home_controller.dart';

import '../components/cared_component.dart';

class HomeScreen extends GetWidget<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.getProductPrice();
      controller.getTotal();
      controller.getCartItems();
      controller.total.refresh();
      controller.productPrice.refresh();
    });

    return Scaffold(
      appBar: AppBar(title: Text("viva".tr), centerTitle: true),
      body: Obx(() => controller.component().value),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25.0),
          topRight: Radius.circular(25.0),
        ),
        child: Obx(
          () => BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                activeIcon: Text('home'.tr),
                icon: Icon(Icons.house_outlined),
                label: '',
              ),
              BottomNavigationBarItem(
                activeIcon: Text('cart'.tr),
                icon: Icon(Icons.shopping_bag_outlined),
                label: '',
              ),
              BottomNavigationBarItem(
                activeIcon: Text('account'.tr),
                icon: Icon(Icons.person),
                label: '',
              ),
            ],
            onTap: (value) {
              HomeController.bottomBarIndex.value = value;
            },
            currentIndex: HomeController.bottomBarIndex.value,
          ),
        ),
      ),
    );
  }
}
