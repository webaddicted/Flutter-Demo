/// files : [{"album":"<unknown>","artist":"<unknown>","path":"/storage/emulated/0/Download/Mulan (2020) [Worldfree4u.Ltd] 720p HDRip x264 [Dual Audio] [Hindi DD 2.0 + Chinese DD 2.0].mkv","dateAdded":"1590335712","displayName":"Mulan (2020) [Worldfree4u.Ltd] 720p HDRip x264 [Dual Audio] [Hindi DD 2.0 + Chinese DD 2.0].mkv","duration":"5449440","size":"821936231"},{"album":"<unknown>","artist":"<unknown>","path":"/storage/emulated/0/Download/Miss Peregrines Home for Peculiar Children (2016) [Worldfree4u.trade] 720p BluRay [Dual Audio] [English+Hindi].mkv","dateAdded":"1590335584","displayName":"Miss Peregrines Home for Peculiar Children (2016) [Worldfree4u.trade] 720p BluRay [Dual Audio] [English+Hindi].mkv","duration":"7615712","size":"1331894038"},{"album":"<unknown>","artist":"<unknown>","path":"/storage/emulated/0/Download/Kung Fu Jungle (2014) [Worldfree4u.ink] 720p BluRay x264 ESub [Dual Audio] [Hindi DD 2.0 + Chinese DD 2.0].mkv","dateAdded":"1589912291","displayName":"Kung Fu Jungle (2014) [Worldfree4u.ink] 720p BluRay x264 ESub [Dual Audio] [Hindi DD 2.0 + Chinese DD 2.0].mkv","duration":"6011563","size":"1101046369"},{"album":"<unknown>","artist":"<unknown>","path":"/storage/emulated/0/Download/Diagonal 8 Screens (1600x1200) Dribbble.mp4","dateAdded":"1588175953","displayName":"Diagonal 8 Screens (1600x1200) Dribbble.mp4","duration":"24000","size":"9157692"},{"album":"<unknown>","artist":"<unknown>","path":"/storage/emulated/0/Download/Prmovies.com-Meeruthiya_Gangsters_(2015).mp4","dateAdded":"1587672720","displayName":"Prmovies.com-Meeruthiya_Gangsters_(2015).mp4","duration":"7601401","size":"841005692"}]
/// folderName : "Download"
class DeviceVideoBean {
  List<Files> files;
  String folderName;

  DeviceVideoBean({this.files, this.folderName});

  DeviceVideoBean.fromJson(Map<String, dynamic> json) {
    if (json['files'] != null) {
      files = new List<Files>();
      json['files'].forEach((v) {
        files.add(new Files.fromJson(v));
      });
    }
    folderName = json['folderName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.files != null) {
      data['files'] = this.files.map((v) => v.toJson()).toList();
    }
    data['folderName'] = this.folderName;
    return data;
  }
}

class Files {
  String album;
  String artist;
  String path;
  String dateAdded;
  String displayName;
  String duration;
  String size;

  Files(
      {this.album,
        this.artist,
        this.path,
        this.dateAdded,
        this.displayName,
        this.duration,
        this.size});

  Files.fromJson(Map<String, dynamic> json) {
    album = json['album'];
    artist = json['artist'];
    path = json['path'];
    dateAdded = json['dateAdded'];
    displayName = json['displayName'];
    duration = json['duration'];
    size = json['size'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['album'] = this.album;
    data['artist'] = this.artist;
    data['path'] = this.path;
    data['dateAdded'] = this.dateAdded;
    data['displayName'] = this.displayName;
    data['duration'] = this.duration;
    data['size'] = this.size;
    return data;
  }
}
//class DeviceVideoBean {
//  List<FilesBean> _files;
//  String _folderName;
//
//  List<FilesBean> get files => _files;
//
//  String get folderName => _folderName;
//
//  DeviceVideoBean(this._files, this._folderName);
//
//  DeviceVideoBean.map(dynamic obj) {
//    this._files = obj["files"];
//    this._folderName = obj["folderName"];
//  }
//
//
//  Map<String, dynamic> toMap() {
//    var map = new Map<String, dynamic>();
//    map["files"] = _files;
//    map["folderName"] = _folderName;
//    return map;
//  }
//}
//
///// album : "<unknown>"
///// artist : "<unknown>"
///// path : "/storage/emulated/0/Download/Mulan (2020) [Worldfree4u.Ltd] 720p HDRip x264 [Dual Audio] [Hindi DD 2.0 + Chinese DD 2.0].mkv"
///// dateAdded : "1590335712"
///// displayName : "Mulan (2020) [Worldfree4u.Ltd] 720p HDRip x264 [Dual Audio] [Hindi DD 2.0 + Chinese DD 2.0].mkv"
///// duration : "5449440"
///// size : "821936231"
//
//class FilesBean {
//  String _album;
//  String _artist;
//  String _path;
//  String _dateAdded;
//  String _displayName;
//  String _duration;
//  String _size;
//
//  String get album => _album;
//
//  String get artist => _artist;
//
//  String get path => _path;
//
//  String get dateAdded => _dateAdded;
//
//  String get displayName => _displayName;
//
//  String get duration => _duration;
//
//  String get size => _size;
//
//  FilesBean(this._album, this._artist, this._path, this._dateAdded,
//      this._displayName, this._duration, this._size);
//
//  FilesBean.map(dynamic obj) {
//    this._album = obj["album"];
//    this._artist = obj["artist"];
//    this._path = obj["path"];
//    this._dateAdded = obj["dateAdded"];
//    this._displayName = obj["displayName"];
//    this._duration = obj["duration"];
//    this._size = obj["size"];
//  }
//
//  Map<String, dynamic> toMap() {
//    var map = new Map<String, dynamic>();
//    map["album"] = _album;
//    map["artist"] = _artist;
//    map["path"] = _path;
//    map["dateAdded"] = _dateAdded;
//    map["displayName"] = _displayName;
//    map["duration"] = _duration;
//    map["size"] = _size;
//    return map;
//  }
//}
