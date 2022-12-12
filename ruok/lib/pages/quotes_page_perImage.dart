// Import Flutter
import 'package:flutter/material.dart';

// Import model
import 'package:ruok/models/quotes_model.dart';

// Import drawer
import 'package:ruok/drawer.dart';

class QuotesPerImage extends StatefulWidget{
  QuotesPerImage({Key? key, required this.fields})
      : super(key: key);

  var fields;

  @override
  State<QuotesPerImage> createState() => _QuotesPerImageState();
}

class _QuotesPerImageState extends State<QuotesPerImage> {

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        title: const Text(''),
        backgroundColor: Colors.white30,
        foregroundColor: Colors.deepPurple,
        elevation: 0,
      ),
      drawer: const RuokDrawer(),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.network(widget.fields.image),
              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 15),
                child: Text(
                    '${widget.fields.title}',
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold)
                ),
              ),
              const SizedBox(height: 8),
            ]
        ),
      ),
    );
  }
}