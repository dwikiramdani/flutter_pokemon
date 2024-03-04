class Book {
  List<String> authorName;
  List<String> catalogName;
  int currentlyAvailable;
  String fileSize;
  int id;
  Rating rating;
  String title;
  int totalInCollection;

  Book({
    required this.authorName,
    required this.catalogName,
    required this.currentlyAvailable,
    required this.fileSize,
    required this.id,
    required this.rating,
    required this.title,
    required this.totalInCollection,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      authorName: List<String>.from(json['author_name']),
      catalogName: List<String>.from(json['catalog_name']),
      currentlyAvailable: json['currently_available'],
      fileSize: json['file_size'],
      id: json['id'],
      rating: Rating.fromJson(json['rating']),
      title: json['title'],
      totalInCollection: json['total_in_collection'],
    );
  }
}

class Rating {
  double average;
  int total;

  Rating({required this.average, required this.total});

  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
      average: json['average'],
      total: json['total'],
    );
  }
}

class Detail {
  List<DetailItem> detail;

  Detail({
    required this.detail,
  });

  factory Detail.fromJson(List<dynamic> json) {
    return Detail(
      detail: List<DetailItem>.from(json.map((item) => DetailItem.fromJson(item))),
    );
  }
}

class DetailItem {
  List<String> loc;
  String msg;
  String type;

  DetailItem({
    required this.loc,
    required this.msg,
    required this.type,
  });

  factory DetailItem.fromJson(Map<String, dynamic> json) {
    return DetailItem(
      loc: List<String>.from(json['loc']),
      msg: json['msg'],
      type: json['type'],
    );
  }
}