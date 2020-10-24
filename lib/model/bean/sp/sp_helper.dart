import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SPHelper {
  static Future<T> getPreference<T>(String key, T defautlValue) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    try {
      if (defautlValue is String) {
        return sp.getString(key) as T;
      } else if (defautlValue is bool) {
        return sp.getBool(key) as T;
      } else if (defautlValue is int) {
        return sp?.getInt(key) as T;
      } else if (defautlValue is double) {
        return sp.getDouble(key) as T;
      } else if (defautlValue is List<String>) {
        return sp.getDouble(key) as T;
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  static Future<bool> setPreference<T>(String key, T value) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    try {
      if (value is String) {
        return sp.setString(key, value) as bool;
      } else if (value is bool) {
        return sp.setBool(key, value) as bool;
      } else if (value is int) {
        return sp.setInt(key, value) as bool;
      } else if (value is double) {
        return sp.setDouble(key, value) as bool;
      } else if (value is double) {
        return sp.setDouble(key, value) as bool;
      } else if (value is List<String>) {
        return sp.setStringList(key, value) as bool;
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  static Future<Set<String>> getAllKeys() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    try {
      return sp.getKeys();
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  static Future<bool> removeKey(String key) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    try {
      return sp.remove(key);
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  static Future<bool> clearPreference() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    try {
      return sp.clear();
    } catch (e) {
      print(e.toString());
    }
    return null;
  }
  static Future<bool> keyExist(String key) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    try {
      return sp.containsKey(key);
    } catch (e) {
      print(e.toString());
    }
    return null;
  }
}
