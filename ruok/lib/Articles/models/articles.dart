// To parse this JSON data, do
// final articles = articlesFromJson(jsonString);

import 'dart:convert';
import 'package:http/http.dart' as http;

List<Articles> articlesFromJson(String str) =>
    List<Articles>.from(json.decode(str).map((x) => Articles.fromJson(x)));

String articlesToJson(List<Articles> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// ================== MODEL ==================
class Articles {
  Articles({
    required this.model,
    required this.pk,
    required this.fields,
  });

  String model;
  int pk;
  Fields fields;

  factory Articles.fromJson(Map<String, dynamic> json) => Articles(
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
  static Future<List<Articles>> fetchArticles() async {
    var url = Uri.parse('https://ruok.up.railway.app/articles/json-artc');
    var response = await http.get(
      url,
      headers: {
        "Access-Control-Allow-Origin": "*",
        "Content-Type": "application/json",
      },
    );

    var data = jsonDecode(utf8.decode(response.bodyBytes));

    List<Articles> articlesList = [];
    for (var d in data) {
      if (d != null) {
        articlesList.add(Articles.fromJson(d));
      }
    }

    return articlesList;
  }
}

// ================== CHILD MODEL ==================
class Fields {
  Fields({
    required this.author,
    required this.title,
    required this.date,
    required this.content,
  });

  String author;
  String title;
  DateTime date;
  String content;

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        author: json["author"],
        title: json["title"],
        date: DateTime.parse(json["date"]),
        content: json["content"],
      );

  Map<String, dynamic> toJson() => {
        "author": author,
        "title": title,
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "content": content,
      };
}
