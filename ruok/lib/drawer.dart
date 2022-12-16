// Import flutter
import 'package:flutter/material.dart';

// Import user
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:ruok/providers/user_provider.dart';
import 'package:ruok/Auth/models/user_model.dart';

// Import pages
import 'package:ruok/main.dart';
import 'package:ruok/Auth/forms/login_form.dart';
import 'package:ruok/Tests/pages/mh_tests.dart';
import 'package:ruok/Quotes/pages/quotes_page_main.dart';
import 'package:ruok/Events/pages/events_page.dart';
import 'package:ruok/Catalogue/page/catalogue_page.dart';
import 'package:ruok/Articles/pages/articles_page.dart';
import 'package:ruok/stories/pages/stories.dart';

class RuokDrawer extends StatelessWidget {
  const RuokDrawer({super.key});

  static const purple = Color(0xFF613FE5);
  static const black = Color(0xFF09050D);
  static const yellow = Color(0xFFFFCA0C);
  static const red = Color(0xFFDE1C1C);
  static const white = Color(0xFFFFFFFF);

  @override
  Widget build(BuildContext context) {
    final user = context.watch<UserProvider>();
    final request = context.watch<CookieRequest>();

    String who = user.user.username;

    Future<void> logout(CookieRequest request) async {
      final response = await request.logout(
          'https://ruok.up.railway.app/mob/logout/');
      user.user = User(
          username: 'guest',
          isAdmin: false
      );
    }

    return Drawer(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            SizedBox(
              height: 120,
              child: Padding(
                padding: const EdgeInsets.only(top: 75, left: 23),
                child: RichText(
                  text: TextSpan(
                    text: 'R u OK? ',
                    style: const TextStyle(
                      fontFamily: "Roboto Slab",
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: Colors.black,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                          text: who,
                          style: const TextStyle(
                            fontFamily: "Roboto Slab",
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Color(0xFF613FE5),
                          )
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5),
            ListTile(
              leading: const Padding(
                padding: EdgeInsets.only(left: 8),
                child: Icon(Icons.house),
              ),
              iconColor: purple,
              title: const Text('Home'),
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const HomePage()));
              },
            ),
            ListTile(
                leading: const Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: Icon(Icons.chat_bubble_rounded)),
                iconColor: purple,
                title: const Text('Stories'),
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => const MyForumPage()));
                }),
            ListTile(
                leading: const Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Icon(Icons.article_rounded),
                ),
                iconColor: purple,
                title: const Text('Articles'),
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MyArticlesPage()));
                }),
            ListTile(
                leading: const Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Icon(Icons.people_rounded),
                ),
                iconColor: purple,
                title: const Text('Events'),
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => const EventPage()));
                }),
            ListTile(
                leading: const Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Icon(Icons.medication_liquid_rounded),
                ),
                iconColor: purple,
                title: const Text('Catalogue'),
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => const CataloguePage()));
                }),
            ListTile(
                leading: const Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Icon(Icons.add_reaction_rounded),
                ),
                iconColor: purple,
                title: const Text('Tests'),
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => const TestPage()));
                }),
            ListTile(
                leading: const Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Icon(Icons.format_quote_rounded),
                ),
                iconColor: purple,
                title: const Text('Quotes'),
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => const QuotesPage()));
                }),
            const SizedBox(height: 30),
            Visibility(
              child: who == 'guest' ?
              ListTile(
                  leading: const Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Icon(Icons.admin_panel_settings_rounded),
                  ),
                  iconColor: purple,
                  title: const Text('Login'),
                  onTap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => const LoginPage()));
                  }) : const SizedBox(height: 0),
            ),
            Visibility(
              child: who != 'guest' ?
              ListTile(
                  leading: const Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Icon(Icons.admin_panel_settings_rounded),
                  ),
                  iconColor: red,
                  title: const Text('Logout'),
                  onTap: () {
                    logout(request);
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => const LoginPage()));
                  }) : const SizedBox(height: 0),
            ),
          ]
        )
    );
  }
}
