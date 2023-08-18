class BooksRespo {
  String? kind;
  int? totalItems;
  List<Items>? items;

  BooksRespo({this.kind, this.totalItems, this.items});

  BooksRespo.fromJson(Map<String, dynamic> json) {
    kind = json['kind'];
    totalItems = json['totalItems'];
    if (json['items'] != null) {
      items = [];
      json['items'].forEach((v) {
        items?.add(Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['kind'] = kind;
    data['totalItems'] = totalItems;
    if (items != null) {
      data['items'] = items?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  String? kind;
  String? id;
  String? etag;
  String? selfLink;
  VolumeInfo? volumeInfo;
  // SaleInfo saleInfo;
  // AccessInfo accessInfo;
  // SearchInfo searchInfo;

  Items(
      {this.kind,
        this.id,
        this.etag,
        this.selfLink,
        this.volumeInfo,
        // this.saleInfo,
        // this.accessInfo,
        // this.searchInfo
      });

  Items.fromJson(Map<String, dynamic> json) {
    kind = json['kind'];
    id = json['id'];
    etag = json['etag'];
    selfLink = json['selfLink'];
    volumeInfo = json['volumeInfo'] != null
        ? VolumeInfo.fromJson(json['volumeInfo'])
        : null;
    // saleInfo = json['saleInfo'] != null
    //     ? new SaleInfo.fromJson(json['saleInfo'])
    //     : null;
    // accessInfo = json['accessInfo'] != null
    //     ? new AccessInfo.fromJson(json['accessInfo'])
    //     : null;
    // searchInfo = json['searchInfo'] != null
    //     ? new SearchInfo.fromJson(json['searchInfo'])
    //     : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['kind'] = kind;
    data['id'] = id;
    data['etag'] = etag;
    data['selfLink'] = selfLink;
    if (volumeInfo != null) {
      data['volumeInfo'] = volumeInfo?.toJson();
    }
    // if (this.saleInfo != null) {
    //   data['saleInfo'] = this.saleInfo.toJson();
    // }
    // if (this.accessInfo != null) {
    //   data['accessInfo'] = this.accessInfo.toJson();
    // }
    // if (this.searchInfo != null) {
    //   data['searchInfo'] = this.searchInfo.toJson();
    // }
    return data;
  }
}

class VolumeInfo {
  String? title;
  String? subtitle;
  // List<String> authors;
  String? publisher;
  String? publishedDate;
  String? description;
  ReadingModes? readingModes;
  int? pageCount;
  String? printType;
  // List<String> categories;
  String? maturityRating;
  bool? allowAnonLogging;
  String? contentVersion;
  PanelizationSummary? panelizationSummary;
  bool? comicsContent;
  ImageLinks? imageLinks;
  String? language;
  String? previewLink;
  String? infoLink;
  String? canonicalVolumeLink;
  List<IndustryIdentifiers>? industryIdentifiers;
  SeriesInfo? seriesInfo;

  VolumeInfo(
      {this.title,
        this.subtitle,
        // this.authors,
        this.publisher,
        this.publishedDate,
        this.description,
        this.readingModes,
        this.pageCount,
        this.printType,
        // this.categories,
        this.maturityRating,
        this.allowAnonLogging,
        this.contentVersion,
        this.panelizationSummary,
        this.comicsContent,
        this.imageLinks,
        this.language,
        this.previewLink,
        this.infoLink,
        this.canonicalVolumeLink,
        this.industryIdentifiers,
        this.seriesInfo});

  VolumeInfo.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    subtitle = json['subtitle'];
    // authors = json['authors'].cast<String>();
    publisher = json['publisher'];
    publishedDate = json['publishedDate'];
    description = json['description'];
    readingModes = json['readingModes'] != null
        ? ReadingModes.fromJson(json['readingModes'])
        : null;
    pageCount = json['pageCount'];
    printType = json['printType'];
    // categories = json['categories'].cast<String>();
    maturityRating = json['maturityRating'];
    allowAnonLogging = json['allowAnonLogging'];
    contentVersion = json['contentVersion'];
    panelizationSummary = json['panelizationSummary'] != null
        ? PanelizationSummary.fromJson(json['panelizationSummary'])
        : null;
    comicsContent = json['comicsContent'];
    imageLinks = json['imageLinks'] != null
        ? ImageLinks.fromJson(json['imageLinks'])
        : null;
    language = json['language'];
    previewLink = json['previewLink'];
    infoLink = json['infoLink'];
    canonicalVolumeLink = json['canonicalVolumeLink'];
    if (json['industryIdentifiers'] != null) {
      industryIdentifiers = [];
      json['industryIdentifiers'].forEach((v) {
        industryIdentifiers?.add(IndustryIdentifiers.fromJson(v));
      });
    }
    seriesInfo = json['seriesInfo'] != null
        ? SeriesInfo.fromJson(json['seriesInfo'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['subtitle'] = subtitle;
    // data['authors'] = this.authors;
    data['publisher'] = publisher;
    data['publishedDate'] = publishedDate;
    data['description'] = description;
    if (readingModes != null) {
      data['readingModes'] = readingModes?.toJson();
    }
    data['pageCount'] = pageCount;
    data['printType'] = printType;
    // data['categories'] = this.categories;
    data['maturityRating'] = maturityRating;
    data['allowAnonLogging'] = allowAnonLogging;
    data['contentVersion'] = contentVersion;
    if (panelizationSummary != null) {
      data['panelizationSummary'] = panelizationSummary?.toJson();
    }
    data['comicsContent'] = comicsContent;
    if (imageLinks != null) {
      data['imageLinks'] = imageLinks?.toJson();
    }
    data['language'] = language;
    data['previewLink'] = previewLink;
    data['infoLink'] = infoLink;
    data['canonicalVolumeLink'] = canonicalVolumeLink;
    if (industryIdentifiers != null) {
      data['industryIdentifiers'] =
          industryIdentifiers?.map((v) => v.toJson()).toList();
    }
    if (seriesInfo != null) {
      data['seriesInfo'] = seriesInfo?.toJson();
    }
    return data;
  }
}

class ReadingModes {
  bool? text;
  bool? image;

  ReadingModes({this.text, this.image});

  ReadingModes.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['text'] = text;
    data['image'] = image;
    return data;
  }
}

class PanelizationSummary {
  bool? containsEpubBubbles;
  bool? containsImageBubbles;
  String? imageBubbleVersion;

  PanelizationSummary(
      {this.containsEpubBubbles,
        this.containsImageBubbles,
        this.imageBubbleVersion});

  PanelizationSummary.fromJson(Map<String, dynamic> json) {
    containsEpubBubbles = json['containsEpubBubbles'];
    containsImageBubbles = json['containsImageBubbles'];
    imageBubbleVersion = json['imageBubbleVersion'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['containsEpubBubbles'] = containsEpubBubbles;
    data['containsImageBubbles'] = containsImageBubbles;
    data['imageBubbleVersion'] = imageBubbleVersion;
    return data;
  }
}

class ImageLinks {
  String? smallThumbnail;
  String? thumbnail;

  ImageLinks({this.smallThumbnail, this.thumbnail});

  ImageLinks.fromJson(Map<String, dynamic> json) {
    smallThumbnail = json['smallThumbnail'];
    thumbnail = json['thumbnail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['smallThumbnail'] = smallThumbnail;
    data['thumbnail'] = thumbnail;
    return data;
  }
}

class IndustryIdentifiers {
  String? type;
  String? identifier;

  IndustryIdentifiers({this.type, this.identifier});

  IndustryIdentifiers.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    identifier = json['identifier'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['identifier'] = identifier;
    return data;
  }
}

class SeriesInfo {
  String? kind;
  String? shortSeriesBookTitle;
  String? bookDisplayNumber;
  List<VolumeSeries>? volumeSeries;

  SeriesInfo(
      {this.kind,
        this.shortSeriesBookTitle,
        this.bookDisplayNumber,
        this.volumeSeries});

  SeriesInfo.fromJson(Map<String, dynamic> json) {
    kind = json['kind'];
    shortSeriesBookTitle = json['shortSeriesBookTitle'];
    bookDisplayNumber = json['bookDisplayNumber'];
    if (json['volumeSeries'] != null) {
      volumeSeries = [];
      json['volumeSeries'].forEach((v) {
        volumeSeries?.add(VolumeSeries.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['kind'] = kind;
    data['shortSeriesBookTitle'] = shortSeriesBookTitle;
    data['bookDisplayNumber'] = bookDisplayNumber;
    if (volumeSeries != null) {
      data['volumeSeries'] = volumeSeries?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class VolumeSeries {
  String? seriesId;
  String? seriesBookType;
  int? orderNumber;

  VolumeSeries({this.seriesId, this.seriesBookType, this.orderNumber});

  VolumeSeries.fromJson(Map<String, dynamic> json) {
    seriesId = json['seriesId'];
    seriesBookType = json['seriesBookType'];
    orderNumber = json['orderNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['seriesId'] = seriesId;
    data['seriesBookType'] = seriesBookType;
    data['orderNumber'] = orderNumber;
    return data;
  }
}

class SaleInfo {
  String? country;
  String? saleability;
  bool? isEbook;
  BookListPrice? listPrice;
  BookListPrice? retailPrice;
  String? buyLink;
  List<Offers>? offers;

  SaleInfo(
      {this.country,
        this.saleability,
        this.isEbook,
        this.listPrice,
        this.retailPrice,
        this.buyLink,
        this.offers});

  SaleInfo.fromJson(Map<String, dynamic> json) {
    country = json['country'];
    saleability = json['saleability'];
    isEbook = json['isEbook'];
    listPrice = json['listPrice'] != null
        ? BookListPrice.fromJson(json['listPrice'])
        : null;
    retailPrice = json['retailPrice'] != null
        ? BookListPrice.fromJson(json['retailPrice'])
        : null;
    buyLink = json['buyLink'];
    if (json['offers'] != null) {
      offers = [];
      json['offers'].forEach((v) {
        offers?.add(Offers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['country'] = country;
    data['saleability'] = saleability;
    data['isEbook'] = isEbook;
    if (listPrice != null) {
      data['listPrice'] = listPrice?.toJson();
    }
    if (retailPrice != null) {
      data['retailPrice'] = retailPrice?.toJson();
    }
    data['buyLink'] = buyLink;
    if (offers != null) {
      data['offers'] = offers?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BookListPrice {
  double? amount;
  String? currencyCode;

  BookListPrice({this.amount, this.currencyCode});

  BookListPrice.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    currencyCode = json['currencyCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['amount'] = amount;
    data['currencyCode'] = currencyCode;
    return data;
  }
}

class Offers {
  int? finskyOfferType;
  ListPrice? listPrice;
  ListPrice? retailPrice;

  Offers({this.finskyOfferType, this.listPrice, this.retailPrice});

  Offers.fromJson(Map<String, dynamic> json) {
    finskyOfferType = json['finskyOfferType'];
    listPrice = json['listPrice'] != null
        ? ListPrice.fromJson(json['listPrice'])
        : null;
    retailPrice = json['retailPrice'] != null
        ? ListPrice.fromJson(json['retailPrice'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['finskyOfferType'] = finskyOfferType;
    if (listPrice != null) {
      data['listPrice'] = listPrice?.toJson();
    }
    if (retailPrice != null) {
      data['retailPrice'] = retailPrice?.toJson();
    }
    return data;
  }
}

class ListPrice {
  int? amountInMicros;
  String? currencyCode;

  ListPrice({this.amountInMicros, this.currencyCode});

  ListPrice.fromJson(Map<String, dynamic> json) {
    amountInMicros = json['amountInMicros'];
    currencyCode = json['currencyCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['amountInMicros'] = amountInMicros;
    data['currencyCode'] = currencyCode;
    return data;
  }
}

class AccessInfo {
  String? country;
  String? viewability;
  bool? embeddable;
  bool? publicDomain;
  String? textToSpeechPermission;
  Epub? epub;
  Epub? pdf;
  String? webReaderLink;
  String? accessViewStatus;
  bool? quoteSharingAllowed;

  AccessInfo(
      {this.country,
        this.viewability,
        this.embeddable,
        this.publicDomain,
        this.textToSpeechPermission,
        this.epub,
        this.pdf,
        this.webReaderLink,
        this.accessViewStatus,
        this.quoteSharingAllowed});

  AccessInfo.fromJson(Map<String, dynamic> json) {
    country = json['country'];
    viewability = json['viewability'];
    embeddable = json['embeddable'];
    publicDomain = json['publicDomain'];
    textToSpeechPermission = json['textToSpeechPermission'];
    epub = json['epub'] != null ? Epub.fromJson(json['epub']) : null;
    pdf = json['pdf'] != null ? Epub.fromJson(json['pdf']) : null;
    webReaderLink = json['webReaderLink'];
    accessViewStatus = json['accessViewStatus'];
    quoteSharingAllowed = json['quoteSharingAllowed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['country'] = country;
    data['viewability'] = viewability;
    data['embeddable'] = embeddable;
    data['publicDomain'] = publicDomain;
    data['textToSpeechPermission'] = textToSpeechPermission;
    if (epub != null) {
      data['epub'] = epub?.toJson();
    }
    if (pdf != null) {
      data['pdf'] = pdf?.toJson();
    }
    data['webReaderLink'] = webReaderLink;
    data['accessViewStatus'] = accessViewStatus;
    data['quoteSharingAllowed'] = quoteSharingAllowed;
    return data;
  }
}

class Epub {
  bool? isAvailable;
  String? acsTokenLink;

  Epub({this.isAvailable, this.acsTokenLink});

  Epub.fromJson(Map<String, dynamic> json) {
    isAvailable = json['isAvailable'];
    acsTokenLink = json['acsTokenLink'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['isAvailable'] = isAvailable;
    data['acsTokenLink'] = acsTokenLink;
    return data;
  }
}

class SearchInfo {
  String? textSnippet;

  SearchInfo({this.textSnippet});

  SearchInfo.fromJson(Map<String, dynamic> json) {
    textSnippet = json['textSnippet'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['textSnippet'] = textSnippet;
    return data;
  }
}