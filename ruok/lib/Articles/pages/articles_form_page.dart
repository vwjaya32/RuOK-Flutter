import 'package:flutter/material.dart';

import 'package:ruok/Articles/pages/articles_page.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class ArticlesForm extends StatefulWidget {
  ArticlesForm({Key? key}) : super(key: key);

  @override
  State<ArticlesForm> createState() => _ArticlesFormState();
}

class _ArticlesFormState extends State<ArticlesForm> {
  final _formKey = GlobalKey<FormState>();
  static const purple = Color(0xFF613FE5);
  static const black = Color(0xFF09050D);
  static const yellow = Color(0xFFFFCA0C);
  static const white = Color(0xFFFFFFFF);

  String author_fill = "";
  String title_fill = "";
  String content_fill = "";

  // -------------- Post --------------
  Future<void> submit(BuildContext context) async {
    final response = await http.post(
        Uri.parse('https://ruok.up.railway.app/articles/write-a-flutter'),
        headers: <String, String>{'Content-Type': 'application/json'},
        body: jsonEncode(<String, dynamic>{
          'author': author_fill,
          'title': title_fill,
          'content': content_fill,
        }));
  }

  // -------------- Build --------------
  @override
  Widget build(BuildContext context) {
    FocusNode myFocusNode = FocusNode();

    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: purple,
        title: Text('Write Articles'),
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
                    cursorColor: white,
                    decoration: InputDecoration(
                      hintText: "Little Rabbit",
                      labelText: "Author",
                      labelStyle: TextStyle(
                          color: myFocusNode.hasFocus ? purple : black),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: const BorderSide(color: black, width: 1.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 3, color: yellow),
                      ),
                      icon: const Icon(
                        Icons.cruelty_free,
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

                // -------------- Title --------------
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Rabbit\'s Mental Health",
                      labelText: "Title",
                      labelStyle: TextStyle(
                          color: myFocusNode.hasFocus ? purple : black),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: const BorderSide(color: black, width: 1.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 3, color: yellow),
                      ),
                      icon: const Icon(Icons.title_rounded, color: black),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        title_fill = value!;
                      });
                    },
                    onSaved: (String? value) {
                      setState(() {
                        title_fill = value!;
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

                // -------------- Content --------------
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Incredible!",
                      labelText: "Content",
                      labelStyle: TextStyle(
                          color: myFocusNode.hasFocus ? purple : black),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: const BorderSide(color: black, width: 1.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 3, color: yellow),
                      ),
                      icon: const Icon(Icons.message_rounded, color: black),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        content_fill = value!;
                      });
                    },
                    onSaved: (String? value) {
                      setState(() {
                        content_fill = value!;
                      });
                    },
                    // Validator sebagai validasi form
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
            submit(context);
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
                          'Thanks! You just create an article for the world.',
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 20),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyArticlesPage()));
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
        label: Text("    Post Article    "),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
