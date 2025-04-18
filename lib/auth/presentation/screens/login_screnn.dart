import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viva/auth/presentation/components/components.dart';
import 'package:viva/auth/presentation/controller/auth_controller.dart';
import 'package:viva/auth/presentation/screens/forget_password_screen.dart';
import 'package:viva/core/components/components.dart';
import 'package:viva/core/globle/app_color/app_color_light.dart';

import 'sigin_up_screnn.dart';

class LoginScrenn extends GetWidget<AuthController> {
  const LoginScrenn({super.key});

  @override
  Widget build(BuildContext context) {
    var form = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: form,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                authPageText(text: "loginText".tr),
                const SizedBox(height: 20.0),
                authTextField(
                  controller: controller.loginEmailController,
                  label: "emailAddress".tr,
                  hint: "emailAddress*".tr,
                  inputType: TextInputType.emailAddress,
                  preFixIcon: Icons.email_outlined,
                  onChange: (value) {
                    controller.loginEmailController.text = value;
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
                Obx(()=> authTextField(
                        controller: controller.loginPasswordController,
                        label: "password".tr,
                        hint: "password*".tr,
                        isPassword: !controller.showLoginPassword.value,
                        suffixFixIcon: IconButton(
                          onPressed: () {
                            controller.showLoginPassword.value =
                                !controller.showLoginPassword.value;
                          },
                          icon:
                              controller.showLoginPassword.value
                                  ? Icon(Icons.remove_red_eye_outlined)
                                  : Icon(Icons.remove_red_eye_rounded),
                        ),
                        inputType: TextInputType.text,
                        preFixIcon: Icons.lock_open_outlined,
                        onChange: (value) {
                          controller.loginPasswordController.text = value;
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
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    child: Text("forgetPassword".tr),
                    onPressed: () {
                      Get.to(ForgetPasswordScreen());
                    },
                  ),
                ),
                const SizedBox(height: 20.0),
                Obx(()=> Align(
                    alignment: Alignment.center,
                    child: mainButton(
                      backGroundColor: Colors.black,
                      onpressed: () {
                        if (form.currentState!.validate()) {
                          controller.signInWithEmailAndPassword();
                        }
                      },
                      text: "login".tr,
                      child: controller.isLoadingLogin.value? Row(
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
                        "login".tr,
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
                  onTap: () {
                    controller.signInWithGoogle();
                  },
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
                      children: [
                        // InkWell(
                        //   child: Image(
                        //     image: AssetImage("assets/icons/apple.png"),
                        //     height: 40.0,
                        //     width: 40.0,
                        //   ),
                        //   onTap: () {
                        //
                        //   },
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
                ),
                const SizedBox(height: 30.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("don't have an account".tr),
                    const SizedBox(width: 5.0),
                    TextButton(
                      onPressed: () {
                        Get.off(SignUpScreen());
                      },
                      child: Text(
                        "sign up".tr,
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

// final GoogleSignInAccount? googleSignInAccount=await _googleSignIn.signIn();
// GoogleSignInAuthentication googleSigInAuthentication= await googleSignInAccount!.authentication;
// AuthCredential authCredential=GoogleAuthProvider.credential(
//   idToken: googleSigInAuthentication.idToken,
//   accessToken: googleSigInAuthentication.accessToken,
// );
// UserCredential userCredential= await _firebaseAuth.signInWithCredential(authCredential);
// print(userCredential);
