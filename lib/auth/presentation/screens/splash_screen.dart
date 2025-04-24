import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viva/core/utilies/services/app_services.dart';

import '../../../core/utilies/app_constant.dart';
import '../../../core/utilies/local_storage/get_storage.dart';
import '../../../home/presentaion/screens/home_screen.dart';
import 'login_screnn.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    test();
    return Scaffold(
      body: Center(
        child: Image.asset("assets/images/viva_store.png"),
      ),
    );
  }
}


void test() async{
  // bool state= await GetLocalStorage.getUserState();
  Future.delayed(Duration(seconds: 1),() {
    Get.off(AppServices.showScreen());
    // state? Get.off(HomeScreen()):Get.off(LoginScrenn());
  },);}