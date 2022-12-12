import 'dart:convert';
import 'package:ruok/stories/models/replies_models.dart';
import 'package:http/http.dart' as http;

List<MyReplies> listMyRepliesTotal = [];

Future<List<MyReplies>> fetchMyReplies(int id) async {
  var url =
      Uri.parse('https://ruok.up.railway.app/forum/get-replies-flutter/$id');
  var response = await http.get(
    url,
  );

  var data = jsonDecode(utf8.decode(response.bodyBytes));
  List<MyReplies> listMyReplies = [];
  for (var d in data) {
    if (d != null) {
      listMyReplies.add(MyReplies.fromJson(d));
      listMyRepliesTotal.add(MyReplies.fromJson(d));
    }
  }
  return listMyReplies;
}
