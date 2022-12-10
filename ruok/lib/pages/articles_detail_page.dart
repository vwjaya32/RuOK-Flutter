import 'package:flutter/material.dart';
import 'package:ruok/utils/drawer.dart';
import 'package:intl/intl.dart';

class MyDetailPage extends StatefulWidget {
  const MyDetailPage({
    super.key,
    required this.title,
    required this.author,
    required this.date,
    required this.content,
  });

  final String title;
  final String author;
  final DateTime date;
  final String content;

  @override
  State<MyDetailPage> createState() => _MyDetailPageState();
}

class _MyDetailPageState extends State<MyDetailPage> {
  @override
  Widget build(BuildContext context) {
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
                  style: const TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Row(
                children: [
                  Text("Release Date: " +
                      DateFormat('yyyy-MM-dd – kk:mm').format(widget.date))
                ],
              ),
              Row(
                children: [Text("Title: " + widget.title)],
              ),
              Row(
                children: [Text("Author: " + widget.author)],
              ),
              Row(
                children: [Text("Content: " + widget.content)],
              ),
              Expanded(
                child: Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: SizedBox(
                      width: double.infinity,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.only(
                              top: 20, bottom: 20, left: 10, right: 10),
                          backgroundColor: Colors.green,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'Back',
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                      ),
                    )),
              )
            ],
          ),
        ));
  }
}
