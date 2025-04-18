import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viva/check_out/data/data_source/stripe_payment/stripe_manager.dart';
import 'package:viva/home/presentaion/controller/home_controller.dart';


import '../components/cared_component.dart';

class HomeScreen extends GetWidget<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(
        //   onPressed: () {},
        //   icon: Image.asset("assets/icons/list.png"),
        // ),
        title: Text("vivaStore".tr),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () async{
              // await StripeManager.paymentIn(1000, "EGP",context);
            },
            icon: Icon(Icons.notifications_on_outlined, size: 30.0),
          ),
        ],
      ),
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
                activeIcon: Text('Home'),
                icon: Icon(Icons.house_outlined),
                label: '',
              ),
              // BottomNavigationBarItem(
              //   activeIcon: Text('Search'),
              //   icon: Icon(Icons.search_outlined),
              //   label: '',
              // ),
              BottomNavigationBarItem(
                activeIcon: Text('Cart'),
                icon: Icon(Icons.shopping_bag_outlined),
                label: '',
              ),
              BottomNavigationBarItem(
                activeIcon: Text('Account'),
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




