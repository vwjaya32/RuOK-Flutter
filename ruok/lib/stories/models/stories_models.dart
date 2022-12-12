// To parse this JSON data, do
//
//     final myForum = myForumFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<MyForum> myForumFromJson(String str) =>
    List<MyForum>.from(json.decode(str).map((x) => MyForum.fromJson(x)));

String myForumToJson(List<MyForum> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MyForum {
  MyForum({
    @required this.model,
    @required this.pk,
    @required this.fields,
  });

  Model? model;
  int? pk;
  Fields? fields;

  factory MyForum.fromJson(Map<String, dynamic> json) => MyForum(
        model: modelValues.map[json["model"]],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
      );

  Map<String, dynamic> toJson() => {
        "model": modelValues.reverse[model],
        "pk": pk,
        "fields": fields?.toJson(),
      };
}

class Fields {
  Fields({
    @required this.author,
    @required this.title,
    @required this.dateTime,
    @required this.content,
  });

  String? author;
  String? title;
  DateTime? dateTime;
  String? content;

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        author: json["author"],
        title: json["title"],
        dateTime: DateTime.parse(json["date_time"]),
        content: json["content"],
      );

  Map<String, dynamic> toJson() => {
        "author": author,
        "title": title,
        "date_time": dateTime?.toIso8601String(),
        "content": content,
      };
}

enum Model { FORUM_POSTS }

final modelValues = EnumValues({"forum.posts": Model.FORUM_POSTS});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap!;
  }
}
