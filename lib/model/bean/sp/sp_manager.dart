import 'package:flutterbeginner/global/constant/sp_const.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/model/bean/sp/sp_helper.dart';

class SPManager {
  static void setOnboarding<T>(bool isOnBoardingShow) {
    SPHelper.setPreference(StringConst.IS_ON_BOARDING_SHOW, isOnBoardingShow);
  }

  static Future<bool> getOnboarding<T>() async {
    var spValue =  await SPHelper.getPreference(StringConst.IS_ON_BOARDING_SHOW, false);
    return spValue;
  }


  static void setName<T>(String name) {
    SPHelper.setPreference(SPConst.USER_NAME, name);
  }

  static Future<T> getName<T>() async {
    var spValue = await SPHelper.getPreference(SPConst.USER_NAME, '');
    return spValue as T;
  }

  static Future<Set<String>> getAllKeys() async {
    var spValue = await SPHelper.getAllKeys();
    return spValue ;
  }

  static Future<bool> removeKeys() async {
    var spValue = await SPHelper.removeKey(SPConst.USER_NAME);
    return spValue;
  }

  static Future<bool> clearPref() async {
    var spValue = await SPHelper.clearPreference();
    return spValue;
  }
}
