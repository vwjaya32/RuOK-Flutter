import 'dart:convert';
import 'package:ruok/Events/models/com_events.dart';
import 'package:http/http.dart' as http;

Future<List<EventItem>> fetchEvents() async {
    var url = Uri.parse('https://ruok.up.railway.app/com_events/json_mobile/');
    var response = await http.get(
      url,
      headers: {
        "Access-Control-Allow-Origin": "*",
        "Content-Type": "application/json",
      },
    );

    var data = jsonDecode(utf8.decode(response.bodyBytes));

    List<EventItem> eventsList = [];
    for (var d in data) {
      if (d != null) {
        eventsList.add(EventItem.fromJson(d));
      }
    }

    return eventsList;
  }