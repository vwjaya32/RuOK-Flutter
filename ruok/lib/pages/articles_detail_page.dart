import 'package:flutter/material.dart';
import 'package:ruok/models/comments.dart';
import 'package:ruok/pages/comment_list_page.dart';
import 'package:ruok/utils/drawer.dart';
import 'package:intl/intl.dart';

import 'package:http/http.dart' as http;

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
  @override
  Widget build(BuildContext context) {
    int artc_id = widget.id;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
      ),
      drawer: RYOKDrawer(),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
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
            Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: Text(
                widget.author +
                    " on " +
                    DateFormat('yyyy-MM-dd').format(widget.date),
                textAlign: TextAlign.center,
                // style: const TextStyle(
                //   fontSize: 24.0,
                //   fontWeight: FontWeight.bold,
                // ),
              ),
            ),
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
      floatingActionButton: Padding(
        padding: const EdgeInsets.fromLTRB(35, 0, 0, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Icon(Icons.keyboard_double_arrow_left),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          MyCommentsPage(article_id: artc_id)),
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
