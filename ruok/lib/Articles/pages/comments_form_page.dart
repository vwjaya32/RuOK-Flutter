import 'package:flutter/material.dart';
import 'package:ruok/Articles/pages/articles_detail_page.dart';
import 'package:ruok/Articles/pages/articles_page.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class CommentsForm extends StatefulWidget {
  CommentsForm({
    Key? key,
    required this.article_id,
    required this.title,
    required this.author,
    required this.date,
    required this.content,
  }) : super(key: key);

  int article_id;
  String title;
  String author;
  DateTime date;
  String content;

  @override
  State<CommentsForm> createState() => _CommentsFormState();
}

class _CommentsFormState extends State<CommentsForm> {
  final _formKey = GlobalKey<FormState>();

  static const purple = Color(0xFF613FE5);
  static const black = Color(0xFF09050D);
  static const yellow = Color(0xFFFFCA0C);
  static const white = Color(0xFFFFFFFF);

  String author_fill = "";
  String comment_fill = "";

  // -------------- Post --------------
  Future<void> submit(BuildContext context, int artc_place) async {
    final response = await http.post(
        Uri.parse(
            'https://ruok.up.railway.app/articles/write-c-flutter/$artc_place'),
        headers: <String, String>{'Content-Type': 'application/json'},
        body: jsonEncode(<String, dynamic>{
          'author': author_fill,
          'content': comment_fill,
        }));
  }

  // -------------- Build --------------
  @override
  Widget build(BuildContext context) {
    FocusNode myFocusNode = FocusNode();
    int placing = widget.article_id;
    String artc_title = widget.title;
    String artc_author = widget.author;
    DateTime artc_date = widget.date;
    String artc_content = widget.content;

    return Scaffold(
      appBar: AppBar(
        title: Text('Write Comments'),
        backgroundColor: purple,
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                // -------------- Author --------------
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Strong Cat",
                      labelText: "Pseudonym",
                      labelStyle: TextStyle(
                          color: myFocusNode.hasFocus ? purple : black),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: const BorderSide(color: black, width: 1.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 3, color: yellow),
                      ),
                      icon: const Icon(
                        Icons.title_rounded,
                        color: black,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        author_fill = value!;
                      });
                    },
                    onSaved: (String? value) {
                      setState(() {
                        author_fill = value!;
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Please fill out this field.';
                      }
                      return null;
                    },
                  ),
                ),

                // -------------- Comment --------------
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Pretty good!",
                      labelText: "Comment",
                      labelStyle: TextStyle(
                          color: myFocusNode.hasFocus ? purple : black),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: const BorderSide(color: black, width: 1.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 3, color: yellow),
                      ),
                      icon: const Icon(
                        Icons.message_rounded,
                        color: black,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        comment_fill = value!;
                      });
                    },
                    onSaved: (String? value) {
                      setState(() {
                        comment_fill = value!;
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Please fill out this field.';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      // -------------- Floating Submit Button --------------
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: black,
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            submit(context, placing);
            showDialog(
              context: context,
              builder: (context) {
                return Dialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 15,
                  child: Container(
                    child: ListView(
                      padding: const EdgeInsets.only(top: 20, bottom: 20),
                      shrinkWrap: true,
                      children: <Widget>[
                        SizedBox(height: 20),
                        const Text(
                          'Successfully added comment!',
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 20),
                        TextButton(
                          // onPressed: () {
                          //   Navigator.pop(context);
                          // },
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyDetailPage(
                                        title: artc_title,
                                        author: artc_author,
                                        date: artc_date,
                                        content: artc_content,
                                        id: placing)));
                          },
                          child: Text('Back'),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
        label: Text("    Add Comment    "),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
