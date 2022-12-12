// Import Flutter
import 'package:flutter/material.dart';

// Import model
import 'package:ruok/Quotes/models/quotes_model.dart';

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
        foregroundColor: Color(0xFF613FE5),
        elevation: 0,
      ),
      drawer: const RuokDrawer(),
      body: Container(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                  color: Color(0xFF09050D),
                  width: double.infinity,
                  height: 500,
                  alignment: Alignment.center,
                  child: Image.network(
                      widget.fields.image,
                      fit: BoxFit.cover),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15, left: 15, right:15),
                child: Text(
                    '${widget.fields.title}',
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                    )
                ),
              ),
              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                    'By ${widget.fields.user}',
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold)
                ),
              )
            ]
        ),
      ),
    );
  }
}