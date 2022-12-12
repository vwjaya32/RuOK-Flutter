import 'package:flutter/material.dart';
import 'package:ruok/main.dart';
import 'package:ruok/stories/pages/stories.dart';
import 'package:ruok/stories/pages/stories_post.dart';

Drawer buildDrawer(BuildContext context) {
  return Drawer(
    child: Column(
      children: [
        ListTile(
          title: const Text('counter_7'),
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => const MyHomePage(
                        title: "Program Counter",
                      )),
            );
          },
        ),
        ListTile(
          title: const Text('Stories'),
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const MyForumPage()),
            );
          },
        ),

        ListTile(
          title: const Text('Add Stories'),
          onTap: () {
            // Route menu ke halaman Form Budget
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const MyForumFormPage()),
            );
          },
        ),

        //   ListTile(
        //     title: const Text('Activity'),
        //     onTap: () {
        //       Navigator.pushReplacement(
        //         context,
        //         MaterialPageRoute(builder: (context) => const MyHospitalFormPage()),
        //       );
        //     },
        //   ),
      ],
    ),
  );
}
