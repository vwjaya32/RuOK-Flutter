import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ruok/models/comments.dart';
import 'package:ruok/pages/comments_form_page.dart';

import 'package:http/http.dart' as http;

class MyCommentsPage extends StatefulWidget {
  const MyCommentsPage({
    super.key,
    required this.article_id,
    required this.title,
    required this.author,
    required this.date,
    required this.content,
  });

  final int article_id;

  final String title;
  final String author;
  final DateTime date;
  final String content;

  @override
  State<MyCommentsPage> createState() => _MyCommentsPageState();
}

class _MyCommentsPageState extends State<MyCommentsPage> {
  static const purple = Color(0xFF613FE5);
  static const black = Color(0xFF09050D);
  static const yellow = Color(0xFFFFCA0C);
  static const red = Color(0xFFDE1C1C);

  int artc_place_fill = 0;
  int comment_id_fill = 0;

  // -------------- Delete --------------
  Future<void> delete(
      BuildContext context, int artc_place, int comment_id) async {
    final response = await http.post(
      Uri.parse(
          'https://ruok.up.railway.app/articles/delete-c-flutter/$artc_place/$comment_id'),
      headers: <String, String>{'Content-Type': 'application/json'},
    );
  }

  //
  // -------------- Build --------------
  @override
  Widget build(BuildContext context) {
    int artc_id = widget.article_id;
    String artc_title = widget.title;
    String artc_author = widget.author;
    DateTime artc_date = widget.date;
    String artc_content = widget.content;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: black,
        title: const Text('Comments'),
      ),
      body: FutureBuilder(
        future: Comments.fetchComment(artc_id.toString()),
        builder: (context, AsyncSnapshot snapshot) {
          //
          // -------------- Show Comments --------------
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (!snapshot.hasData) {
              return Column(
                children: const [
                  Text(
                    "There's no comment yet",
                    style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0), fontSize: 20),
                  ),
                  SizedBox(height: 10),
                ],
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) => Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(17.0),
                    boxShadow: const [
                      BoxShadow(color: purple, blurRadius: 3.0)
                    ],
                  ),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${snapshot.data![index].fields.author}",
                          style: const TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "${snapshot.data![index].fields.content}  (${DateFormat('yyyy-MM-dd').format(snapshot.data![index].fields.date)})",
                          style: const TextStyle(
                            fontSize: 13.0,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 10),
                        // -------------- Delete Button --------------
                        TextButton(
                          child: const Text(
                            "Delete",
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(red),
                          ),
                          onPressed: () {
                            delete(context, artc_id, snapshot.data![index].pk);
                            setState(() {});
                          },
                        )
                      ]),
                ),
              );
            }
          }
        },
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
                backgroundColor: yellow,
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CommentsForm(
                            article_id: artc_id,
                            author: artc_author,
                            content: artc_content,
                            date: artc_date,
                            title: artc_title,
                          )),
                ),
                child: const Icon(Icons.add_circle_outline),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
