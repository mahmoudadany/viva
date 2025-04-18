import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viva/auth/presentation/components/components.dart';
import 'package:viva/auth/presentation/controller/auth_controller.dart';
import 'package:viva/auth/presentation/screens/login_screnn.dart';
import 'package:viva/core/components/components.dart';

import '../../../core/globle/app_color/app_color_light.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    AuthController controller = Get.put(AuthController());
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          child: Icon(Icons.arrow_back_outlined),
          onTap: () {
            Get.off(LoginScrenn());
          },
        ),
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                authPageText(text: "signUpText".tr),
                const SizedBox(height: 10.0),
                authTextField(
                  controller: controller.signUpNameController,
                  label: "name".tr,
                  hint: "name".tr,
                  inputType: TextInputType.text,
                  preFixIcon: Icons.drive_file_rename_outline_outlined,
                  onChange: (value) {
                    controller.signUpNameController.text = value;
                  },
                  onSubmitted: (value) {
                    formKey.currentState!.validate();
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "please enter your name";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10.0),
                authTextField(
                  controller: controller.signUpEmailController,
                  label: "emailAddress".tr,
                  hint: "emailAddress*".tr,
                  inputType: TextInputType.emailAddress,
                  preFixIcon: Icons.email_outlined,
                  onChange: (value) {
                    controller.signUpEmailController.text = value;
                  },
                  onSubmitted: (value) {
                    formKey.currentState!.validate();
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
                const SizedBox(height: 10.0),
                GetX<AuthController>(
                  builder:
                      (controller) => authTextField(
                        controller: controller.signUpPasswordController,
                        label: "password".tr,
                        hint: "password*".tr,
                        isPassword: !controller.showSignupPassword.value,
                        suffixFixIcon: IconButton(
                          onPressed: () {
                            controller.showSignupPassword.value =
                                !controller.showSignupPassword.value;
                          },
                          icon:
                              controller.showSignupPassword.value
                                  ? Icon(Icons.remove_red_eye_outlined)
                                  : Icon(Icons.remove_red_eye),
                        ),
                        inputType: TextInputType.text,
                        preFixIcon: Icons.lock_open_outlined,
                        onChange: (value) {
                          controller.signUpPasswordController.text = value;
                        },
                        onSubmitted: (value) {
                          formKey.currentState!.validate();
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Password should not be empty";
                          }
                          if (value.length < 8) {
                            return "password length is low";
                          }
                          return null;
                        },
                      ),
                ),
                const SizedBox(height: 10.0),
                GetX<AuthController>(
                  builder:
                      (controller) => authTextField(
                        controller: controller.signUpConfirmPasswordController,
                        label: "confirmPassword".tr,
                        hint: "password*".tr,
                        isPassword: !controller.showSignupConfirmPassword.value,
                        suffixFixIcon: IconButton(
                          onPressed: () {
                            controller.showSignupConfirmPassword.value =
                                !controller.showSignupConfirmPassword.value;
                          },
                          icon:
                              controller.showSignupConfirmPassword.value
                                  ? Icon(Icons.remove_red_eye_outlined)
                                  : Icon(Icons.remove_red_eye),
                        ),
                        inputType: TextInputType.text,
                        preFixIcon: Icons.lock_open_outlined,
                        onChange: (value) {
                          controller.signUpConfirmPasswordController.text =
                              value;
                        },
                        onSubmitted: (value) {
                          formKey.currentState!.validate();
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Password should not be empty";
                          }
                          if (value.length < 8) {
                            return "password length is low";
                          }
                          if (value !=
                              controller.signUpPasswordController.text) {
                            return "password not match confirm password";
                          }
                          return null;
                        },
                      ),
                ),
                const SizedBox(height: 20.0),
                GetX<AuthController>(
                  builder:(controller) =>  Align(
                    alignment: Alignment.center,
                    child: mainButton(
                      onpressed: () {
                        if (formKey.currentState!.validate()) {
                          controller.isLoadingSignup.value=true;
                          controller.signUpWithEmailAndPassword(
                            controller.signUpEmailController.text,
                            controller.signUpPasswordController.text,
                          );
                        }
                      },
                      text: "signUp".tr,
                      backGroundColor: Colors.black,
                      child: controller.isLoadingSignup.value? Row(
                        mainAxisSize: MainAxisSize.min,
                        children:
                        [
                          SizedBox(
                              height: 25.0,
                              width: 25.0,
                              child: CircularProgressIndicator(color: Colors.white,)),
                          const SizedBox(width: 10.0,),
                          Text("Loading...",style: TextStyle(color: Colors.white,fontSize: 20.0),),
                        ],
                      ):Text(
                        "signUp".tr,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                Align(
                  alignment: Alignment.center,
                  child: Text("or".tr, style: TextStyle(fontSize: 18.0)),
                ),
                const SizedBox(height: 20.0),
                GestureDetector(
                  child: Container(
                    padding: EdgeInsetsDirectional.symmetric(
                      horizontal: 15.0,
                      vertical: 5.0,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: AppColorLight.containerColor,
                    ),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Image(
                        //   image: AssetImage("assets/icons/apple.png"),
                        //   height: 30.0,
                        //   width: 30.0,
                        // ),
                        // const SizedBox(width: 30.0),
                        Image(
                          image: AssetImage("assets/icons/google.png"),
                          height: 30.0,
                          width: 30.0,
                        ),
                        const SizedBox(width: 20.0),
                        Expanded(
                          child: Text(
                            textAlign: TextAlign.center,
                            "signInWithGoogle".tr,
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  onTap: () {},
                ),
                const SizedBox(height: 30.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("alreadyHaveAccount".tr),
                    const SizedBox(width: 5.0),
                    TextButton(
                      onPressed: () {
                        Get.off(LoginScrenn());
                      },
                      child: Text(
                        "login".tr,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
