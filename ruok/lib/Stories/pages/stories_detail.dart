import 'package:ruok/Stories/models/replies_models.dart';
import 'package:ruok/Stories/models/stories_fetch.dart';
import 'package:ruok/Stories/models/replies_fetch.dart';
import 'package:ruok/Stories/pages/replies_detail.dart';
import 'package:ruok/Stories/pages/replies_post.dart';
import 'package:ruok/Stories/models/stories_models.dart';
import 'package:ruok/drawer.dart';
import 'package:flutter/material.dart';

class MyForumDetail extends StatelessWidget {
  const MyForumDetail({super.key, required this.MyForum});
  static const purple = Color(0xFF613FE5);
  static const black = Color(0xFF09050D);
  static const yellow = Color(0xFFFFCA0C);
  static const red = Color(0xFFDE1C1C);
  final MyForum;

  @override
  Widget build(BuildContext context) {
    int stories_id = MyForum.pk;
    String stories_title = MyForum.fields.title;
    String stories_author = MyForum.fields.author.toString();
    String stories_date = MyForum.fields.dateTime.toString().substring(0, 16);
    String stories_content = MyForum.fields.content;

    return Scaffold(
      backgroundColor: black,
      appBar: AppBar(
        backgroundColor: purple,
        title: const Text('DETAILS STORIES',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            )),
      ),
      drawer: RuokDrawer(),
      body: SingleChildScrollView(
        child: Stack(children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(255, 255, 255, 255).withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(stories_title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    )),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  stories_author,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  stories_date,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Text(
                  stories_content,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MyReplyPage(stories_id: stories_id)),
              );
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 300),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 255, 255, 255).withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
                borderRadius: BorderRadius.circular(20),
                color: purple,
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextButton(
                      style: TextButton.styleFrom(
                          padding: const EdgeInsets.all(15.0),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          alignment: Alignment.center),
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MyReplyPage(
                                  stories_id: stories_id,
                                )),
                      ),
                      child: const Text('SHOW REPLIES',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                  ]),
            ),
          ),
        ]),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.fromLTRB(35, 10, 10, 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                backgroundColor: purple,
                onPressed: () => Navigator.pop(context),
                child: const Icon(Icons.arrow_back),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                backgroundColor: purple,
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyRepliesFormPage()),
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
