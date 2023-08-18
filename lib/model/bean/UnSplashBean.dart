class UnSplashBean {
  int? total;
  int? totalPages;
  List<Results>? results;

  UnSplashBean({this.total, this.totalPages, this.results});

  UnSplashBean.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    totalPages = json['total_pages'];
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total'] = total;
    data['total_pages'] = totalPages;
    if (results != null) {
      data['results'] = results?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  String? id;
  String? createdAt;
  String? updatedAt;
  String? promotedAt;
  int? width;
  int? height;
  String? color;
  String? blurHash;
  String? description;
  String? altDescription;
  Urls? urls;
  // UserLinks links;
  int? likes;
  bool? likedByUser;
  // Null sponsorship;
  User? user;
  // List<Tags> tags;

  Results(
      {this.id,
        this.createdAt,
        this.updatedAt,
        this.promotedAt,
        this.width,
        this.height,
        this.color,
        this.blurHash,
        this.description,
        this.altDescription,
        this.urls,
        // this.links,
        this.likes,
        this.likedByUser,
        // this.sponsorship,
        this.user,
        // this.tags
      });

  Results.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    promotedAt = json['promoted_at'];
    width = json['width'];
    height = json['height'];
    color = json['color'];
    blurHash = json['blur_hash'];
    description = json['description'];
    altDescription = json['alt_description'];
    urls = json['urls'] != null ? Urls.fromJson(json['urls']) : null;
    // links = json['links'] != null ? new UserLinks.fromJson(json['links']) : null;
    likes = json['likes'];
    likedByUser = json['liked_by_user'];
    // sponsorship = json['sponsorship'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    // if (json['tags'] != null) {
    //   tags = new List<Tags>();
    //   json['tags'].forEach((v) {
    //     tags.add(new Tags.fromJson(v));
    //   });
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['promoted_at'] = promotedAt;
    data['width'] = width;
    data['height'] = height;
    data['color'] = color;
    data['blur_hash'] = blurHash;
    data['description'] = description;
    data['alt_description'] = altDescription;
    if (urls != null) {
      data['urls'] = urls?.toJson();
    }
    // if (this.links != null) {
    //   data['links'] = this.links.toJson();
    // }
    data['likes'] = likes;
    data['liked_by_user'] = likedByUser;
    // data['sponsorship'] = this.sponsorship;
    if (user != null) {
      data['user'] = user?.toJson();
    }
    // if (this.tags != null) {
    //   data['tags'] = this.tags.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}

class Urls {
  String? raw;
  String? full;
  String? regular;
  String? small;
  String? thumb;

  Urls({this.raw, this.full, this.regular, this.small, this.thumb});

  Urls.fromJson(Map<String, dynamic> json) {
    raw = json['raw'];
    full = json['full'];
    regular = json['regular'];
    small = json['small'];
    thumb = json['thumb'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['raw'] = raw;
    data['full'] = full;
    data['regular'] = regular;
    data['small'] = small;
    data['thumb'] = thumb;
    return data;
  }
}

class UserLinks {
  String? self;
  String? html;
  String? download;
  String? downloadLocation;

  UserLinks({this.self, this.html, this.download, this.downloadLocation});

  UserLinks.fromJson(Map<String, dynamic> json) {
    self = json['self'];
    html = json['html'];
    download = json['download'];
    downloadLocation = json['download_location'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['self'] = self;
    data['html'] = html;
    data['download'] = download;
    data['download_location'] = downloadLocation;
    return data;
  }
}

class User {
  String? id;
  String? updatedAt;
  String? username;
  String? name;
  String? firstName;
  String? lastName;
  String? twitterUsername;
  String? portfolioUrl;
  String? bio;
  String? location;
  UserLinks? links;
  ProfileImage? profileImage;
  String? instagramUsername;
  int? totalCollections;
  int? totalLikes;
  int? totalPhotos;
  bool? acceptedTos;

  User(
      {this.id,
        this.updatedAt,
        this.username,
        this.name,
        this.firstName,
        this.lastName,
        this.twitterUsername,
        this.portfolioUrl,
        this.bio,
        this.location,
        this.links,
        this.profileImage,
        this.instagramUsername,
        this.totalCollections,
        this.totalLikes,
        this.totalPhotos,
        this.acceptedTos});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    updatedAt = json['updated_at'];
    username = json['username'];
    name = json['name'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    twitterUsername = json['twitter_username'];
    portfolioUrl = json['portfolio_url'];
    bio = json['bio'];
    location = json['location'];
    links = json['links'] != null ? UserLinks.fromJson(json['links']) : null;
    profileImage = json['profile_image'] != null
        ? ProfileImage.fromJson(json['profile_image'])
        : null;
    instagramUsername = json['instagram_username'];
    totalCollections = json['total_collections'];
    totalLikes = json['total_likes'];
    totalPhotos = json['total_photos'];
    acceptedTos = json['accepted_tos'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['updated_at'] = updatedAt;
    data['username'] = username;
    data['name'] = name;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['twitter_username'] = twitterUsername;
    data['portfolio_url'] = portfolioUrl;
    data['bio'] = bio;
    data['location'] = location;
    if (links != null) {
      data['links'] = links?.toJson();
    }
    if (profileImage != null) {
      data['profile_image'] = profileImage?.toJson();
    }
    data['instagram_username'] = instagramUsername;
    data['total_collections'] = totalCollections;
    data['total_likes'] = totalLikes;
    data['total_photos'] = totalPhotos;
    data['accepted_tos'] = acceptedTos;
    return data;
  }
}

class Links {
  String? self;
  String? html;
  String? photos;
  String? likes;
  String? portfolio;
  String? following;
  String? followers;

  Links(
      {this.self,
        this.html,
        this.photos,
        this.likes,
        this.portfolio,
        this.following,
        this.followers});

  Links.fromJson(Map<String, dynamic> json) {
    self = json['self'];
    html = json['html'];
    photos = json['photos'];
    likes = json['likes'];
    portfolio = json['portfolio'];
    following = json['following'];
    followers = json['followers'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['self'] = self;
    data['html'] = html;
    data['photos'] = photos;
    data['likes'] = likes;
    data['portfolio'] = portfolio;
    data['following'] = following;
    data['followers'] = followers;
    return data;
  }
}

class ProfileImage {
  String? small;
  String? medium;
  String? large;

  ProfileImage({this.small, this.medium, this.large});

  ProfileImage.fromJson(Map<String, dynamic> json) {
    small = json['small'];
    medium = json['medium'];
    large = json['large'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['small'] = small;
    data['medium'] = medium;
    data['large'] = large;
    return data;
  }
}

class Tags {
  String? type;
  String? title;
  Source? source;

  Tags({this.type, this.title, this.source});

  Tags.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    title = json['title'];
    source =
    json['source'] != null ? Source.fromJson(json['source']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['title'] = title;
    if (source != null) {
      data['source'] = source?.toJson();
    }
    return data;
  }
}

class Source {
  Ancestry? ancestry;
  String? title;
  String? subtitle;
  String? description;
  String? metaTitle;
  String? metaDescription;
  CoverPhoto? coverPhoto;

  Source(
      {this.ancestry,
        this.title,
        this.subtitle,
        this.description,
        this.metaTitle,
        this.metaDescription,
        this.coverPhoto});

  Source.fromJson(Map<String, dynamic> json) {
    ancestry = json['ancestry'] != null
        ? Ancestry.fromJson(json['ancestry'])
        : null;
    title = json['title'];
    subtitle = json['subtitle'];
    description = json['description'];
    metaTitle = json['meta_title'];
    metaDescription = json['meta_description'];
    coverPhoto = json['cover_photo'] != null
        ? CoverPhoto.fromJson(json['cover_photo'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (ancestry != null) {
      data['ancestry'] = ancestry?.toJson();
    }
    data['title'] = title;
    data['subtitle'] = subtitle;
    data['description'] = description;
    data['meta_title'] = metaTitle;
    data['meta_description'] = metaDescription;
    if (coverPhoto != null) {
      data['cover_photo'] = coverPhoto?.toJson();
    }
    return data;
  }
}

class Ancestry {
  Type? type;
  Type? category;
  Type? subcategory;

  Ancestry({this.type, this.category, this.subcategory});

  Ancestry.fromJson(Map<String, dynamic> json) {
    type = json['type'] != null ? Type.fromJson(json['type']) : null;
    category =
    json['category'] != null ? Type.fromJson(json['category']) : null;
    subcategory = json['subcategory'] != null
        ? Type.fromJson(json['subcategory'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (type != null) {
      data['type'] = type?.toJson();
    }
    if (category != null) {
      data['category'] = category?.toJson();
    }
    if (subcategory != null) {
      data['subcategory'] = subcategory?.toJson();
    }
    return data;
  }
}

class Type {
  String? slug;
  String? prettySlug;

  Type({this.slug, this.prettySlug});

  Type.fromJson(Map<String, dynamic> json) {
    slug = json['slug'];
    prettySlug = json['pretty_slug'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['slug'] = slug;
    data['pretty_slug'] = prettySlug;
    return data;
  }
}

class CoverPhoto {
  String? id;
  String? createdAt;
  String? updatedAt;
  String? promotedAt;
  int? width;
  int? height;
  String? color;
  String? blurHash;
  String? description;
  String? altDescription;
  Urls? urls;
  UserLinks? links;
  int? likes;
  bool? likedByUser;
  Null sponsorship;
  User? user;

  CoverPhoto(
      {this.id,
        this.createdAt,
        this.updatedAt,
        this.promotedAt,
        this.width,
        this.height,
        this.color,
        this.blurHash,
        this.description,
        this.altDescription,
        this.urls,
        this.links,
        this.likes,
        this.likedByUser,
        this.sponsorship,
        this.user});

  CoverPhoto.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    promotedAt = json['promoted_at'];
    width = json['width'];
    height = json['height'];
    color = json['color'];
    blurHash = json['blur_hash'];
    description = json['description'];
    altDescription = json['alt_description'];
    urls = json['urls'] != null ? Urls.fromJson(json['urls']) : null;
    links = json['links'] != null ? UserLinks.fromJson(json['links']) : null;
    likes = json['likes'];
    likedByUser = json['liked_by_user'];
    sponsorship = json['sponsorship'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['promoted_at'] = promotedAt;
    data['width'] = width;
    data['height'] = height;
    data['color'] = color;
    data['blur_hash'] = blurHash;
    data['description'] = description;
    data['alt_description'] = altDescription;
    if (urls != null) {
      data['urls'] = urls?.toJson();
    }
    if (links != null) {
      data['links'] = links?.toJson();
    }
    data['likes'] = likes;
    data['liked_by_user'] = likedByUser;
    data['sponsorship'] = sponsorship;
    if (user != null) {
      data['user'] = user?.toJson();
    }
    return data;
  }
}