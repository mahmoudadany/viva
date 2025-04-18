 import 'package:flutter/material.dart';
 import 'package:get_storage/get_storage.dart';
 import 'package:firebase_core/firebase_core.dart';
 import 'package:get/get.dart';
import 'package:viva/core/globle/app_lang/translation.dart';
import 'package:viva/core/globle/app_theme/light_theme.dart';
import 'package:viva/core/utilies/binding.dart';
import 'package:viva/core/utilies/services/app_services.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Viva Store',
      initialBinding: AppBinding(),
      theme: lightTheme,
      translations: Translation(),
      locale: Locale('en'),
      fallbackLocale: Locale('en'),
      home: AppServices.showScreen(),
    );
  }
}
