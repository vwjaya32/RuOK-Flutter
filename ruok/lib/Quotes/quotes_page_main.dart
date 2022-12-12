// Import flutter
import 'package:flutter/material.dart';

// Import functions
import 'package:ruok/Quotes/quotes_function_fetch_json.dart';

// Import drawer
import 'package:ruok/drawer.dart';

// Import masonry
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

// Import page
import 'package:ruok/Quotes/quotes_page_perImage.dart';

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
          toolbarHeight: 60,
          title: const Text(
            'Motivational Quotes',
            style: TextStyle(
              fontFamily: "Roboto Slab",
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple,
            ),
          ),
          backgroundColor: Colors.white30,
          foregroundColor: Colors.deepPurple,
          elevation: 0,
        ),
        drawer: const RuokDrawer(),
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
                            color: Colors.deepPurple,
                            fontSize: 20),
                      ),
                      SizedBox(height: 8),
                    ],
                  );
                } else {
                  return Container(
                    margin: const EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 8),
                    child: MasonryGridView.builder(
                        scrollDirection: Axis.vertical,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                        gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index){
                          return GestureDetector(
                            onTap: (){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => QuotesPerImage(fields: snapshot.data![index].fields))
                              );
                            },
                            child: ClipRRect(
                              child: Image.network(
                                  snapshot.data![index].fields.image,
                                  loadingBuilder: (context, child, loadingProgress){
                                    if (loadingProgress == null) return child;

                                    return Transform.scale(
                                        scale: 0.3,
                                        child: const Center(child: CircularProgressIndicator()));
                                  }),
                            ),
                          );
                        }),
                  );
                }
              }
            }
        ),
    );
  }
}
