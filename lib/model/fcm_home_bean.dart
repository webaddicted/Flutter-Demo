/// id : "1"
/// image : "https://res.cloudinary.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_508,h_320,c_fill/g1baicpgync0xmzdgpun"
/// name : "Pizza"

class FcmHomeBean {
  String _id;
  String _image;
  String _name;

  String get id => _id;
  String get image => _image;
  String get name => _name;

  FcmHomeBean(this._id, this._image, this._name);

  FcmHomeBean.map(dynamic obj) {
    this._id = obj["id"];
    this._image = obj["image"];
    this._name = obj["name"];
  }

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["id"] = _id;
    map["image"] = _image;
    map["name"] = _name;
    return map;
  }

}