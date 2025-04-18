import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viva/auth/presentation/components/components.dart';
import 'package:viva/auth/presentation/controller/auth_controller.dart';
import 'package:viva/auth/presentation/screens/login_screnn.dart';

import '../../../core/components/components.dart';

class VerificationScreen extends GetWidget<AuthController> {
  const VerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    controller.timerResend();
    controller.checkEmailVerifyAfterSomeTime();
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(image: AssetImage('assets/icons/email.png'), height: 100.0),
            const SizedBox(height: 10.0),
            authPageText(text: "Verify your email address"),
            const SizedBox(height: 10.0),
            const Text(
              "we have just send email verification link on your email. please check email and click on that link to verify your email address.",
              maxLines: 3,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20.0),
            const Text(
              "If not auto redirected after verification, click on the continue button.",
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10.0),
            GetX<AuthController>(
              builder:(controller) =>  mainButton(
                text: "continue",
                textColor: Colors.black,
                backGroundColor: Colors.white,
                onpressed: () {
                  controller.checkEmailVerifyWithContinueButton();
                },
                child: controller.isLoadingContinue.value? Row(
                  mainAxisSize: MainAxisSize.min,
                  children:
                  [
                    SizedBox(
                        height: 25.0,
                        width: 25.0,
                        child: CircularProgressIndicator(color: Colors.black,)),
                    const SizedBox(width: 10.0,),
                    Text("Loading...",style: TextStyle(color: Colors.black,fontSize: 20.0),),
                  ],
                ):Text(
                  "continue",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),

              ),
            ),
            const SizedBox(height: 20.0),
            GetX<AuthController>(
              builder:
                  (controller) => IgnorePointer(
                    ignoring:
                        controller.timerResendController.value != 0
                            ? true
                            : false,
                    child: TextButton(
                      onPressed: () {
                        controller.timerResendController.value = 60;
                        controller.resendEmailVerify();
                        controller.timerResend();
                      },
                      child: Text(
                        controller.timerResendController.value != 0
                            ? "Resend E-Mail Link 0:${controller.timerResendController.value}"
                            : "Resend E-Mail Link",
                        style: TextStyle(
                          color:
                              controller.timerResendController.value != 0
                                  ? Colors.grey
                                  : Colors.blue,
                        ),
                      ),
                    ),
                  ),
            ),
            const SizedBox(height: 10.0),
            TextButton(
              onPressed: () {
                controller.backToLoginScreen=true;
                Get.off(LoginScrenn());
              },
              child: Text(
                "back to login",
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// return Scaffold(
// appBar: AppBar(),
// body: Padding(
// padding: const EdgeInsets.all(20.0),
// child: SingleChildScrollView(
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// authPageText(text: "verificationCode".tr),
// const SizedBox(height: 10.0),
// Text("verificationCodeMassage".tr),
// const SizedBox(height: 10.0),
// authTextField(
// controller: TextEditingController(),
// label: "enterVerificationCode".tr,
// hint: "enterVerificationCode".tr,
// inputType: TextInputType.number,
// preFixIcon: Icons.verified_user_outlined,
// ),
// const SizedBox(height: 10.0),
// Text("resend in 00:30"),
// const SizedBox(height: 20.0),
// Align(
// alignment: Alignment.center,
// child: mainButton(onpressed: () {}, text: "confirm".tr),
// ),
// ],
// ),
// ),
// ),
// );
