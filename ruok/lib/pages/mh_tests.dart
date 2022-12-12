import 'package:flutter/material.dart';
import 'package:ruok/pages/events_page.dart';
import 'package:ruok/pages/stories.dart';
import 'package:ruok/main.dart';
import 'package:ruok/drawer.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});
  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  final _formKey = GlobalKey<FormState>();
  String sad = 'Pick One';
  List<String> oftenSad = ['Pick One', 'No', 'Maybe', 'Yes'];
  String tired = 'Pick One';
  List<String> oftenTired = ['Pick One', 'No', 'Maybe', 'Yes'];
  String cry = 'Pick One';
  List<String> oftenCry = [
    'Pick One',
    'Less than 3 times',
    '3-5 times',
    'More than 5 times',
    'Nearly every day'
  ];
  String lonely = 'Pick One';
  List<String> oftenLonely = [
    'Pick One',
    'I feel happy to have so many friends here.',
    'Sometimes I feel alone but there are still some people I can rely on',
    'Yes, I am alone and I do not trust other people'
  ];
  String suicidal = 'Pick One';
  List<String> oftenSuicidal = [
    'Pick One',
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
      drawer: const RuokDrawer(),
      body: Column(
        children: [
          ListTile(
            title: const Text('Do you often feel sad lately?',
                style: TextStyle(color: Colors.green)),
            trailing: DropdownButton(
              value: sad,
              icon: const Icon(Icons.keyboard_arrow_down),
              items: oftenSad.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  sad = newValue!;
                });
              },
            ),
          ),
          ListTile(
            title: const Text(
                'In this one week, do you feel mentally tired for more than three days?',
                style: TextStyle(color: Colors.green)),
            trailing: DropdownButton(
              value: tired,
              icon: const Icon(Icons.keyboard_arrow_down),
              items: oftenTired.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  tired = newValue!;
                });
              },
            ),
          ),
          ListTile(
            title: const Text(
                'How many times have you cried or been silent in the past two weeks?',
                style: TextStyle(color: Colors.green)),
            trailing: DropdownButton(
              value: cry,
              icon: const Icon(Icons.keyboard_arrow_down),
              items: oftenCry.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  cry = newValue!;
                });
              },
            ),
          ),
          ListTile(
            title: const Text('Do you feel alone in this world?',
                style: TextStyle(color: Colors.green)),
            trailing: DropdownButton(
              value: lonely,
              icon: const Icon(Icons.keyboard_arrow_down),
              items: oftenLonely.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  lonely = newValue!;
                });
              },
            ),
          ),
          ListTile(
            title: const Text('Are you thinking about committing suicide?',
                style: TextStyle(color: Colors.green)),
            trailing: DropdownButton(
              value: suicidal,
              icon: const Icon(Icons.keyboard_arrow_down),
              items: oftenSuicidal.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  suicidal = newValue!;
                });
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0))),
        hoverColor: Color.fromARGB(255, 219, 71, 7),
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
