// To parse this JSON data, do
//
// final comments = commentsFromJson(jsonString);

import 'dart:convert';
import 'package:http/http.dart' as http;

List<Comments> commentsFromJson(String str) =>
    List<Comments>.from(json.decode(str).map((x) => Comments.fromJson(x)));

String commentsToJson(List<Comments> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Comments {
  Comments({
    required this.model,
    required this.pk,
    required this.fields,
  });

  String model;
  int pk;
  Fields fields;

  factory Comments.fromJson(Map<String, dynamic> json) => Comments(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
      );

  Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
      };

  // -------------- Fetch --------------
  static Future<List<Comments>> fetchComment(String ArtcID) async {
    var url =
        Uri.parse('https://ruok.up.railway.app/articles/json-cmts/' + ArtcID);
    var response = await http.get(
      url,
      headers: {
        // "Access-Control-Allow-Origin": "*",
        "Content-Type": "application/json",
      },
    );

    // melakukan decode response menjadi bentuk Articles
    var data = jsonDecode(utf8.decode(response.bodyBytes));

    // melakukan konversi data json menjadi object Articles
    List<Comments> commentList = [];
    for (var d in data) {
      if (d != null) {
        commentList.add(Comments.fromJson(d));
      }
    }

    return commentList;
  }
}

class Fields {
  Fields({
    required this.author,
    required this.artcPlace,
    required this.content,
    required this.date,
  });

  String author;
  int artcPlace;
  String content;
  DateTime date;

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        author: json["author"],
        artcPlace: json["artc_place"],
        content: json["content"],
        date: DateTime.parse(json["date"]),
      );

  Map<String, dynamic> toJson() => {
        "author": author,
        "artc_place": artcPlace,
        "content": content,
        "date": date.toIso8601String(),
      };
}
