// To parse this JSON data, do
//
//     final myReplies = myRepliesFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<MyReplies> myRepliesFromJson(String str) =>
    List<MyReplies>.from(json.decode(str).map((x) => MyReplies.fromJson(x)));

String myRepliesToJson(List<MyReplies> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MyReplies {
  MyReplies({
    @required this.model,
    @required this.pk,
    @required this.fields,
  });

  String? model;
  int? pk;
  Fields? fields;

  factory MyReplies.fromJson(Map<String, dynamic> json) => MyReplies(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
      );

  Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields?.toJson(),
      };
}

class Fields {
  Fields({
    @required this.author,
    @required this.postsIndex,
    @required this.content,
    @required this.date,
  });

  String? author;
  int? postsIndex;
  String? content;
  DateTime? date;

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        author: json["author"],
        postsIndex: json["posts_index"],
        content: json["content"],
        date: DateTime.parse(json["date"]),
      );

  Map<String, dynamic> toJson() => {
        "author": author,
        "posts_index": postsIndex,
        "content": content,
        "date": date?.toIso8601String(),
      };
}
