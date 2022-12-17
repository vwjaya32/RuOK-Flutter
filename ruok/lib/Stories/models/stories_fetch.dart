import 'dart:convert';
import 'package:ruok/Stories/models/stories_models.dart';
import 'package:http/http.dart' as http;

List<MyForum> listMyForumTotal = [];

Future<List<MyForum>> fetchMyForum() async {
  var url = Uri.parse('https://ruok.up.railway.app/forum/get-forum-flutter/');
  var response = await http.get(
    url,
  );

  var data = jsonDecode(utf8.decode(response.bodyBytes));
  List<MyForum> listMyForum = [];
  for (var d in data) {
    if (d != null) {
      listMyForum.add(MyForum.fromJson(d));
      listMyForumTotal.add(MyForum.fromJson(d));
    }
  }
  return listMyForum;
}
