class DeviceAudioBean {
  List<AudioFiles>? files;
  String? folderName;

  DeviceAudioBean({this.files, this.folderName});

  DeviceAudioBean.fromJson(Map<String, dynamic> json) {
    if (json['files'] != null) {
      files = [];
      json['files'].forEach((v) {
        files?.add(AudioFiles.fromJson(v));
      });
    }
    folderName = json['folderName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (files != null) {
      data['files'] = files?.map((v) => v.toJson()).toList();
    }
    data['folderName'] = folderName;
    return data;
  }
}

class AudioFiles {
  String? album;
  String? artist;
  String? path;
  String? dateAdded;
  String? displayName;
  String? duration;
  String? size;

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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['album'] = album;
    data['artist'] = artist;
    data['path'] = path;
    data['dateAdded'] = dateAdded;
    data['displayName'] = displayName;
    data['duration'] = duration;
    data['size'] = size;
    return data;
  }
}
