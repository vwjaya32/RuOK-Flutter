import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ruok/Tests/models/my_results.dart';

Future<List<MyResults>> fetchEvents() async {
  var url = Uri.parse('https://ruok.up.railway.app/mh_tests/json/');
  var response = await http.get(
    url,
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
    },
  );

  var data = jsonDecode(utf8.decode(response.bodyBytes));

  List<MyResults> eventsList = [];
  for (var d in data) {
    if (d != null) {
      eventsList.add(MyResults.fromJson(d));
    }
  }

  return eventsList;
}
