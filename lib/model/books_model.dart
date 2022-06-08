// To parse this JSON data, do
//
//     final booksModel = booksModelFromJson(jsonString);

// ignore_for_file: constant_identifier_names

import 'dart:convert';

List<BooksModel> booksModelFromJson(String str) =>
    List<BooksModel>.from(json.decode(str).map((x) => BooksModel.fromJson(x)));

String booksModelToJson(List<BooksModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BooksModel {
  BooksModel({
    this.abbrev,
    this.author,
    this.chapters,
    this.group,
    this.name,
    this.testament,
  });
  Abbrev? abbrev;
  String? author;
  int? chapters;
  String? group;
  String? name;
  Testament? testament;

  factory BooksModel.fromJson(Map<String, dynamic> json) => BooksModel(
        abbrev: Abbrev.fromJson(json["abbrev"]),
        author: json["author"],
        chapters: json["chapters"],
        group: json["group"],
        name: json["name"],
        testament: testamentValues.map[json["testament"]],
      );

  Map<String, dynamic> toJson() => {
        "abbrev": abbrev?.toJson(),
        "author": author,
        "chapters": chapters,
        "group": group,
        "name": name,
        "testament": testamentValues.reverse[testament],
      };
}

class Abbrev {
  Abbrev({
    this.pt,
    this.en,
  });

  String? pt;
  String? en;

  factory Abbrev.fromJson(Map<String, dynamic> json) => Abbrev(
        pt: json["pt"],
        en: json["en"],
      );

  Map<String, dynamic> toJson() => {
        "pt": pt,
        "en": en,
      };
}

enum Testament { VT, NT }

final testamentValues = EnumValues({"NT": Testament.NT, "VT": Testament.VT});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap;
    return reverseMap;
  }
}
