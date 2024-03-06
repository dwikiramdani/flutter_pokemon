import 'package:flutter_pokemon/shared/helper/json_utils.dart';

class OwnedItemDetail {
  String authorName;
  List<int> categoryIds;
  String categoryName;
  CoverImage coverImage;
  Details details;
  String fileSize;
  int id;
  String isbn;
  String itemType;
  String title;
  Vendor vendor;
  String vendorName;

  OwnedItemDetail({
    required this.authorName,
    required this.categoryIds,
    required this.categoryName,
    required this.coverImage,
    required this.details,
    required this.fileSize,
    required this.id,
    required this.isbn,
    required this.itemType,
    required this.title,
    required this.vendor,
    required this.vendorName,
  });

  factory OwnedItemDetail.fromJson(Map<String, dynamic> json) {
    return OwnedItemDetail(
      authorName: json['author_name'] ?? "",
      categoryIds: List<int>.from(json['category_ids'] ?? []),
      categoryName: json['category_name'] ?? "",
      coverImage: CoverImage.fromJson(json['cover_image'] ?? {}),
      details: Details.fromJson(json['details'] ?? {}),
      fileSize: json['file_size'] ?? "",
      id: json['id'] ?? 0,
      isbn: json['isbn'] ?? "",
      itemType: json['item_type'] ?? "",
      title: json['title'] ?? "",
      vendor: Vendor.fromJson(json['vendor'] ?? {}),
      vendorName: json['vendor_name'] ?? "",
    );
  }
}

class Details {
  int id;
  String title;
  String href;

  Details({
    required this.id,
    required this.title,
    required this.href,
  });

  factory Details.fromJson(Map<String, dynamic> json) {
    return Details(
      id: json['id'] ?? 0,
      title: json['title'] ?? "",
      href: json['href'] ?? "",
    );
  }
}

class Vendor {
  String title;
  String href;

  Vendor({
    required this.title,
    required this.href,
  });

  factory Vendor.fromJson(Map<String, dynamic> json) {
    return Vendor(
      title: json['title'] ?? "",
      href: json['href'] ?? "",
    );
  }
}

class CoverImage {
  String title;
  String href;

  CoverImage({required this.title, required this.href});

  factory CoverImage.fromJson(Map<String, dynamic> json) {
    return CoverImage(
      title: getJsonValueAsString(json, 'title'),
      href: getJsonValueAsString(json, 'href'),
    );
  }
}
