import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:ruok/Quotes/models/quotes_model.dart';

Future<List<Holder>> fetchQuotes() async {
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
  List<Holder> listQuotes = [];
  for(var data in datas["data"]) {
    if (data != null) {
      listQuotes.add(Holder.fromJson(data));
    }
  }

  return listQuotes;
}