// To parse this JSON data, do
//
//     final myResults = myResultsFromJson(jsonString);
import 'package:meta/meta.dart';
import 'dart:convert';

List<MyResults> myResultsFromJson(String str) =>
    List<MyResults>.from(json.decode(str).map((x) => MyResults.fromJson(x)));

String myResultsToJson(List<MyResults> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MyResults {
  MyResults({
    @required this.pk,
    @required this.fields,
  });

  int? pk;
  Fields? fields;

  factory MyResults.fromJson(Map<String, dynamic> json) => MyResults(
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
      );

  Map<String, dynamic> toJson() => {
        "pk": pk,
        "fields": fields?.toJson(),
      };
}

class Fields {
  Fields({
    @required this.user,
    @required this.score,
    @required this.date,
  });

  int? user;
  int? score;
  DateTime? date;

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        score: json["score"],
        date: DateTime.parse(json["date"]),
      );

  Map<String, dynamic> toJson() => {
        "user": user,
        "score": score,
        "date": date?.toIso8601String(),
      };
}
