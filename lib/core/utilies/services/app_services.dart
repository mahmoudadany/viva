import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:viva/auth/presentation/screens/login_screnn.dart';
import 'package:viva/auth/presentation/screens/on_boarding_screen.dart';
import 'package:viva/core/utilies/local_storage/get_storage.dart';
import 'package:viva/home/presentaion/screens/home_screen.dart';

class AppServices{


  static bool internetConnection(){
    if(ConnectivityResult.mobile==true||ConnectivityResult.wifi==true){
      return true;
    }else{
      return false;
    }
  }

  static Widget showScreen(){
    if(!GetLocalStorage.getOnBoardState()) return OnBoardingScreen();
    else return GetLocalStorage.getUserState()? HomeScreen() : LoginScrenn();

  }
}