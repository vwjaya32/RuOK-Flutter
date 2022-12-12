import 'dart:convert';

List<Holder> quotesFromJson(String str) => List<Holder>.from(json.decode(str).map((x) => Holder.fromJson(x)));

String quotesToJson(List<Holder> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// Object untuk data dari json
class Holder {
  Holder({
    required this.pk,
    required this.fields,
  });

  int pk;
  Quotes fields;

  factory Holder.fromJson(Map<String, dynamic> json) => Holder(
    pk: json["pk"],
    fields: Quotes.fromJson(json["fields"]),
  );

  Map<String, dynamic> toJson() => {
    "pk": pk,
    "fields": fields.toJson(),
  };
}

// Object untuk data di dalam fields
class Quotes {
  Quotes ({
    required this.title,
    required this.image,
    required this.user,
  });

  String title;
  String image;
  String user;

  factory Quotes.fromJson(Map<String, dynamic> json) => Quotes(
    title: json["title"],
    image: json["image"],
    user: json["user"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "image": image,
    "user": user,
  };
}



