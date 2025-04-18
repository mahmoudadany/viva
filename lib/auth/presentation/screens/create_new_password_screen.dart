import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viva/auth/presentation/components/components.dart';
import 'package:viva/auth/presentation/controller/auth_controller.dart';


import '../../../core/components/components.dart';

class CreateNewPasswordScreen extends StatelessWidget {
  const CreateNewPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              authPageText(text: "createNewPassword".tr),
              const SizedBox(height: 10.0),
              Text("createNewPasswordMassage".tr),
              const SizedBox(height: 10.0),
              authTextField(
                controller: TextEditingController(),
                label: "newPassword".tr,
                hint: "newPassword".tr,
                inputType: TextInputType.number,
                preFixIcon: Icons.lock_open_outlined,
                suffixFixIcon: IconButton(onPressed: (){}, icon: Icon(Icons.remove_red_eye_outlined)),
              ),
              const SizedBox(height: 10.0),
              GetX<AuthController>(
                init: AuthController(),
                builder:(controller) =>  authTextField(
                  controller: TextEditingController(),
                  label: "confirmNewPassword".tr,
                  hint: "confirmNewPassword".tr,
                  inputType: TextInputType.number,
                  preFixIcon: Icons.lock_open_outlined,
                  suffixFixIcon: IconButton(onPressed: (){}, icon: Icon(Icons.remove_red_eye_outlined)),
                ),
              ),
              const SizedBox(height: 20.0),
              Align(
                alignment: Alignment.center,
                child: mainButton(onpressed: () {}, text: "confirm".tr),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
