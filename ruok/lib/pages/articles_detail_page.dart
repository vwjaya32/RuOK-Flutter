import 'package:flutter/material.dart';
import 'package:ruok/models/comments.dart';
import 'package:ruok/pages/comment_list_page.dart';
import 'package:intl/intl.dart';
import 'package:ruok/utils/drawer.dart';

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
  //
  // -------------- Build --------------
  @override
  Widget build(BuildContext context) {
    int artc_id = widget.id;
    String artc_title = widget.title;
    String artc_author = widget.author;
    DateTime artc_date = widget.date;
    String artc_content = widget.content;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: black,
        title: const Text('Details'),
      ),
      drawer: RYOKDrawer(),
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
                padding: EdgeInsets.only(bottom: 60.0),
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
          ],
        ),
      ),
    );
  }
}
