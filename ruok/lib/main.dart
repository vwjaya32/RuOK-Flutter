import 'package:flutter/material.dart';

// Import Authentication
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

// Import Drawer
import 'package:ruok/drawer.dart';

// Import pages
import 'package:ruok/Auth/forms/login_form.dart';

// Import provider
import 'package:ruok/providers/user_provider.dart';

// Import user
import 'package:ruok/Auth/models/user_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<CookieRequest>(create: (_) {
          CookieRequest request = CookieRequest();
          return request;
        }),
        Provider<UserProvider>(create: (_) {
          UserProvider userProvider =
              UserProvider(user: User(username: 'guest', isAdmin: false));
          return userProvider;
        })
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'RuOK',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.purple,
        ),
        home: const HomePage(),
        initialRoute: '/login',
        routes: {
          '': (BuildContext context) => const HomePage(),
          '/login': (BuildContext context) => const LoginPage(),
        },
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title = 'Hi there! Are you OK?';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const purple = Color(0xFF613FE5);
  static const black = Color(0xFF09050D);
  static const yellow = Color(0xFFFFCA0C);
  static const red = Color(0xFFDE1C1C);
  static const white = Color(0xFFFFFFFF);

  @override
  Widget build(BuildContext context) {
    final user = context.watch<UserProvider>();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: purple,
        title: Text(
          widget.title,
          style: TextStyle(fontFamily: "Roboto Slab"),
        ),
      ),

      drawer: const RuokDrawer(),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Image.network(
                "https://cdn.discordapp.com/attachments/902134320880287754/1053311245228458024/image_2022-12-16_210140875-removebg-preview.png",
                height: 400,
              ),
            ),
            const Text(
              "You are now login as",
              style: TextStyle(
                  fontFamily: "Roboto Slab", color: black, fontSize: 30),
            ),
            Text(user.user.username,
                style: const TextStyle(
                    fontFamily: "Roboto Slab",
                    color: purple,
                    fontSize: 35,
                    fontWeight: FontWeight.bold)),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
