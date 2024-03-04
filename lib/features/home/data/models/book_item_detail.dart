import 'package:flutter_pokemon/features/home/data/models/book_item.dart';
import 'package:flutter_pokemon/shared/helper/json_utils.dart';

class BookDetails {
  int id;
  List<String> previews;
  String title;
  String subTitle;
  String edition;
  String description;
  List<Offer> offers;
  String contentType;
  bool isAgeRestricted;
  String itemType;
  String editionCode;
  String issueNumber;
  DateTime releaseDate;
  String slug;
  List<Category> categories;
  Brand brand;
  Vendor vendor;
  String thumbImageHighres;
  String thumbImageNormal;
  String imageHighres;
  String gtin14;
  String languages;
  String countries;
  int pageCount;
  String fileSize;

  BookDetails({
    required this.id,
    required this.previews,
    required this.title,
    required this.subTitle,
    required this.edition,
    required this.description,
    required this.offers,
    required this.contentType,
    required this.isAgeRestricted,
    required this.itemType,
    required this.editionCode,
    required this.issueNumber,
    required this.releaseDate,
    required this.slug,
    required this.categories,
    required this.brand,
    required this.vendor,
    required this.thumbImageHighres,
    required this.thumbImageNormal,
    required this.imageHighres,
    required this.gtin14,
    required this.languages,
    required this.countries,
    required this.pageCount,
    required this.fileSize,
  });

  factory BookDetails.fromJson(Map<String, dynamic> json) {
    return BookDetails(
      id: getJsonValueAsInt(json, 'id'),
      previews: getJsonValueAsStringList(json, 'previews'),
      title: getJsonValueAsString(json, 'title'),
      subTitle: getJsonValueAsString(json, 'sub_title'),
      edition: getJsonValueAsString(json, 'edition'),
      description: getJsonValueAsString(json, 'description'),
      offers: getJsonListValue(json, 'offers')
          .map<Offer>((dynamic value) => Offer.fromJson(value))
          .toList(),
      contentType: getJsonValueAsString(json, 'content_type'),
      isAgeRestricted: getJsonValueAsBool(json, 'is_age_restricted'),
      itemType: getJsonValueAsString(json, 'item_type'),
      editionCode: getJsonValueAsString(json, 'edition_code'),
      issueNumber: getJsonValueAsString(json, 'issue_number'),
      releaseDate: DateTime.parse(getJsonValueAsString(json, 'release_date')),
      slug: getJsonValueAsString(json, 'slug'),
      categories: getJsonListValue(json, 'category')
          .map<Category>((dynamic value) => Category.fromJson(value))
          .toList(),
      brand: Brand.fromJson(getJsonValueAsJson(json, 'brand')),
      vendor: Vendor.fromJson(getJsonValueAsJson(json, 'vendor')),
      thumbImageHighres: getJsonValueAsString(json, 'thumb_image_highres'),
      thumbImageNormal: getJsonValueAsString(json, 'thumb_image_normal'),
      imageHighres: getJsonValueAsString(json, 'image_highres'),
      gtin14: getJsonValueAsString(json, 'gtin14'),
      languages: getJsonValueAsString(json, 'languages'),
      countries: getJsonValueAsString(json, 'countries'),
      pageCount: getJsonValueAsInt(json, 'page_count'),
      fileSize: getJsonValueAsString(json, 'file_size'),
    );
  }
}

class Offer {
  int id;
  String href;
  String title;
  String subTitle;
  int offerTypeId;
  bool isFree;
  String tierId;
  String tierCode;
  Price price;
  dynamic discount;

  Offer({
    required this.id,
    required this.href,
    required this.title,
    required this.subTitle,
    required this.offerTypeId,
    required this.isFree,
    required this.tierId,
    required this.tierCode,
    required this.price,
    required this.discount,
  });

  factory Offer.fromJson(Map<String, dynamic> json) {
    return Offer(
      id: getJsonValueAsInt(json, 'id'),
      href: getJsonValueAsString(json, 'href'),
      title: getJsonValueAsString(json, 'title'),
      subTitle: getJsonValueAsString(json, 'sub_title'),
      offerTypeId: getJsonValueAsInt(json, 'offer_type_id'),
      isFree: getJsonValueAsBool(json, 'is_free'),
      tierId: getJsonValueAsString(json, 'tier_id'),
      tierCode: getJsonValueAsString(json, 'tier_code'),
      price: Price.fromJson(getJsonValueAsJson(json, 'price')),
      discount: getJsonValue(json, 'discount'),
    );
  }
}

class Category {
  int id;
  String title;

  Category({
    required this.id,
    required this.title,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: getJsonValueAsInt(json, 'id'),
      title: getJsonValueAsString(json, 'title'),
    );
  }
}

class Brand {
  int id;
  String title;
  String href;
  String slug;

  Brand({
    required this.id,
    required this.title,
    required this.href,
    required this.slug,
  });

  factory Brand.fromJson(Map<String, dynamic> json) {
    return Brand(
      id: getJsonValueAsInt(json, 'id'),
      title: getJsonValueAsString(json, 'title'),
      href: getJsonValueAsString(json, 'href'),
      slug: getJsonValueAsString(json, 'slug'),
    );
  }
}

class Vendor {
  int id;
  String title;
  String href;
  String slug;

  Vendor({
    required this.id,
    required this.title,
    required this.href,
    required this.slug,
  });

  factory Vendor.fromJson(Map<String, dynamic> json) {
    return Vendor(
      id: getJsonValueAsInt(json, 'id'),
      title: getJsonValueAsString(json, 'title'),
      href: getJsonValueAsString(json, 'href'),
      slug: getJsonValueAsString(json, 'slug'),
    );
  }
}
