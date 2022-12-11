// Import flutter
import 'package:flutter/material.dart';

// Import functions
import 'package:ruok/functions/quotes_function_fetch_json.dart';

// Import drawer
import 'package:ruok/drawer.dart';


class QuotesPage extends StatefulWidget {
  const QuotesPage({Key? key}) : super(key: key);

  @override
  _QuotesPageState createState() => _QuotesPageState();
}

class _QuotesPageState extends State<QuotesPage> {

  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          title: const Text('Motivational Quotes'),
        ),
        drawer: const ruokDrawer(),
        body: FutureBuilder(
            future: fetchQuotes(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return const Center(child: CircularProgressIndicator());
              } else {
                if (!snapshot.hasData) {
                  return Column(
                    children: const [
                      Text(
                        "Tidak ada Quotes :(",
                        style: TextStyle(
                            color: Color(0xff59A5D8),
                            fontSize: 20),
                      ),
                      SizedBox(height: 8),
                    ],
                  );
                } else {
                  return Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 15, bottom: 8),
                        child: Text(
                          "Motivational Quotes",
                          style: TextStyle(
                              fontSize: 30, fontFamily: "Roboto Slab", fontWeight: FontWeight.bold)
                        ),
                      ),
                      ListView.builder(
                          itemCount: snapshot.data!.length,
                          shrinkWrap: true,
                          itemBuilder: (_, index)=> Container(
                            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                            padding: const EdgeInsets.all(3.0),
                            decoration: BoxDecoration(
                                color:Colors.white,
                                borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ListTile(
                                  title: Text(
                                    "${snapshot.data![index].fields.title}",
                                    style: const TextStyle(
                                      fontSize: 15.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                      ),
                    ],
                  );
                }
              }
            }
        )
    );
  }
}