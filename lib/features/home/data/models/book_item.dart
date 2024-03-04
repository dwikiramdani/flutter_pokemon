import 'package:flutter_pokemon/shared/helper/json_utils.dart';

class Item {
  Brand brand;
  List<Category> categories;
  List<String> countries;
  Map<String, dynamic> highlighting;
  int id;
  String title;
  String subtitle;
  String href;
  String type;
  String slug;
  bool isAgeRestricted;
  bool isActive;
  String status;
  List<Image> images;
  List<Offer> offers;
  List<String> languages;
  String gtin14;
  String releaseDate;
  Vendor vendor;

  Item({
    required this.brand,
    required this.categories,
    required this.countries,
    required this.highlighting,
    required this.id,
    required this.title,
    required this.subtitle,
    required this.href,
    required this.type,
    required this.slug,
    required this.isAgeRestricted,
    required this.isActive,
    required this.status,
    required this.images,
    required this.offers,
    required this.languages,
    required this.gtin14,
    required this.releaseDate,
    required this.vendor,
  });

  factory Item.fromJson(json) {
    print("RETURN JSON: $json");
    return Item(
      brand: Brand.fromJson(getJsonValueAsJson(json, 'brand')),
      categories: getJsonListValue(json, 'categories')
          .map<Category>((dynamic value) => Category.fromJson(value))
          .toList(),
      countries: getJsonValueAsStringList(json, 'countries'),
      highlighting: getJsonValueAsJson(json, 'highlighting'),
      id: getJsonValueAsInt(json, 'id'),
      title: getJsonValueAsString(json, 'title'),
      subtitle: getJsonValueAsString(json, 'subtitle'),
      href: getJsonValueAsString(json, 'href'),
      type: getJsonValueAsString(json, 'type'),
      slug: getJsonValueAsString(json, 'slug'),
      isAgeRestricted: getJsonValueAsBool(json, 'is_age_restricted'),
      isActive: getJsonValueAsBool(json, 'is_active'),
      status: getJsonValueAsString(json, 'status'),
      images: getJsonListValue(json, 'images')
          .map<Image>((dynamic value) => Image.fromJson(value))
          .toList(),
      offers: getJsonListValue(json, 'offers')
          .map<Offer>((dynamic value) => Offer.fromJson(value))
          .toList(),
      languages: getJsonValueAsStringList(json, 'languages'),
      gtin14: getJsonValueAsString(json, 'gtin14'),
      releaseDate: getJsonValueAsString(json, 'release_date'),
      vendor: Vendor.fromJson(
        getJsonValueAsJson(json, 'vendor'),
      ),
    );
  }
}

class Brand {
  String href;
  String slug;
  String title;

  Brand({
    required this.href,
    required this.slug,
    required this.title,
  });

  factory Brand.fromJson(Map<String, dynamic> json) {
    return Brand(
      href: getJsonValueAsString(json, 'href'),
      slug: getJsonValueAsString(json, 'slug'),
      title: getJsonValueAsString(json, 'title'),
    );
  }
}

class Category {
  String title;
  String href;

  Category({
    required this.title,
    required this.href,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      title: getJsonValueAsString(json, 'title'),
      href: getJsonValueAsString(json, 'href'),
    );
  }
}

class Image {
  String rel;
  String href;
  String title;

  Image({
    required this.rel,
    required this.href,
    required this.title,
  });

  factory Image.fromJson(Map<String, dynamic> json) {
    return Image(
      rel: getJsonValueAsString(json, 'rel'),
      href: getJsonValueAsString(json, 'href'),
      title: getJsonValueAsString(json, 'title'),
    );
  }
}

class Offer {
  String href;
  int id;
  String title;
  String type;
  Price price;

  Offer({
    required this.href,
    required this.id,
    required this.title,
    required this.type,
    required this.price,
  });

  factory Offer.fromJson(Map<String, dynamic> json) {
    return Offer(
      href: getJsonValueAsString(json, 'href'),
      id: getJsonValueAsInt(json, 'id'),
      title: getJsonValueAsString(json, 'title'),
      type: getJsonValueAsString(json, 'type'),
      price: Price.fromJson(getJsonValueAsJson(json, 'price')),
    );
  }
}

class Price {
  Idr idr;

  Price({
    required this.idr,
  });

  factory Price.fromJson(Map<String, dynamic> json) {
    return Price(idr: Idr.fromJson(getJsonValueAsJson(json, 'idr')));
  }
}

class Idr {
  int base;
  int net;

  Idr({
    required this.base,
    required this.net,
  });

  factory Idr.fromJson(Map<String, dynamic> json) {
    return Idr(
      base: getJsonValueAsInt(json, 'base'),
      net: getJsonValueAsInt(json, 'net'),
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
      title: getJsonValueAsString(json, 'title'),
      href: getJsonValueAsString(json, 'href'),
    );
  }
}
