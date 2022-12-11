import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:ruok/models/quotes_model.dart';

Future<List<Holder>> fetchWatchData() async {
  var url = Uri.parse('https://ruok.up.railway.app/quotes/get_image');
  var response = await http.get(
    url,
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
    },
  );

  // melakukan decode response menjadi bentuk json
  var datas = jsonDecode(utf8.decode(response.bodyBytes));


  // melakukan konversi data json menjadi object WatchList
  List<Holder> listWatchList = [];
  for (var data in datas) {
    if (data != null) {
      listWatchList.add(Holder.fromJson(data));
    }
  }

  return listWatchList;
}