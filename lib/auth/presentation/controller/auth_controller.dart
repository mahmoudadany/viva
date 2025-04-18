import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viva/auth/data/data_source/remote/firebase/auth_function.dart';
import 'package:viva/auth/data/model/user_model.dart';
import 'package:viva/auth/data/repository/repository.dart';
import 'package:viva/auth/domain/base_repository/base_auth_repository.dart';
import 'package:viva/auth/domain/use_case/email_password_sign_in_usecase.dart';
import 'package:viva/auth/domain/use_case/sign_up_with_email_password_usecase.dart';
import 'package:viva/auth/presentation/screens/login_screnn.dart';
import 'package:viva/auth/presentation/screens/verification_screen.dart';
import 'package:viva/core/utilies/app_constant.dart';
import 'package:viva/core/utilies/local_storage/get_storage.dart';
import 'package:viva/core/utilies/services/app_services.dart';
import 'package:viva/core/utilies/services/firebase_services/firebase_services.dart';
import 'package:viva/home/presentaion/controller/home_controller.dart';
import 'package:viva/home/presentaion/screens/home_screen.dart';




class AuthController extends GetxController {

  // final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  //final FacebookLogin _facebookLogin=FacebookLogin();
  RxBool showLoginPassword = false.obs;
  RxBool showSignupPassword = false.obs;
  RxBool showSignupConfirmPassword = false.obs;
  RxInt timerResendController = 60.obs;
  bool backToLoginScreen = false;
  RxBool isLoadingLogin = false.obs;
  RxBool isLoadingSignup = false.obs;
  RxBool isLoadingContinue = false.obs;
  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();
  TextEditingController signUpNameController = TextEditingController();
  TextEditingController signUpEmailController = TextEditingController();
  TextEditingController signUpPasswordController = TextEditingController();
  TextEditingController signUpConfirmPasswordController=TextEditingController();
  TextEditingController forgetPasswordEmailController = TextEditingController();


  void signInWithGoogle() async {
    // if (!AppServices.internetConnection()) {
    //   Get.snackbar(
    //     "Internet Connection",
    //     "please check internet connection and try again",
    //     colorText: Colors.black,
    //     snackPosition: SnackPosition.BOTTOM,
    //   );
    //   return;
    // }


    // GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
    // GoogleSignInAuthentication googleSignInAuthentication =
    //     await googleSignInAccount!.authentication;
    // AuthCredential credential = GoogleAuthProvider.credential(
    //   accessToken: googleSignInAuthentication.accessToken,
    //   idToken: googleSignInAuthentication.idToken,
    // );
    // BaseFirebaseAuthRemoteDataSource baseFirebaseAuthRemoteDataSource =
    //     FirebaseAuthRemoteDataSource();
    // BaseAuthRepository baseAuthRepository = AuthRepository(
    //   baseFirebaseAuthRemoteDataSource,
    // );
    // var result = await GoogleOrFacebookSignInUseCase(
    //   baseAuthRepository,
    // ).execute(credential);
    // result.fold(
    //   (left) {
    //     print("os os $left");
    //   },
    //   (right) {
    //     print("os os os $right");
    //   },
    // );
    // update();
  }

  void signInWithEmailAndPassword() async {
    // if (!AppServices.internetConnection()) {
    //   Get.snackbar(
    //     "Internet Connection",
    //     "please check internet connection and try again",
    //     colorText: Colors.black,
    //     snackPosition: SnackPosition.BOTTOM,
    //   );
    //   return;
    // }
    isLoadingLogin.value = true;
    BaseFirebaseAuthRemoteDataSource baseFirebaseAuthRemoteDataSource = FirebaseAuthRemoteDataSource();
    BaseAuthRepository baseAuthRepository = AuthRepository(
      baseFirebaseAuthRemoteDataSource,
    );
    var result = await EmailAndPasswordSignInUseCase(
      baseAuthRepository,
    ).execute(loginEmailController.text, loginPasswordController.text);
    result.fold(
      (left) {
        print(left.massage);
        Get.snackbar(
          "Login Failure",
          left.massage,
          colorText: Colors.black,
          snackPosition: SnackPosition.BOTTOM,
        );
      },
      (right) async {
        verifyMethod();
      },
    );
    isLoadingLogin.value = false;
  }

  void signUpWithEmailAndPassword(String email, String password) async {
    // if (!AppServices.internetConnection()) {
    //   Get.snackbar(
    //     "Internet Connection",
    //     "please check internet connection and try again",
    //     colorText: Colors.black,
    //     snackPosition: SnackPosition.BOTTOM,
    //   );
    //   return;
    // }
    BaseFirebaseAuthRemoteDataSource baseFirebaseAuthRemoteDataSource =
        FirebaseAuthRemoteDataSource();
    BaseAuthRepository baseAuthRepository = AuthRepository(
      baseFirebaseAuthRemoteDataSource,
    );
    var result = await SignUpWithEmailAndPasswordUseCase(
      baseAuthRepository,
    ).execute(signUpEmailController.text, signUpPasswordController.text);
    result.fold(
      (left) {
        Get.snackbar(
          "SignUp Failure",
          left.massage,
          colorText: Colors.black,
          snackPosition: SnackPosition.BOTTOM,
        );
      },
      (right) async {
        bool response=await baseFirebaseAuthRemoteDataSource.addUserInUserCollection(
          UserModel(
            id: right.uid,
            email: right.email,
            name: signUpNameController.text,
            picture: right.photoURL
          ),
        );
        if(response) Get.off(LoginScrenn());
        else Get.snackbar("add user to collection", "message");
      },
    );
    isLoadingSignup.value = false;
  }

  static void signOut() async{
    await FirebaseServices.auth.signOut().then((value) {
      GetLocalStorage.write(AppConstant.userState, false);
      Get.offAll(LoginScrenn());
    },
    );
  }

  void checkEmailVerifyWithContinueButton() async {
    if (!AppServices.internetConnection()) {
      Get.snackbar(
        "Internet Connection",
        "please check internet connection and try again",
        colorText: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }
    isLoadingContinue.value=true;
    bool isVerify = await FirebaseServices.checkEmailVerify();
    if (isVerify) {
      Get.off(HomeScreen());
    } else {
      Get.snackbar(
        "Verify Failure",
        'email not verify yet please check your email box',
        colorText: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
    isLoadingContinue.value = false;
  }

  void checkEmailVerifyAfterSomeTime() async {
    Timer.periodic(Duration(seconds: 5), (timer) async {
      bool isVerify = await FirebaseServices.checkEmailVerify();
      if (isVerify) {
        verifyMethod();
        timer.cancel();
      }
      if (backToLoginScreen) timer.cancel();
    });
  }

  void timerResend() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (timerResendController.value == 0) {
        timer.cancel();
      } else {
        timerResendController.value--;
      }
    });
  }

  void resendEmailVerify() async {
    if (!AppServices.internetConnection()) {
      Get.snackbar(
        "Internet Connection",
        "please check internet connection and try again",
        colorText: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }
    await FirebaseServices.sendVerifyEmail();
  }

  void verifyMethod() async {
    bool checkVerify = await FirebaseServices.checkEmailVerify();
    try {
      if (!checkVerify) {
        FirebaseServices.sendVerifyEmail().then((value) {
          if (value) {
            Get.off(VerificationScreen());
          } else {
            throw Exception();
          }
        });
      } else {
        HomeController.getUserData().then((value) async{
          print("ssssss $value");
          await GetLocalStorage.write(AppConstant.userState, true);
          await GetLocalStorage.write(AppConstant.userData, value);
          HomeController.bottomBarIndex.value=0;
          Get.off(HomeScreen());

        },);

        }
    } catch (e) {
      Get.snackbar(
        "Verify Email Failure",
        e.toString(),
        colorText: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
    isLoadingLogin.value = false;
  }

  static Future<void> changeOnBoardingState(bool state) async{
    await GetLocalStorage.write(AppConstant.onBoardState, state);
  }


}



// void signInWithFacebook()async{
//   FacebookLoginResult result= await _facebookLogin.logIn(customPermissions: ['email']);
//   final token= result.accessToken!.token;
//   if(result.status==FacebookLoginStatus.success){
//     AuthCredential credential= FacebookAuthProvider.credential(token);
//     BaseRemoteDataSource baseRemoteDataSource=RemoteDataSource();
//     BaseAuthRepository baseAuthRepository=AuthRepository(baseRemoteDataSource);
//     GoogleOrFacebookSignInUseCase(baseAuthRepository).execute(credential);
//   }
// }