import 'package:flutter/material.dart';
import 'package:ruok/models/articles.dart';
import 'package:ruok/utils/drawer.dart';
import 'package:ruok/pages/articles_detail_page.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class MyArticlesPage extends StatefulWidget {
  const MyArticlesPage({super.key});

  @override
  State<MyArticlesPage> createState() => _MyArcticlesPageState();
}

class _MyArcticlesPageState extends State<MyArticlesPage> {
  // -----------------------------------
  // -------------- Fetch --------------
  Future<List<Articles>> fetchToDo() async {
    var url = Uri.parse('https://ruok.up.railway.app/articles/json-artc');
    var response = await http.get(
      url,
      headers: {
        "Access-Control-Allow-Origin": "*",
        "Content-Type": "application/json",
      },
    );

    // melakukan decode response menjadi bentuk Articles
    var data = jsonDecode(utf8.decode(response.bodyBytes));

    // melakukan konversi data json menjadi object Articles
    List<Articles> articlesList = [];
    for (var d in data) {
      if (d != null) {
        articlesList.add(Articles.fromJson(d));
      }
    }
    print(articlesList);

    return articlesList;
  }

  // -------------- Build --------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: RYOKDrawer(),
        appBar: AppBar(
          title: const Text('RYOK - Articles'),
        ),
        body: FutureBuilder(
            future: fetchToDo(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return const Center(child: CircularProgressIndicator());
              } else {
                if (!snapshot.hasData) {
                  return Column(
                    children: const [
                      Text(
                        "Tidak ada to do list :(",
                        style:
                            TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                      ),
                      SizedBox(height: 8),
                    ],
                  );
                } else {
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (_, index) => InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyDetailPage(
                                          title: snapshot
                                              .data![index].fields.title,
                                          author: snapshot
                                              .data![index].fields.author,
                                          date:
                                              snapshot.data![index].fields.date,
                                          content: snapshot
                                              .data![index].fields.content,
                                        )));
                          },
                          child: Container(
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
                                  "${snapshot.data![index].fields.title}",
                                  style: const TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text("${snapshot.data![index].fields.author}"),
                              ],
                            ),
                          )));
                }
              }
            }));
  }
}
