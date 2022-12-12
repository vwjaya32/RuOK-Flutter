import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widgets/drawer.dart';
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
  String? title;
  String? author;
  String? dateTime;
  String? content;

  Future<ForumContent>? _futureAlbum;
  final TextEditingController _in = TextEditingController();
  final TextEditingController _in2 = TextEditingController();
  final TextEditingController _in3 = TextEditingController();
  final TextEditingController _in4 = TextEditingController();

  void submit(String title, String dateTime, String content) async {
    var url = Uri.parse('https://ruok.up.railway.app/forum/get-forum-flutter/');

    var map = <String, dynamic>{};

    map["author"] = (author);
    map["title"] = (title);
    map["dateTime"] = (dateTime);
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Stories'),
      ),
      drawer: buildDrawer(context),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Padding(
                  // Menggunakan padding sebesar 8 pixels
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _in,
                    decoration: InputDecoration(
                      hintText: "Contoh: Apa Kabar?",
                      labelText: "Nama Stories",
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
                        title = value!;
                      });
                    },
                    onSaved: (String? value) {
                      setState(() {
                        title = value!;
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Nama Stories Masih Kosong!';
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
                      hintText: "Contoh: 021999333",
                      labelText: "Nomor Telefon Stories",
                      // Menambahkan icon agar lebih intuitif
                      icon: const Icon(Icons.star),

                      // Menambahkan circular border agar lebih rapi
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    // Menambahkan behavior saat nama diketik
                    onChanged: (String? rate) {
                      setState(() {
                        dateTime = rate!;
                      });
                    },
                    onSaved: (String? rate) {
                      setState(() {
                        dateTime = rate!;
                      });
                    },
                    validator: (String? rate) {
                      if (rate == null || rate.isEmpty) {
                        return 'Nomor Telefon Stories Masih Kosong!';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  // Menggunakan padding sebesar 8 pixels
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _in3,
                    decoration: InputDecoration(
                      hintText: "JL Kamojang IV",
                      labelText: "Lokasi Stories",
                      // Menambahkan icon agar lebih intuitif
                      icon: const Icon(Icons.location_city),
                      // Menambahkan circular border agar lebih rapi
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    // Menambahkan behavior saat nama diketik
                    onChanged: (String? loc) {
                      setState(() {
                        content = loc!;
                      });
                    },
                    onSaved: (String? loc) {
                      setState(() {
                        content = loc!;
                      });
                    },
                    validator: (String? loc) {
                      if (loc == null || loc.isEmpty) {
                        return 'Lokasi Stories Masih Kosong!';
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
                        submit(title!, dateTime!, content!);
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
                                            'Nama Stories: $title',
                                            style: TextStyle(
                                                color: Colors.deepPurple),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            'Nomor Telefon Stories: $dateTime',
                                            style: TextStyle(
                                                color: Colors.deepPurple),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            'Lokasi Stories: $content',
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
    );
  }
}
