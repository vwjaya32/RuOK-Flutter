import 'package:flutter/material.dart';
import 'package:ruok/main.dart';
import 'package:ruok/drawer.dart';
import 'package:ruok/Tests/utils/fetch_test.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:ruok/providers/user_provider.dart';
import 'package:ruok/Auth/models/user_model.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});
  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  static const purple = Color(0xFF613FE5);
  static const black = Color(0xFF09050D);
  static const yellow = Color(0xFFFFCA0C);
  static const red = Color(0xFFDE1C1C);
  String _results = "Please pick an answer for every questions first.";
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

  String lonely = 'No.';
  List<String> oftenLonely = ['No.', 'Sometimes.', 'Yes.'];
  int _fourcounter = 0;

  String suicidal = 'Never.';
  List<String> oftenSuicidal = ['Never.', 'Rarely.', 'Sometimes.', 'Yes.'];
  int _fivecounter = 0;
  int _totalcounter = 0;

  // void _incrementCounter() {

  @override
  Widget build(BuildContext context) {
    final user = context.watch<UserProvider>();
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Mental Health Tests for ${user.user.username}!',
            style: TextStyle(fontFamily: "Roboto Slab"),
          ),
          backgroundColor: purple,
        ),
        drawer: const RuokDrawer(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 25,
                width: 25,
              ),
              Center(
                  child: Text('Quick Mental Health Test',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: "Roboto Slab"))),
              Center(
                  child: Text(
                '${user.user.username}, Spend just 3 minutes of taking this test and we will quickly calculate your mental health state.',
                style: TextStyle(
                  fontFamily: "Roboto Slab",
                ),
                textAlign: TextAlign.center,
              )),
              SizedBox(height: 10),
              Column(children: const [
                Center(
                    child: Text('Caution!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: red,
                            fontFamily: "Roboto Slab"))),
                Center(
                    child: Text(
                        'This test does not serve as a real diagnostic tool, but can be used to picture of the condition you are currently experiencing. ',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontFamily: "Roboto Slab"))),
              ]),
              Center(
                  child: Text(
                      'Use this test wisely, answer honestly according to your current conditions. Please consult your psychologist or psychiatrist if needed.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontFamily: "Roboto Slab"))),
              ListTile(
                title: const Text('Do you often feel sad lately?',
                    style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Roboto Slab")),
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
                        fontFamily: "Roboto Slab")),
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
                        fontFamily: "Roboto Slab")),
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
                        fontFamily: "Roboto Slab")),
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
                        fontFamily: "Roboto Slab")),
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
              SizedBox(
                height: 20,
              ),
              ListTile(
                  title: const Text(
                    'Check My Past Test Results',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: "Roboto Slab", color: Colors.white),
                  ),
                  tileColor: purple,
                  selectedTileColor: yellow,
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const FetchRestsPage()));
                  }),
              SizedBox(
                height: 25,
              ),
              Container(
                child: Text(
                  'Press The Yellow Button Below to Check Your Result!',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: purple,
                    fontFamily: "Roboto Slab",
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: Text(
                  '$_totalcounter',
                  style: TextStyle(
                    fontFamily: "Roboto Slab",
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                height: 100,
                width: 400,
                child: Text(
                  '$_results',
                  style: TextStyle(
                    fontFamily: "Roboto Slab",
                  ),
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
                backgroundColor: yellow,
                foregroundColor: yellow,
                hoverColor: red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                ),
              ),
            ],
          ),

          // This trailing comma makes auto-formatting nicer for build methods.
        ));
  }
}
