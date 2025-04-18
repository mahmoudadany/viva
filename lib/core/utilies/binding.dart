import 'package:get/get.dart';
import 'package:viva/auth/presentation/controller/auth_controller.dart';
import 'package:viva/check_out/presentaion/controller/check_out_conttroller.dart';
import 'package:viva/home/presentaion/controller/home_controller.dart';


class AppBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => AuthController(),fenix: true);
    Get.lazyPut<HomeController>(() => HomeController(),fenix: true);
    Get.lazyPut<CheckOutController>( () => CheckOutController(),fenix: true);
  }

}