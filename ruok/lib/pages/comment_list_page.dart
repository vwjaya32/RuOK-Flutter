import 'package:flutter/material.dart';
import 'package:ruok/utils/drawer.dart';
import 'package:ruok/models/comments.dart';

import 'package:http/http.dart' as http;

class MyCommentsPage extends StatefulWidget {
  const MyCommentsPage({
    super.key,
    required this.article_id,
  });

  final int article_id;

  @override
  State<MyCommentsPage> createState() => _MyCommentsPageState();
}

class _MyCommentsPageState extends State<MyCommentsPage> {
  @override
  Widget build(BuildContext context) {
    int id = widget.article_id;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Comments'),
      ),
      drawer: RYOKDrawer(),
      body: FutureBuilder(
        future: Comments.fetchComment(id.toString()),
        builder: (context, AsyncSnapshot snapshot) {
          // -------------- Comments --------------
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
                      BoxShadow(color: Colors.blue, blurRadius: 3.0)
                    ],
                  ),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${snapshot.data![index].fields.author} | ${snapshot.data![index].fields.date}",
                          style: const TextStyle(
                            fontSize: 13.0,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "${snapshot.data![index].fields.content}",
                          style: const TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        const SizedBox(height: 10),
                      ]),
                ),
              );
            }
          }
        },
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
          ],
        ),
      ),
    );
  }
}
