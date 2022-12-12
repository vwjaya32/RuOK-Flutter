import 'package:flutter/material.dart';
import 'package:ruok/pages/events_page.dart';
import 'package:ruok/pages/stories.dart';
import 'package:ruok/main.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});
  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  final _formKey = GlobalKey<FormState>();
  List<String> oftenSad = ['No', 'Maybe', 'Yes'];
  List<String> oftenTired = ['No', 'Maybe', 'Yes'];
  List<String> oftenCry = [
    'Less than 3 times',
    '3-5 times',
    'More than 5 times',
    'Nearly every day'
  ];
  List<String> oftenLonely = [
    'I feel happy to have so many friends here.',
    'Sometimes I feel alone but there are still some people I can rely on',
    'Yes, I am alone and I do not trust other people'
  ];
  List<String> oftenSuicidal = [
    'I am happy with my journey and I want to live a healthy life.',
    'Even though my life is hard sometimes, I do not think about ending it.',
    'I have had suicidal thoughts once in a while.',
    ' Lately I really want to end my life.'
  ];
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tests'),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
