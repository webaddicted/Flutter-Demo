import 'package:flutterbeginner/global/constant/db_const.dart';
import 'package:flutterbeginner/model/db/db_helper.dart';
import 'package:flutterbeginner/model/sqflite_login_user.dart';
import 'package:sqflite/sqflite.dart';

class SqfliteUserInfo {
  static final List<String> sqLitew =
      SqfliteLoginUserBean.empty().toMap().keys.toList();
  static final USER_ID = "userId";
  static final USER_NAME = sqLitew[0];
  static final USER_EMAILID = sqLitew[1];
  static final USER_MOBILE = sqLitew[2];
  static final USER_DOB = sqLitew[3];
  static final USER_PASSWORD = sqLitew[4];
  static final String USER_LOGIN_TABLE = DbConst.LOGIN_TABLE;
  static final dbHelper = DatabaseHelper.dbHelper;
  static final USER_TABLE_QUERY = "CREATE TABLE ${USER_LOGIN_TABLE} ("
      "${USER_ID} INTEGER PRIMARY KEY AUTOINCREMENT,"
      "${USER_NAME} TEXT,"
      "${USER_EMAILID} TEXT,"
      "${USER_MOBILE} TEXT,"
      "${USER_DOB} TEXT,"
      "${USER_PASSWORD} TEXT"
      ")";

  static Future<int> insertUser(SqfliteLoginUserBean userInfo) async {
    Database dbClient = await dbHelper.database;
    return await dbClient.insert(USER_LOGIN_TABLE, userInfo.toMap());
  }

  static Future<List> checkUserExist(String emailId) async {
    Database dbClient = await dbHelper.database;
    var params = [emailId.toString()];
    var results = await dbClient.rawQuery(
        "SELECT * FROM ${DbConst.LOGIN_TABLE} WHERE $USER_EMAILID " +
            " = '" +
            emailId +
            "'",
        null);
    if (results.length > 0) return results;
    return null;
  }

  static Future<List<SqfliteLoginUserBean>> getUserAllInfo() async {
    Database dbClient = await dbHelper.database;
    var userInfo = await dbClient.query(USER_LOGIN_TABLE);
    return userInfo
        .map((itemWord) => SqfliteLoginUserBean.map(itemWord))
        .toList();
    ;
  }

//  Get all users specific info which make process fast
  static Future<List> getSelectedUserField() async {
    Database dbClient = await dbHelper.database;
    var result = await dbClient
        .query(DbConst.LOGIN_TABLE, columns: [USER_EMAILID, USER_PASSWORD]);
    return result.toList();
  }

  static Future<int> userCount() async {
    Database dbClient = await dbHelper.database;
    return Sqflite.firstIntValue(
        await dbClient.rawQuery('SELECT COUNT(*) FROM $USER_LOGIN_TABLE'));
  }

  static Future<int> updateUser(SqfliteLoginUserBean loginUser) async {
    Database dbClient = await dbHelper.database;
    return await dbClient.update(USER_LOGIN_TABLE, loginUser.toMap(),
        where: '$USER_EMAILID = ?', whereArgs: [loginUser.emailId]);
  }

  static Future<int> deleteUser(String emailId) async {
    Database dbClient = await dbHelper.database;
    return await dbClient.delete(USER_LOGIN_TABLE,
        where: '$USER_EMAILID = ?', whereArgs: [emailId]);
  }

  // insert delete Table
  static Future<int> deleteUserTable() async {
    Database dbClient = await dbHelper.database;
    int respo = await dbClient.delete(DbConst.LOGIN_TABLE);
    return respo;
  }
}
