import 'package:flutter/material.dart';
import 'package:ruok/Articles/pages/comment_list_page.dart';
import 'package:ruok/Articles/pages/articles_page.dart';
import 'package:intl/intl.dart';

import 'package:http/http.dart' as http;

import 'package:ruok/drawer.dart';

import 'package:provider/provider.dart';
import 'package:ruok/providers/user_provider.dart';

class MyDetailPage extends StatefulWidget {
  const MyDetailPage({
    super.key,
    required this.title,
    required this.author,
    required this.date,
    required this.content,
    required this.id,
  });

  final String title;
  final String author;
  final DateTime date;
  final String content;
  final int id;

  @override
  State<MyDetailPage> createState() => _MyDetailPageState();
}

class _MyDetailPageState extends State<MyDetailPage> {
  static const purple = Color(0xFF613FE5);
  static const black = Color(0xFF09050D);
  static const yellow = Color(0xFFFFCA0C);
  static const red = Color(0xFFDE1C1C);

  // -------------- Delete --------------
  Future<void> delete(BuildContext context, int artc_id) async {
    final response = await http.post(
      Uri.parse(
          'https://ruok.up.railway.app/articles/delete-a-flutter/$artc_id'),
      headers: <String, String>{'Content-Type': 'application/json'},
    );
  }

  //
  // -------------- Build --------------
  @override
  Widget build(BuildContext context) {
    final user = context.watch<UserProvider>();

    int artc_id = widget.id;
    String artc_title = widget.title;
    String artc_author = widget.author;
    DateTime artc_date = widget.date;
    String artc_content = widget.content;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: black,
        title: const Text(
          'Details',
          style: TextStyle(fontFamily: "Roboto Slab"),
        ),
      ),
      drawer: RuokDrawer(),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // -------------- Title --------------
            Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: Text(
                widget.title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // -------------- Author & Date --------------
            Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: Text(
                widget.author +
                    " on " +
                    DateFormat('yyyy-MM-dd').format(widget.date),
                textAlign: TextAlign.center,
              ),
            ),
            // -------------- Content --------------
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.only(bottom: 60.0, top: 20.0),
                scrollDirection: Axis.vertical,
                child: Text(
                  widget.content,
                  textAlign: TextAlign.justify,
                ),
              ),
            ),
          ],
        ),
      ),
      // -------------- Floating Button --------------
      floatingActionButton: Padding(
        padding: const EdgeInsets.fromLTRB(35, 10, 10, 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                backgroundColor: purple,
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MyCommentsPage(
                            article_id: artc_id,
                            author: artc_author,
                            content: artc_content,
                            date: artc_date,
                            title: artc_title,
                          )),
                ),
                child: const Icon(Icons.message),
              ),
            ),
            Visibility(
                child: user.user.username == "admin"
                    ? Align(
                        alignment: Alignment.bottomRight,
                        child: FloatingActionButton(
                          backgroundColor: red,
                          onPressed: () {
                            delete(context, artc_id);
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const MyArticlesPage()),
                            );
                          },
                          child: const Icon(Icons.delete),
                        ),
                      )
                    : Text(""))
          ],
        ),
      ),
    );
  }
}
