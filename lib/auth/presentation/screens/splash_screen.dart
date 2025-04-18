import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
        child: Text("splash screen"),
      ),
    );
  }
}


void test() async{
  bool state= await GetLocalStorage.get(AppConstant.userState);
  Future.delayed(Duration(seconds: 1),() {
    state? Get.off(HomeScreen()):Get.off(LoginScrenn());
  },);}