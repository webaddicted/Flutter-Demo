class BooksRespo {
  String kind;
  int totalItems;
  List<Items> items;

  BooksRespo({this.kind, this.totalItems, this.items});

  BooksRespo.fromJson(Map<String, dynamic> json) {
    kind = json['kind'];
    totalItems = json['totalItems'];
    if (json['items'] != null) {
      items = new List<Items>();
      json['items'].forEach((v) {
        items.add(new Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['kind'] = this.kind;
    data['totalItems'] = this.totalItems;
    if (this.items != null) {
      data['items'] = this.items.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  String kind;
  String id;
  String etag;
  String selfLink;
  VolumeInfo volumeInfo;
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
        ? new VolumeInfo.fromJson(json['volumeInfo'])
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['kind'] = this.kind;
    data['id'] = this.id;
    data['etag'] = this.etag;
    data['selfLink'] = this.selfLink;
    if (this.volumeInfo != null) {
      data['volumeInfo'] = this.volumeInfo.toJson();
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
  String title;
  String subtitle;
  // List<String> authors;
  String publisher;
  String publishedDate;
  String description;
  ReadingModes readingModes;
  int pageCount;
  String printType;
  // List<String> categories;
  String maturityRating;
  bool allowAnonLogging;
  String contentVersion;
  PanelizationSummary panelizationSummary;
  bool comicsContent;
  ImageLinks imageLinks;
  String language;
  String previewLink;
  String infoLink;
  String canonicalVolumeLink;
  List<IndustryIdentifiers> industryIdentifiers;
  SeriesInfo seriesInfo;

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
        ? new ReadingModes.fromJson(json['readingModes'])
        : null;
    pageCount = json['pageCount'];
    printType = json['printType'];
    // categories = json['categories'].cast<String>();
    maturityRating = json['maturityRating'];
    allowAnonLogging = json['allowAnonLogging'];
    contentVersion = json['contentVersion'];
    panelizationSummary = json['panelizationSummary'] != null
        ? new PanelizationSummary.fromJson(json['panelizationSummary'])
        : null;
    comicsContent = json['comicsContent'];
    imageLinks = json['imageLinks'] != null
        ? new ImageLinks.fromJson(json['imageLinks'])
        : null;
    language = json['language'];
    previewLink = json['previewLink'];
    infoLink = json['infoLink'];
    canonicalVolumeLink = json['canonicalVolumeLink'];
    if (json['industryIdentifiers'] != null) {
      industryIdentifiers = new List<IndustryIdentifiers>();
      json['industryIdentifiers'].forEach((v) {
        industryIdentifiers.add(new IndustryIdentifiers.fromJson(v));
      });
    }
    seriesInfo = json['seriesInfo'] != null
        ? new SeriesInfo.fromJson(json['seriesInfo'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['subtitle'] = this.subtitle;
    // data['authors'] = this.authors;
    data['publisher'] = this.publisher;
    data['publishedDate'] = this.publishedDate;
    data['description'] = this.description;
    if (this.readingModes != null) {
      data['readingModes'] = this.readingModes.toJson();
    }
    data['pageCount'] = this.pageCount;
    data['printType'] = this.printType;
    // data['categories'] = this.categories;
    data['maturityRating'] = this.maturityRating;
    data['allowAnonLogging'] = this.allowAnonLogging;
    data['contentVersion'] = this.contentVersion;
    if (this.panelizationSummary != null) {
      data['panelizationSummary'] = this.panelizationSummary.toJson();
    }
    data['comicsContent'] = this.comicsContent;
    if (this.imageLinks != null) {
      data['imageLinks'] = this.imageLinks.toJson();
    }
    data['language'] = this.language;
    data['previewLink'] = this.previewLink;
    data['infoLink'] = this.infoLink;
    data['canonicalVolumeLink'] = this.canonicalVolumeLink;
    if (this.industryIdentifiers != null) {
      data['industryIdentifiers'] =
          this.industryIdentifiers.map((v) => v.toJson()).toList();
    }
    if (this.seriesInfo != null) {
      data['seriesInfo'] = this.seriesInfo.toJson();
    }
    return data;
  }
}

class ReadingModes {
  bool text;
  bool image;

  ReadingModes({this.text, this.image});

  ReadingModes.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text;
    data['image'] = this.image;
    return data;
  }
}

class PanelizationSummary {
  bool containsEpubBubbles;
  bool containsImageBubbles;
  String imageBubbleVersion;

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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['containsEpubBubbles'] = this.containsEpubBubbles;
    data['containsImageBubbles'] = this.containsImageBubbles;
    data['imageBubbleVersion'] = this.imageBubbleVersion;
    return data;
  }
}

class ImageLinks {
  String smallThumbnail;
  String thumbnail;

  ImageLinks({this.smallThumbnail, this.thumbnail});

  ImageLinks.fromJson(Map<String, dynamic> json) {
    smallThumbnail = json['smallThumbnail'];
    thumbnail = json['thumbnail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['smallThumbnail'] = this.smallThumbnail;
    data['thumbnail'] = this.thumbnail;
    return data;
  }
}

class IndustryIdentifiers {
  String type;
  String identifier;

  IndustryIdentifiers({this.type, this.identifier});

  IndustryIdentifiers.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    identifier = json['identifier'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['identifier'] = this.identifier;
    return data;
  }
}

class SeriesInfo {
  String kind;
  String shortSeriesBookTitle;
  String bookDisplayNumber;
  List<VolumeSeries> volumeSeries;

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
      volumeSeries = new List<VolumeSeries>();
      json['volumeSeries'].forEach((v) {
        volumeSeries.add(new VolumeSeries.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['kind'] = this.kind;
    data['shortSeriesBookTitle'] = this.shortSeriesBookTitle;
    data['bookDisplayNumber'] = this.bookDisplayNumber;
    if (this.volumeSeries != null) {
      data['volumeSeries'] = this.volumeSeries.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class VolumeSeries {
  String seriesId;
  String seriesBookType;
  int orderNumber;

  VolumeSeries({this.seriesId, this.seriesBookType, this.orderNumber});

  VolumeSeries.fromJson(Map<String, dynamic> json) {
    seriesId = json['seriesId'];
    seriesBookType = json['seriesBookType'];
    orderNumber = json['orderNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['seriesId'] = this.seriesId;
    data['seriesBookType'] = this.seriesBookType;
    data['orderNumber'] = this.orderNumber;
    return data;
  }
}

class SaleInfo {
  String country;
  String saleability;
  bool isEbook;
  BookListPrice listPrice;
  BookListPrice retailPrice;
  String buyLink;
  List<Offers> offers;

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
        ? new BookListPrice.fromJson(json['listPrice'])
        : null;
    retailPrice = json['retailPrice'] != null
        ? new BookListPrice.fromJson(json['retailPrice'])
        : null;
    buyLink = json['buyLink'];
    if (json['offers'] != null) {
      offers = new List<Offers>();
      json['offers'].forEach((v) {
        offers.add(new Offers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['country'] = this.country;
    data['saleability'] = this.saleability;
    data['isEbook'] = this.isEbook;
    if (this.listPrice != null) {
      data['listPrice'] = this.listPrice.toJson();
    }
    if (this.retailPrice != null) {
      data['retailPrice'] = this.retailPrice.toJson();
    }
    data['buyLink'] = this.buyLink;
    if (this.offers != null) {
      data['offers'] = this.offers.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BookListPrice {
  double amount;
  String currencyCode;

  BookListPrice({this.amount, this.currencyCode});

  BookListPrice.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    currencyCode = json['currencyCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['amount'] = this.amount;
    data['currencyCode'] = this.currencyCode;
    return data;
  }
}

class Offers {
  int finskyOfferType;
  ListPrice listPrice;
  ListPrice retailPrice;

  Offers({this.finskyOfferType, this.listPrice, this.retailPrice});

  Offers.fromJson(Map<String, dynamic> json) {
    finskyOfferType = json['finskyOfferType'];
    listPrice = json['listPrice'] != null
        ? new ListPrice.fromJson(json['listPrice'])
        : null;
    retailPrice = json['retailPrice'] != null
        ? new ListPrice.fromJson(json['retailPrice'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['finskyOfferType'] = this.finskyOfferType;
    if (this.listPrice != null) {
      data['listPrice'] = this.listPrice.toJson();
    }
    if (this.retailPrice != null) {
      data['retailPrice'] = this.retailPrice.toJson();
    }
    return data;
  }
}

class ListPrice {
  int amountInMicros;
  String currencyCode;

  ListPrice({this.amountInMicros, this.currencyCode});

  ListPrice.fromJson(Map<String, dynamic> json) {
    amountInMicros = json['amountInMicros'];
    currencyCode = json['currencyCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['amountInMicros'] = this.amountInMicros;
    data['currencyCode'] = this.currencyCode;
    return data;
  }
}

class AccessInfo {
  String country;
  String viewability;
  bool embeddable;
  bool publicDomain;
  String textToSpeechPermission;
  Epub epub;
  Epub pdf;
  String webReaderLink;
  String accessViewStatus;
  bool quoteSharingAllowed;

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
    epub = json['epub'] != null ? new Epub.fromJson(json['epub']) : null;
    pdf = json['pdf'] != null ? new Epub.fromJson(json['pdf']) : null;
    webReaderLink = json['webReaderLink'];
    accessViewStatus = json['accessViewStatus'];
    quoteSharingAllowed = json['quoteSharingAllowed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['country'] = this.country;
    data['viewability'] = this.viewability;
    data['embeddable'] = this.embeddable;
    data['publicDomain'] = this.publicDomain;
    data['textToSpeechPermission'] = this.textToSpeechPermission;
    if (this.epub != null) {
      data['epub'] = this.epub.toJson();
    }
    if (this.pdf != null) {
      data['pdf'] = this.pdf.toJson();
    }
    data['webReaderLink'] = this.webReaderLink;
    data['accessViewStatus'] = this.accessViewStatus;
    data['quoteSharingAllowed'] = this.quoteSharingAllowed;
    return data;
  }
}

class Epub {
  bool isAvailable;
  String acsTokenLink;

  Epub({this.isAvailable, this.acsTokenLink});

  Epub.fromJson(Map<String, dynamic> json) {
    isAvailable = json['isAvailable'];
    acsTokenLink = json['acsTokenLink'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isAvailable'] = this.isAvailable;
    data['acsTokenLink'] = this.acsTokenLink;
    return data;
  }
}

class SearchInfo {
  String textSnippet;

  SearchInfo({this.textSnippet});

  SearchInfo.fromJson(Map<String, dynamic> json) {
    textSnippet = json['textSnippet'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['textSnippet'] = this.textSnippet;
    return data;
  }
}