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
  int _donecounter = 0;
  int _onecounter = 0;
  bool _onedone = false;
  int _twocounter = 0;
  bool _twodone = false;
  int _threecounter = 0;
  bool _threedone = false;
  int _fourcounter = 0;
  bool _fourdone = false;
  int _fivecounter = 0;
  bool _fivedone = false;
  int _totalcounter = 0;

  // void _incrementCounter() {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tests'),
      ),
      drawer: const RuokDrawer(),
      body: Column(
        children: [
          Center(
              child: Text('Quick Mental Health Test',
                  style: TextStyle(fontWeight: FontWeight.bold))),
          Center(
              child: Text(
                  'Spend just 3 minutes of taking this test and we will quickly calculate your mental health state.')),
          Center(
            child: Text(
                'All : $_totalcounter , $_onecounter , $_twocounter, $_threecounter, $_fourcounter, $_fivecounter'),
          ),
          Center(
            child: Text(
                'Questions Answered : $_donecounter $_onedone $_twodone $_threedone $_fourdone $_fivedone'),
          ),
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
                  if (newValue != oftenSad[0]) {
                    if (_onedone == false) {
                      _onedone = true;
                    }
                    for (var i = 0; i < oftenSad.length; i++) {
                      if (newValue != oftenSad[i]) {
                        _onecounter = i;
                        _totalcounter = _onecounter +
                            _twocounter +
                            _threecounter +
                            _fourcounter +
                            _fivecounter;
                        break;
                      }
                    }
                  } else {
                    _onedone = false;
                  }
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
                  if (newValue != oftenTired[0]) {
                    for (var i = 0; i < oftenTired.length; i++) {
                      if (newValue != oftenTired[i]) {
                        _twocounter = i;
                        if (_twodone == false) {
                          _twodone = true;
                        }
                        _totalcounter = _onecounter +
                            _twocounter +
                            _threecounter +
                            _fourcounter +
                            _fivecounter;
                        break;
                      }
                    }
                  } else {
                    _twodone = false;
                  }
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
                  if (newValue != oftenCry[0]) {
                    for (var i = 0; i < oftenCry.length; i++) {
                      if (newValue != oftenCry[i]) {
                        _threecounter = i;
                        if (_threedone == false) {
                          _threedone = true;
                        }
                        _totalcounter = _onecounter +
                            _twocounter +
                            _threecounter +
                            _fourcounter +
                            _fivecounter;
                        break;
                      }
                    }
                  } else {
                    _threedone = false;
                  }
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
                  if (newValue != oftenLonely[0]) {
                    for (var i = 0; i < oftenLonely.length; i++) {
                      if (newValue != oftenLonely[i]) {
                        _fourcounter = i;
                        if (_fourdone == false) {
                          _fourdone = true;
                        }
                        _totalcounter = _onecounter +
                            _twocounter +
                            _threecounter +
                            _fourcounter +
                            _fivecounter;
                        break;
                      }
                    }
                  } else {
                    _fourdone = false;
                  }
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
                  if (newValue != oftenSuicidal[0]) {
                    for (var i = 0; i < oftenSuicidal.length; i++) {
                      if (newValue != oftenSuicidal[i]) {
                        _fivecounter = i;
                        if (_fivedone == false) {
                          _fivedone = true;
                        }
                        _totalcounter = _onecounter +
                            _twocounter +
                            _threecounter +
                            _fourcounter +
                            _fivecounter;
                        break;
                      }
                    }
                  } else {
                    _fivedone = false;
                  }
                });
              },
            ),
          ),
          TextButton(
              onPressed: () {
                _totalcounter = _onecounter +
                    _twocounter +
                    _threecounter +
                    _fourcounter +
                    _fivecounter;
              },
              child: Text(
                'Jiancooooog',
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    backgroundColor: Colors.purple),
              )),
          FloatingActionButton(
            onPressed: () {
              _totalcounter = _onecounter +
                  _twocounter +
                  _threecounter +
                  _fourcounter +
                  _fivecounter;

              if (_onecounter == true) {
                _donecounter++;
              }
              if (_twocounter == true) {
                _donecounter++;
              }
              if (_threecounter == true) {
                _donecounter++;
              }
              if (_fourcounter == true) {
                _donecounter++;
              }
              if (_fivecounter == true) {
                _donecounter++;
              }
            },
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15.0))),
            hoverColor: Color.fromARGB(255, 219, 71, 7),
          ),
        ],
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
