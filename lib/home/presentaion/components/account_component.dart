import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viva/auth/presentation/controller/auth_controller.dart';
import 'package:viva/core/utilies/app_constant.dart';
import 'package:viva/core/utilies/local_storage/get_storage.dart';
import 'package:viva/home/presentaion/controller/home_controller.dart';


class AccountComponent extends GetWidget<HomeController>{
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children:
        [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40.0),
            child: Row(
              children:
              [
                CircleAvatar(
                  radius: 40.0,
                  backgroundColor: Colors.grey.shade300,
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Image.asset(GetLocalStorage.getUser()?.picture??'assets/images/user.png',fit: BoxFit.cover),
                  ),
                ),
                const SizedBox(width: 10.0,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:
                  [
                    Text(
                      GetLocalStorage.getUser()?.name??"User Name",
                      maxLines: 1,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis
                      ),
                    ),
                    const SizedBox(height: 5.0,),
                    Text(
                      GetLocalStorage.getUser()?.email??"User Email Address",
                      maxLines: 1,
                      style: TextStyle(
                          overflow: TextOverflow.ellipsis
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 10.0,),
              ],
            ),
          ),
          const SizedBox(height: 40.0,),
          Container(
            height: 300,
            padding: EdgeInsets.symmetric(horizontal: 10.0),
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:
              [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:
                  [
                    const Text(
                      "Dark Mode",
                      style: TextStyle(
                        fontSize: 18.0,

                      ),
                    ),
                    Obx(
                      () =>  Switch(
                        value: controller.darkMode.value,
                        onChanged: (value) {
                          GetLocalStorage.write(AppConstant.darkModeState, value);
                          controller.darkMode.value=value;
                        },
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 5.0),
                Container(
                  height: 1.0,
                  width: double.infinity,
                  color: Colors.grey.shade300,
                ),
                const SizedBox(height: 5.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:
                  [
                    const Text(
                      "Arabic",
                      style: TextStyle(
                        fontSize: 18.0,

                      ),
                    ),
                    Obx(
                          () =>  Switch(
                        value: controller.isArabic.value,
                        onChanged: (value) {
                          GetLocalStorage.write(AppConstant.isArabic, value);
                          controller.isArabic.value=value;
                        },
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 5.0),
                Container(
                  height: 1.0,
                  width: double.infinity,
                  color: Colors.grey.shade300,
                ),
                const SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:
                  [
                    const Text(
                      "All Orders",
                      style: TextStyle(
                        fontSize: 18.0,

                      ),
                    ),
                    Icon(Icons.arrow_back_ios_new_outlined),
                  ],
                ),
                const SizedBox(height: 10.0),
                Container(
                  height: 1.0,
                  width: double.infinity,
                  color: Colors.grey.shade300,
                ),
                const SizedBox(height: 5.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:
                  [
                    TextButton(
                        onPressed: () {
                          AuthController.signOut();
                        },
                        child: const Text(
                          "Log Out",
                          style: TextStyle(
                            fontSize: 18.0,
                          ),
                        ),
                    ),
                    Icon(Icons.arrow_back_ios_new_outlined),
                  ],
                ),
                const SizedBox(height: 10.0),
                Container(
                  height: 1.0,
                  width: double.infinity,
                  color: Colors.grey.shade300,
                ),
                const SizedBox(height: 10.0),


              ],
            ),
          )

        ],
      ),
    );
  }

}
