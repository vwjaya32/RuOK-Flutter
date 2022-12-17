import 'package:flutter/material.dart';
import 'package:ruok/main.dart';
import 'package:ruok/drawer.dart';
import 'package:ruok/Tests/utils/fetch_test.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});
  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  String _results = "Halo! Please pick an answer for every questions first.";
  void _resultcount() {
    setState(() {
      if (_totalcounter < 5) {
        _results = "Please pick an answer for every questions first.";
      } else if (_totalcounter <= 8) {
        _results =
            "Currently you are in a good mental condition. Keep your physical and spiritual health by exercising, have faith and praying, and socializing in a healthy manner.";
      } else if (_totalcounter <= 13) {
        _results =
            "You are indicated to be in a unhappy state. Sharing your sadness with friends or family can help ease the sadness you are experiencing.";
      } else {
        _results =
            "You are indicated to be in a very sad state. Talk to your closest friends or family, contact your psychiatrist or psychologist to help you.";
      }
    });
  }

  final _formKey = GlobalKey<FormState>();
  String sad = 'No';
  List<String> oftenSad = ['No', 'Maybe', 'Yes'];
  int _onecounter = 0;

  String tired = 'No';
  List<String> oftenTired = ['No', 'Maybe', 'Yes'];
  int _twocounter = 0;

  String cry = 'Less than 3 times';
  List<String> oftenCry = [
    'Less than 3 times',
    '3-5 times',
    'More than 5 times',
    'Nearly every day'
  ];
  int _threecounter = 0;

  String lonely = 'I feel happy to have so many friends here.';
  List<String> oftenLonely = [
    'I feel happy to have so many friends here.',
    'Sometimes I feel alone but there are still some people I can rely on',
    'Yes, I am alone and I do not trust other people'
  ];
  int _fourcounter = 0;

  String suicidal =
      'I am happy with my journey and I want to live a healthy life.';
  List<String> oftenSuicidal = [
    'I am happy with my journey and I want to live a healthy life.',
    'Even though my life is hard sometimes, I do not think about ending it.',
    'I have had suicidal thoughts once in a while.',
    ' Lately I really want to end my life.'
  ];
  int _fivecounter = 0;
  int _totalcounter = 0;

  // void _incrementCounter() {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Tests'),
        ),
        drawer: const RuokDrawer(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                  child: Text('Quick Mental Health Test',
                      style: TextStyle(fontWeight: FontWeight.bold))),
              Center(
                  child: Text(
                      'Spend just 3 minutes of taking this test and we will quickly calculate your mental health state.')),
              Column(children: const [
                Center(
                    child: Text('Caution!',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 141, 18, 10)))),
                Center(
                    child: Text(
                        'This test does not serve as a real diagnostic tool, but can be used to picture of the condition you are currently experiencing. ')),
              ]),
              Center(
                  child: Text(
                      'Use this test wisely, answer honestly according to your current conditions. Please consult your psychologist or psychiatrist if needed.')),
              ListTile(
                title: const Text('Do you often feel sad lately?',
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    )),
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
                      for (var i = 0; i < oftenSad.length; i++) {
                        if (newValue == oftenSad[i]) {
                          _onecounter = i + 1;
                          _totalcounter = _onecounter +
                              _twocounter +
                              _threecounter +
                              _fourcounter +
                              _fivecounter;
                          break;
                        }
                      }
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text(
                    'In this one week, do you feel mentally tired for more than three days?',
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    )),
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
                      for (var i = 0; i < oftenTired.length; i++) {
                        if (newValue == oftenTired[i]) {
                          _twocounter = i + 1;
                          _totalcounter = _onecounter +
                              _twocounter +
                              _threecounter +
                              _fourcounter +
                              _fivecounter;
                          break;
                        }
                      }
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text(
                    'How many times have you cried or been silent in the past two weeks?',
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    )),
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
                      for (var i = 0; i < oftenCry.length; i++) {
                        if (newValue == oftenCry[i]) {
                          _threecounter = i + 1;
                          _totalcounter = _onecounter +
                              _twocounter +
                              _threecounter +
                              _fourcounter +
                              _fivecounter;
                          break;
                        }
                      }
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text('Do you feel alone in this world?',
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    )),
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

                      for (var i = 0; i < oftenLonely.length; i++) {
                        if (newValue == oftenLonely[i]) {
                          _fourcounter = i + 1;
                          _totalcounter = _onecounter +
                              _twocounter +
                              _threecounter +
                              _fourcounter +
                              _fivecounter;
                          break;
                        }
                      }
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text('Are you thinking about committing suicide?',
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    )),
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

                      for (var i = 0; i < oftenSuicidal.length; i++) {
                        if (newValue == oftenSuicidal[i]) {
                          _fivecounter = i + 1;
                          _totalcounter = _onecounter +
                              _twocounter +
                              _threecounter +
                              _fourcounter +
                              _fivecounter;
                          break;
                        }
                      }
                    });
                  },
                ),
              ),
              ListTile(
                  title: const Text(
                    'Tests Results',
                    textAlign: TextAlign.center,
                  ),
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const FetchRestsPage()));
                  }),
              Container(
                height: 50,
                width: 200,
                child: Text(
                  'Press The Button Below to check your Result!',
                  style: TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                height: 50,
                width: 200,
                child: Text(
                  '$_totalcounter',
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                height: 100,
                width: 400,
                child: Text(
                  '$_results',
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                height: 5,
                width: 200,
              ),
              FloatingActionButton(
                onPressed: () {
                  _resultcount();
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                ),
                hoverColor: Color.fromARGB(255, 219, 71, 7),
              ),
            ],
          ),

          // This trailing comma makes auto-formatting nicer for build methods.
        ));
  }
}
