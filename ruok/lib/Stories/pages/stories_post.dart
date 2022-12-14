import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ruok/drawer.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MyForumFormPage extends StatefulWidget {
  const MyForumFormPage({super.key});

  @override
  State<MyForumFormPage> createState() => _ForumAddContentPageState();
}

class ForumContent {
  late String author;
  late String title;
  late String dateTime;
  late String content;

  ForumContent({
    required this.author,
    required this.title,
    required this.dateTime,
    required this.content,
  });
}

class _ForumAddContentPageState extends State<MyForumFormPage> {
  final _formKey = GlobalKey<FormState>();
  static const purple = Color(0xFF613FE5);
  static const black = Color(0xFF09050D);
  static const yellow = Color(0xFFFFCA0C);
  static const red = Color(0xFFDE1C1C);
  String? _title;
  String? _author;
  String? _dateTime;
  String? _content;

  Future<ForumContent>? _futureAlbum;
  final TextEditingController _in = TextEditingController();
  final TextEditingController _in2 = TextEditingController();
  final TextEditingController _in3 = TextEditingController();
  final TextEditingController _in4 = TextEditingController();

  void submit(
      String author, String title, String dateTime, String content) async {
    var url = Uri.parse('https://ruok.up.railway.app/forum/add-forum-flutter/');

    var map = <String, dynamic>{};

    map["author"] = (author);
    map["title"] = (title);
    map["date_time"] = (dateTime);
    map["content"] = (content);

    var response = await http.post(url, body: map);
    print(response.body);
    onPressed(BuildContext context) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Data sedang diproses. Mohon tunggu...')));
    }
  }

  @override
  Widget build(BuildContext context) {
    _dateTime = DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.now());
    return Scaffold(
      backgroundColor: black,
      appBar: AppBar(
        backgroundColor: purple,
        title: const Text(
          'ADD STORIES',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      drawer: RuokDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(255, 255, 255, 255).withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
              borderRadius: BorderRadius.circular(20),
              color: Color.fromARGB(255, 255, 255, 255),
            ),
            child: Column(
              children: [
                Padding(
                  // Menggunakan padding sebesar 8 pixels
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _in,
                    decoration: InputDecoration(
                      hintText: "Misalkan: SiGanteng",
                      labelText: "Siapa kamu?",
                      // Menambahkan icon agar lebih intuitif
                      icon: const Icon(Icons.person),
                      // Menambahkan circular border agar lebih rapi
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    // Menambahkan behavior saat nama diketik
                    onChanged: (String? value) {
                      setState(() {
                        _author = value!;
                      });
                    },
                    onSaved: (String? value) {
                      setState(() {
                        _author = value!;
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Author Stories Masih Kosong!';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  // Menggunakan padding sebesar 8 pixels
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _in2,
                    decoration: InputDecoration(
                      hintText: "Misalkan: Mau curhat nih!",
                      labelText: "Judul Stories",
                      // Menambahkan icon agar lebih intuitif
                      icon: const Icon(Icons.star),

                      // Menambahkan circular border agar lebih rapi
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    // Menambahkan behavior saat nama diketik
                    onChanged: (String? author) {
                      setState(() {
                        _title = author!;
                      });
                    },
                    onSaved: (String? author) {
                      setState(() {
                        _title = author!;
                      });
                    },
                    validator: (String? author) {
                      if (author == null || author.isEmpty) {
                        return 'Judul Stories Masih Kosong!';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  // Menggunakan padding sebesar 8 pixels
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _in4,
                    decoration: InputDecoration(
                      hintText: "Misalkan: Hari ini, aku ketemu...",
                      labelText: "Isinya apa sih?",
                      // Menambahkan icon agar lebih intuitif
                      icon: const Icon(Icons.food_bank),
                      // Menambahkan circular border agar lebih rapi
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    // Menambahkan behavior saat nama diketik
                    onChanged: (String? value) {
                      setState(() {
                        _content = value!;
                      });
                    },
                    onSaved: (String? value) {
                      setState(() {
                        _content = value!;
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Konten Stories Masih Kosong!';
                      }
                      return null;
                    },
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                        padding: const EdgeInsets.all(15.0),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        alignment: Alignment.center),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        submit(_author!, _title!, _dateTime!, _content!);
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
                                  padding: const EdgeInsets.only(
                                      top: 20, bottom: 20),
                                  shrinkWrap: true,
                                  children: <Widget>[
                                    const Center(
                                        child: Text('Berhasil Menambahkan!')),
                                    const SizedBox(height: 20),
                                    // TODO: Munculkan informasi yang didapat dari form
                                    Center(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Author Stories: $_author',
                                            style: TextStyle(
                                                color: Colors.deepPurple),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            'Judul Stories: $_title',
                                            style: TextStyle(
                                                color: Colors.deepPurple),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            'Waktu posting Stories: $_dateTime',
                                            style: TextStyle(
                                                color: Colors.deepPurple),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            'Isi Stories kamu: $_content',
                                            style: TextStyle(
                                                color: Colors.deepPurple),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                        ],
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text('Kembali'),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      }
                    },
                    child: const Text('Simpan',
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),
          ),
        ),
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
          ],
        ),
      ),
    );
  }
}
