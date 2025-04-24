import 'package:get_storage/get_storage.dart';
import 'package:viva/auth/domain/entities/user.dart';
import 'package:viva/core/utilies/app_constant.dart';

class GetLocalStorage{

  static Future<void> write(String key,dynamic value) async{
    await GetStorage().write(key, value);
  }

  static dynamic get(String key) async{
    return await GetStorage().read(key);
  }

  static bool getUserState() {
    return GetStorage().read(AppConstant.userState)??false;
  }
  static bool getDarkModeState() {
    return GetStorage().read(AppConstant.darkModeState)??false;
  }

  static bool getOnBoardState() {
    return GetStorage().read(AppConstant.onBoardState)??false;
  }
  static String getGenderState() {
    return GetStorage().read(AppConstant.genderState)??"male";
  }
  static String getLngState() {
    return GetStorage().read(AppConstant.langState)??"en";
  }
  static MainUser? getUser() {
    return GetStorage().read(AppConstant.userData);
  }

}