class Metadata {
  List<Facet> facets;
  Resultset resultset;
  List<SpellingSuggestion> spellingSuggestions;

  Metadata({
    required this.facets,
    required this.resultset,
    required this.spellingSuggestions,
  });

  factory Metadata.fromJson(Map<String, dynamic> json) {
    return Metadata(
      facets: List<Facet>.from(json['facets'].map((facet) => Facet.fromJson(facet))),
      resultset: Resultset.fromJson(json['resultset']),
      spellingSuggestions: List<SpellingSuggestion>.from(
        json['spelling_suggestions'].map((suggestion) => SpellingSuggestion.fromJson(suggestion)),
      ),
    );
  }
}

class Facet {
  String fieldName;
  List<Value> values;

  Facet({
    required this.fieldName,
    required this.values,
  });

  factory Facet.fromJson(Map<String, dynamic> json) {
    return Facet(
      fieldName: json['field_name'],
      values: List<Value>.from(json['values'].map((value) => Value.fromJson(value))),
    );
  }
}

class Value {
  String value;
  int count;

  Value({
    required this.value,
    required this.count,
  });

  factory Value.fromJson(Map<String, dynamic> json) {
    return Value(
      value: json['value'],
      count: json['count'],
    );
  }
}

class Resultset {
  int count;
  int limit;
  int offset;

  Resultset({
    required this.count,
    required this.limit,
    required this.offset,
  });

  factory Resultset.fromJson(Map<String, dynamic> json) {
    return Resultset(
      count: json['count'],
      limit: json['limit'],
      offset: json['offset'],
    );
  }
}

class SpellingSuggestion {
  String value;
  int count;

  SpellingSuggestion({
    required this.value,
    required this.count,
  });

  factory SpellingSuggestion.fromJson(Map<String, dynamic> json) {
    return SpellingSuggestion(
      value: json['value'],
      count: json['count'],
    );
  }
}
