class DeviceDocBean {
  List<DocFiles>? files;
  String? folderName;

  DeviceDocBean({this.files, this.folderName});

  DeviceDocBean.fromJson(Map<String, dynamic> json) {
    if (json['files'] != null) {
      files = [];
      json['files'].forEach((v) {
        files?.add(DocFiles.fromJson(v));
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

class DocFiles {
  String? path;
  String? mimeType;
  String? size;
  String? title;

  DocFiles({this.path, this.mimeType, this.size, this.title});

  DocFiles.fromJson(Map<String, dynamic> json) {
    path = json['path'];
    mimeType = json['mimeType'];
    size = json['size'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['path'] = path;
    data['mimeType'] = mimeType;
    data['size'] = size;
    data['title'] = title;
    return data;
  }
}


