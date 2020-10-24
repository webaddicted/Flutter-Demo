class DeviceAudioBean {
  List<AudioFiles> files;
  String folderName;

  DeviceAudioBean({this.files, this.folderName});

  DeviceAudioBean.fromJson(Map<String, dynamic> json) {
    if (json['files'] != null) {
      files = new List<AudioFiles>();
      json['files'].forEach((v) {
        files.add(new AudioFiles.fromJson(v));
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

class AudioFiles {
  String album;
  String artist;
  String path;
  String dateAdded;
  String displayName;
  String duration;
  String size;

  AudioFiles(
      {this.album,
        this.artist,
        this.path,
        this.dateAdded,
        this.displayName,
        this.duration,
        this.size});

  AudioFiles.fromJson(Map<String, dynamic> json) {
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
