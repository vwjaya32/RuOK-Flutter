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
              const ListTile(
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
                    //     MaterialPageRoute(builder: (context) => const FormPage())
                    // );
                  }
              ),
              ListTile(
                  title: const Text('Events'),
                  onTap: (){
                    // Navigator.pushReplacement(
                    //     context,
                    //     MaterialPageRoute(builder: (context) => const DataPage())
                    // );
                  }
              ),
              ListTile(
                  title: const Text('Catalogue'),
                  onTap: (){
                    // Navigator.pushReplacement(
                    //     context,
                    //     MaterialPageRoute(builder: (context) => const WatchListPage())
                    // );
                  }
              ),
            ]
        )
    );
  }


}