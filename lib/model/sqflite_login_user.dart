/// id : 0
/// name : "Deepak Sharma"
/// emailId : "deepaksharma040695@gmail.com"
/// mobileNo : "9024061407"
/// dob : ""
/// password : ""

class SqfliteLoginUserBean {
//  int _id;
  String _name;
  String _emailId;
  String _mobileNo;
  String _dob;
  String _password;

//  int get id => _id;
  String get name => _name;
  String get emailId => _emailId;
  String get mobileNo => _mobileNo;
  String get dob => _dob;
  String get password => _password;
  SqfliteLoginUserBean.empty();
  SqfliteLoginUserBean(this._name, this._emailId, this._mobileNo, this._dob, this._password);

  SqfliteLoginUserBean.map(dynamic obj) {
//    this._id = obj["id"];
    this._name = obj["name"];
    this._emailId = obj["emailId"];
    this._mobileNo = obj["mobileNo"];
    this._dob = obj["dob"];
    this._password = obj["password"];
  }

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
//    map["id"] = _id;
    map["name"] = _name;
    map["emailId"] = _emailId;
    map["mobileNo"] = _mobileNo;
    map["dob"] = _dob;
    map["password"] = _password;
    return map;
  }

}