import 'package:flutter/material.dart';
import 'package:ruok/Tests/pages/mh_tests.dart';
import 'package:ruok/Tests/models/my_results.dart';
import 'package:ruok/Tests/models/resultss.dart';
import 'package:ruok/drawer.dart';

class save extends StatefulWidget {
  save({super.key});

  @override
  State<save> createState() => _saveState();
}

class _saveState extends State<save> {
  static List<Resultss> listMyResults = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data'),
      ),
      drawer: RuokDrawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          listMyResults == null || listMyResults.isEmpty
              ? Center(
                  child: Column(
                    children: [
                      const Text(
                        "Tidak terdapat data!",
                      ),
                    ],
                  ),
                )
              : Expanded(
                  child: ListView.builder(
                    itemCount: listMyResults.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          title: Text(listMyResults[index].score.toString()),
                          subtitle: Text(listMyResults[index].date.toString()),
                        ),
                      );
                    },
                  ),
                ),
        ],
      ),
    );
  }
}

void setScore(int totalcounter) {
  Resultss newResult = Resultss(totalcounter);
  _saveState.listMyResults.add(newResult);
}
