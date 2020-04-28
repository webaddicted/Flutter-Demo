import 'package:flutterbeginner/global/constant/sp_const.dart';
import 'package:flutterbeginner/model/sp/sp_helper.dart';

class SPManager {
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
