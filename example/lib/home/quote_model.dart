class QuoteModel {
  QuoteModel({
    int? id,
    String? quote,
    String? author,
  }) {
    _id = id;
    _quote = quote;
    _author = author;
  }

  QuoteModel.fromJson(dynamic json) {
    _id = json['id'];
    _quote = json['quote'];
    _author = json['author'];
  }

  int? _id;
  String? _quote;
  String? _author;

  int get id => _id ?? 0;

  String get quote => _quote ?? '';

  String get author => _author ?? '';

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['quote'] = _quote;
    map['author'] = _author;
    return map;
  }
}
