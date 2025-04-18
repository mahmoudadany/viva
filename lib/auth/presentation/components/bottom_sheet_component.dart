import 'package:flutter/material.dart';
import 'package:viva/auth/presentation/components/components.dart';
import 'package:viva/core/components/components.dart';



class ChangePasswordBottomSheet extends StatelessWidget {
  const ChangePasswordBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(image: AssetImage('assets/icons/email.png'),height: 100.0,),
            const SizedBox(height: 10.0,),
            authPageText(text: "Verify your email address"),
            const SizedBox(height: 10.0,),
            Text("we have just send email verification link on your email. please check email and click on that link to verify your email address.",maxLines: 3,textAlign: TextAlign.center,),
            const SizedBox(height: 20.0,),
            Text("If not auto redirected after verification, click on the continue button.",textAlign: TextAlign.center),
            const SizedBox(height: 10.0,),
            mainButton(onpressed: (){}, text: "continue",backGroundColor: Colors.white,textColor: Colors.black),
            const SizedBox(height: 20.0,),
            Text("Resend E-Mail Link",style: TextStyle(color: Colors.blue),),
            const SizedBox(height: 10.0,),
            Text("back to login",style: TextStyle(color: Colors.blue),)
            


          ],
        ),
      ),
    );
  }
}

//
// const CircleAvatar(
// radius: 50.0,
// backgroundColor: AppColorLight.changePasswordIconBackGroundColor,
// child: Image(
// image: AssetImage("assets/icons/changePasswordIcon.png"),
// ),
// ),
// const SizedBox(height: 20.0),
// Text(
// "yourPasswordHasBeenChange".tr,
// style: TextStyle(
// decoration: TextDecoration.none,
// color: Colors.black,
// fontSize: 17.0,
// fontWeight: FontWeight.bold,
// ),
// ),
// const SizedBox(height: 10.0),
// Text(
// "welcomeBackDiscoverNow".tr,
// style: TextStyle(
// decoration: TextDecoration.none,
// fontSize: 16.0,
// color: Colors.grey
// ),
// ),
// const SizedBox(height: 20.0),
// mainButton(
// onpressed: () {},
// text: "browseHome".tr,
// backGroundColor: Colors.black,
// width: 250.0,
// ),
// const SizedBox(height: 50.0),
