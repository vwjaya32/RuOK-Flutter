// Flutter import
import 'package:flutter/material.dart';

// Pages import
import 'package:ruok/main.dart';
import 'package:ruok/pages/quotes_main.dart';
import 'package:ruok/pages/events_page.dart';

class ruokDrawer extends StatelessWidget {
  const ruokDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
            children: [
              ListTile(
                  title: const Text('Home'),
                  onTap: (){
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const HomePage())
                    );
                  },
              ),
              ListTile(
                  title: const Text('Stories'),
                  onTap: (){
                    // Navigator.pushReplacement(
                    //     context,
                    //     MaterialPageRoute(builder: (context) => )
                    // );
                  }
              ),
              ListTile(
                  title: const Text('Articles'),
                  onTap: (){
                    // Navigator.pushReplacement(
                    //     context,
                    //     MaterialPageRoute(builder: (context) => )
                    // );
                  }
              ),
              ListTile(
                  title: const Text('Events'),
                  onTap: (){
                    // Navigator.pushReplacement(
                    //     context,
                    //     MaterialPageRoute(builder: (context) => )
                    // );
                  }
              ),
              ListTile(
                  title: const Text('Catalogue'),
                  onTap: (){
                    // Navigator.pushReplacement(
                    //     context,
                    //     MaterialPageRoute(builder: (context) => )
                    // );
                  }
              ),
              ListTile(
                  title: const Text('Tests'),
                  onTap: (){
                    // Navigator.pushReplacement(
                    //     context,
                    //     MaterialPageRoute(builder: (context) => )
                    // );
                  }
              ),
              ListTile(
                  title: const Text('Quotes'),
                  onTap: (){
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => QuotesPage())
                    );
                  }
              ),
            ]
        )
    );
  }


}