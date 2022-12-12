// Import flutter
import 'package:flutter/material.dart';

// Import pages
import 'package:ruok/main.dart';
import 'package:ruok/Quotes/pages/quotes_page_main.dart';
import 'package:ruok/Events/pages/events_page.dart';

class RuokDrawer extends StatelessWidget {
  const RuokDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Column(
              children: [
                const SizedBox(
                  height: 150,
                ),
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
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const EventPage())
                      );
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
                          MaterialPageRoute(builder: (context) => const QuotesPage())
                      );
                    }
                ),
              ]
          ),
        )
    );
  }


}