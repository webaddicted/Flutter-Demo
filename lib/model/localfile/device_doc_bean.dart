class DeviceDocBean {
  List<DocFiles> files;
  String folderName;

  DeviceDocBean({this.files, this.folderName});

  DeviceDocBean.fromJson(Map<String, dynamic> json) {
    if (json['files'] != null) {
      files = new List<DocFiles>();
      json['files'].forEach((v) {
        files.add(new DocFiles.fromJson(v));
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

class DocFiles {
  String path;
  String mimeType;
  String size;
  String title;

  DocFiles({this.path, this.mimeType, this.size, this.title});

  DocFiles.fromJson(Map<String, dynamic> json) {
    path = json['path'];
    mimeType = json['mimeType'];
    size = json['size'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['path'] = this.path;
    data['mimeType'] = this.mimeType;
    data['size'] = this.size;
    data['title'] = this.title;
    return data;
  }
}


