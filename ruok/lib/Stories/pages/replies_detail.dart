import 'package:ruok/Stories/models/replies_models.dart';
import 'package:ruok/Stories/models/stories_fetch.dart';
import 'package:ruok/Stories/pages/stories_post.dart';
import 'package:ruok/Stories/pages/replies_post.dart';
import 'package:ruok/Stories/pages/stories_detail.dart';
import 'package:ruok/Stories/models/replies_fetch.dart';
import 'package:ruok/Stories/models/stories_models.dart';
import 'package:ruok/drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ruok/providers/user_provider.dart';

class MyReplyPage extends StatefulWidget {
  MyReplyPage({
    Key? key,
    required this.stories_id,
  }) : super(key: key);

  int stories_id;

  @override
  State<MyReplyPage> createState() => _MyReplyState();
}

class _MyReplyState extends State<MyReplyPage> {
  static const purple = Color(0xFF613FE5);
  static const black = Color(0xFF09050D);
  static const yellow = Color(0xFFFFCA0C);
  static const red = Color(0xFFDE1C1C);

  @override
  Widget build(BuildContext context) {
    final user = context.watch<UserProvider>();

    return Scaffold(
      backgroundColor: black,
      appBar: AppBar(
        backgroundColor: purple,
        title: const Text('Stories',
            style: TextStyle(
              fontFamily: "Roboto Slab",
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            )),
      ),
      drawer: RuokDrawer(),
      body: FutureBuilder(
        future: fetchMyReplies(widget.stories_id),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (!snapshot.hasData) {
              return Column(
                children: const [
                  Text(
                    "Tidak Ada Replies",
                    style: TextStyle(color: Colors.deepPurple, fontSize: 20),
                  ),
                  SizedBox(height: 8),
                ],
              );
            } else {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (_, i) => Column(
                        children: [
                          const SizedBox(height: 8),
                          Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 8),
                            padding: const EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15.0),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.black, blurRadius: 2.0)
                                ]),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      "${snapshot.data![i].fields.author}",
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "${snapshot.data![i].fields.content}",
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontSize: 13.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ));
            }
          }
        },
      ),
      floatingActionButton: Visibility(
          child: user.user.username != 'guest'
              ? Padding(
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
                            MaterialPageRoute(
                                builder: (context) => MyRepliesFormPage()),
                          ),
                          child: const Icon(Icons.message),
                        ),
                      ),
                    ],
                  ),
                )
              : const SizedBox(
                  height: 0,
                )),
    );
  }
}
