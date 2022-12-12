// Import Flutter
import 'package:flutter/material.dart';

// Import model
import 'package:ruok/Quotes/quotes_model.dart';

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
      body: Container(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 500,
                alignment: Alignment.center,
                child: Image.network(
                    widget.fields.image,
                    fit: BoxFit.cover),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15, left: 15),
                child: Text(
                    '${widget.fields.title}',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                    )
                ),
              ),
              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(
                    '${widget.fields.user}',
                    style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold)
                ),
              )
            ]
        ),
      ),
    );
  }
}