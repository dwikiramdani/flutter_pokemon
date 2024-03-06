class OwnedItem {
  List<String> authorName;
  int currentlyAvailable;
  String fileSize;
  String coverImage;
  int id;
  String title;

  OwnedItem({
    required this.authorName,
    required this.currentlyAvailable,
    required this.fileSize,
    required this.coverImage,
    required this.id,
    required this.title,
  });

  factory OwnedItem.fromJson(Map<String, dynamic> json) {
    return OwnedItem(
      authorName: List<String>.from(json['author_name']),
      currentlyAvailable: json['currently_available'],
      fileSize: json['file_size'],
      coverImage: json['cover_image'],
      id: json['id'],
      title: json['title'],
    );
  }
}

class OwnedItemMetadata {
  List<OwnedItemFacet> facets;
  OwnedItemResultset resultset;

  OwnedItemMetadata({
    required this.facets,
    required this.resultset,
  });

  factory OwnedItemMetadata.fromJson(Map<String, dynamic> json) {
    return OwnedItemMetadata(
      facets: List<OwnedItemFacet>.from(json['facets'].map((facet) => OwnedItemFacet.fromJson(facet))),
      resultset: OwnedItemResultset.fromJson(json['resultset']),
    );
  }
}

class OwnedItemFacet {
  String fieldName;
  List<OwnedItemFacetValue> values;

  OwnedItemFacet({
    required this.fieldName,
    required this.values,
  });

  factory OwnedItemFacet.fromJson(Map<String, dynamic> json) {
    return OwnedItemFacet(
      fieldName: json['field_name'],
      values: List<OwnedItemFacetValue>.from(json['values'].map((value) => OwnedItemFacetValue.fromJson(value))),
    );
  }
}

class OwnedItemFacetValue {
  String value;
  int count;

  OwnedItemFacetValue({
    required this.value,
    required this.count,
  });

  factory OwnedItemFacetValue.fromJson(Map<String, dynamic> json) {
    return OwnedItemFacetValue(
      value: json['value'],
      count: json['count'],
    );
  }
}

class OwnedItemResultset {
  int count;
  int limit;
  int offset;

  OwnedItemResultset({
    required this.count,
    required this.limit,
    required this.offset,
  });

  factory OwnedItemResultset.fromJson(Map<String, dynamic> json) {
    return OwnedItemResultset(
      count: json['count'],
      limit: json['limit'],
      offset: json['offset'],
    );
  }
}
