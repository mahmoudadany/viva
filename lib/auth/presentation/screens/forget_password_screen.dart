import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viva/auth/presentation/components/components.dart';
import 'package:viva/auth/presentation/controller/auth_controller.dart';


import '../../../core/components/components.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var formkey = GlobalKey<FormState>();
    AuthController controller = Get.put(AuthController());
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: formkey,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                authPageText(text: "forgetPassword".tr),
                const SizedBox(height: 10.0),
                Text("confirmPasswordMassage".tr),
                const SizedBox(height: 10.0),
                authTextField(
                  controller: controller.forgetPasswordEmailController,
                  label: "email address".tr,
                  hint: "email address".tr,
                  inputType: TextInputType.emailAddress,
                  preFixIcon: Icons.email_outlined,
                  onChange: (value) {
                    controller.forgetPasswordEmailController.text = value;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Email shoud not be empty";
                    }
                    if (!(value.contains('@') && value.contains(".com"))) {
                      return "email address fromat ****@****.com";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20.0),
                Align(
                  alignment: Alignment.center,
                  child: mainButton(
                    onpressed: () {
                      formkey.currentState!.validate();
                    },
                    text: "send".tr,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
