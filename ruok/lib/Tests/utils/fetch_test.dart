import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ruok/Tests/models/my_results.dart';
import 'package:ruok/drawer.dart';
import 'package:ruok/Tests/pages/mh_tests.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:ruok/providers/user_provider.dart';
import 'package:ruok/Auth/models/user_model.dart';

class FetchRestsPage extends StatefulWidget {
  const FetchRestsPage({Key? key}) : super(key: key);

  @override
  _FetchRestsPageState createState() => _FetchRestsPageState();
}

class _FetchRestsPageState extends State<FetchRestsPage> {
  Future<List<MyResults>> fetchTests() async {
    var url = Uri.parse('https://ruok.up.railway.app/mh_tests/json/');
    var response = await http.get(
      url,
      headers: {
        "Access-Control-Allow-Origin": "*",
        "Content-Type": "application/json",
      },
    );

    var data = jsonDecode(utf8.decode(response.bodyBytes));

    List<MyResults> resultsList = [];
    for (var d in data) {
      if (d != null) {
        resultsList.add(MyResults.fromJson(d));
      }
    }

    return resultsList;
  }

  @override
  Widget build(BuildContext context) {
    final user = context.watch<UserProvider>();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF613FE5),
          title: const Text(
            'Past Test Results',
            style: TextStyle(fontFamily: "Roboto Slab"),
          ),
        ),
        drawer: const RuokDrawer(),
        body: FutureBuilder(
            future: fetchTests(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                if (user.user.username == 'guest') {
                  return Column(
                    children: const [
                      SizedBox(height: 35),
                      Text(
                        "Login today to save your results, and get many more benefits!",
                        style: TextStyle(
                            color: Color(0xFF613FE5),
                            fontSize: 20,
                            fontFamily: "Roboto Slab"),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 8),
                    ],
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              } else {
                if (!snapshot.hasData) {
                  return Column(
                    children: const [
                      Text(
                        "Tidak ada data progres :(",
                        style:
                            TextStyle(color: Color(0xFF613FE5), fontSize: 20),
                      ),
                      SizedBox(height: 8),
                    ],
                  );
                } else {
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (_, index) => Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                            padding: const EdgeInsets.all(20.0),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15.0),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.black, blurRadius: 2.0)
                                ]),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${snapshot.data![index].score}",
                                  style: const TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text("${snapshot.data![index].user}"),
                                Text("${snapshot.data![index].date}"),
                              ],
                            ),
                          ));
                }
              }
            }));
  }
}
