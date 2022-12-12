import 'dart:convert';

List<EventItem> eventsFromJSON(String str) => List<EventItem>.from(
  json.decode(str).map((x) => EventItem.fromJson(x))
);

String eventsToJSON(List<EventItem> data) => 
  json.encode(List<dynamic>.from(data.map((x)=> x.toJson())));

class EventItem {
  EventItem({
    required this.model,
    required this.pk,
    required this.fields,
  });

  String model;
  int pk;
  Fields fields;

  factory EventItem.fromJson(Map<String, dynamic> json) => EventItem(
    model: json["model"], 
    pk: json["pk"], 
    fields: Fields.fromJson(json["fields"]),
    );

  Map<String, dynamic> toJson() => {
    "model":model,
    "pk": pk,
    "fields": fields.toJson(),
  };
}

class Fields{
  Fields({
    required this.name,
    required this.date, 
    required this.description,
    required this.attendees,
    required this.is_joined,
  });

  String name;
  DateTime date;
  String description;
  List attendees;
  bool is_joined;

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
    name: json['name'],
    date: DateTime.parse(json['date']),
    description: json['description'],
    attendees: json['attendees'],
    is_joined: json['is_joined']
    );

  Map<String, dynamic> toJson() => {
    "name": name,
    "date":"${date.year.toString().padLeft(4,'0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    "description":description,
    "attendees":attendees,
    "is_joined":is_joined,
  };
}
