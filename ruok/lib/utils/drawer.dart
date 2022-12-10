import 'package:flutter/material.dart';
import 'package:ruok/pages/articles_page.dart';

class RYOKDrawer extends StatefulWidget {
  const RYOKDrawer({super.key});

  @override
  State<RYOKDrawer> createState() => _RYOKDrawerState();
}

class _RYOKDrawerState extends State<RYOKDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          ListTile(
            title: const Text('Articles'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const MyArticlesPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
