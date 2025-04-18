import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:viva/auth/domain/entities/onboarding.dart';
import 'package:viva/auth/presentation/components/components.dart';
import 'package:viva/auth/presentation/screens/login_screnn.dart';

import '../controller/auth_controller.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<OnBoarding> onboarding = [
      OnBoarding(
        "Discover Something New",
        "Special new Arrivals just for new",
        "assets/images/onboarding1.png",
      ),
      OnBoarding(
        "Update Trendy Outfit",
        "Favorite Brands and Hottest Trends",
        "assets/images/onboarding2.png",
      ),
      OnBoarding(
        "Explore Your True Style",
        "Relax and Let Us Bring the Style to You",
        "assets/images/onboarding3.png",
      ),
    ];
    return Stack(
      alignment: Alignment.center,
      children: [
        Column(
          children: [
            Expanded(child: Container(color: Colors.white)),
            Expanded(child: Container(color: Color(0xff464447))),
          ],
        ),
        PageView.builder(
          itemCount: onboarding.length,
          itemBuilder:
              (context, index) => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    onboarding[index].title,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      decoration: TextDecoration.none,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    onboarding[index].description,
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                      decoration: TextDecoration.none,
                    ),
                  ),
                  SizedBox(height: 30.0),
                  Container(
                    width: 260,
                    height: 370,
                    decoration: BoxDecoration(
                      color: Color(0xffE7E8E9),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Image(
                      image: AssetImage(onboarding[index].assetsImagePath),
                    ),
                  ),
                  SizedBox(height: 30.0),
                  onBoardingButton(
                    onPressed: () {
                      AuthController.changeOnBoardingState(true).then((value) {
                        Get.off(LoginScrenn());
                      },);
                    },
                    title: "Shopping Now",
                  ),
                ],
              ),
        ),
      ],
    );
  }
}
