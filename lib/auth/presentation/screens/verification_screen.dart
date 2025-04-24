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
            authPageText(text: "VerifyEmail".tr),
            const SizedBox(height: 10.0),
            Text("verifyMassage".tr, maxLines: 3, textAlign: TextAlign.center),
            const SizedBox(height: 20.0),
            Text("confirmEmail".tr, textAlign: TextAlign.center),
            const SizedBox(height: 10.0),
            GetX<AuthController>(
              builder:
                  (controller) => mainButton(
                    text: "continue".tr,
                    textColor: Colors.black,
                    backGroundColor: Colors.white,
                    onpressed: () {
                      controller.checkEmailVerifyWithContinueButton();
                    },
                    child:
                        controller.isLoadingContinue.value
                            ? Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(
                                  height: 25.0,
                                  width: 25.0,
                                  child: CircularProgressIndicator(
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(width: 10.0),
                                Text(
                                  "loading".tr,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20.0,
                                  ),
                                ),
                              ],
                            )
                            : Text(
                              "continue".tr,
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
                            : "resendEmail".tr,
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
                controller.backToLoginScreen = true;
                Get.off(LoginScrenn());
              },
              child: Text(
                "backToLogin".tr,
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
