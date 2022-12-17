// Import flutter
import 'package:flutter/material.dart';

// Import Authentication
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

// Import user provider
import 'package:ruok/providers/user_provider.dart';

// Import model
import 'package:ruok/Auth/models/user_model.dart';

// Import pages
import 'package:ruok/main.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _loginFormKey = GlobalKey<FormState>();
  bool viewPassword = false;

  static const purple = Color(0xFF613FE5);
  static const black = Color(0xFF09050D);
  static const yellow = Color(0xFFFFCA0C);
  static const red = Color(0xFFDE1C1C);
  static const white = Color(0xFFFFFFFF);

  void toggleViewPassword() {
    setState(() {
      viewPassword = !viewPassword;
    });
  }

  String _username = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    final userProvider = context.watch<UserProvider>();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: purple,
        title: const Text('RuOK?'),
        centerTitle: true,
      ),
      body: Form(
        key: _loginFormKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 30, bottom: 15),
                  child: Text("Login",
                      style: TextStyle(
                          fontSize: 30,
                          fontFamily: "Roboto Slab",
                          fontWeight: FontWeight.bold)),
                ),
                // Username
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "Username",
                      icon: const Icon(Icons.people),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        _username = value!;
                      });
                    },
                    onSaved: (String? value) {
                      setState(() {
                        _username = value!;
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Username is required';
                      }
                      return null;
                    },
                  ),
                ),
                // Password
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8),
                  child: TextFormField(
                    obscureText: !viewPassword,
                    enableSuggestions: false,
                    autocorrect: false,
                    decoration: InputDecoration(
                      labelText: "Password",
                      icon: const Icon(Icons.lock),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        _password = value!;
                      });
                    },
                    onSaved: (String? value) {
                      setState(() {
                        _password = value!;
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Password is required';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, bottom: 15),
                  child: SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: black, foregroundColor: white),
                      onPressed: () async {
                        final response = await request
                            .login('https://ruok.up.railway.app/mob/login/', {
                          'username': _username,
                          'password': _password,
                        });
                        if (!response.containsKey('status')) {
                          response['status'] = false;
                        }
                        if (!response.containsKey('message')) {
                          response['message'] = 'Failed to connect to server';
                        }
                        if (!mounted) return;
                        if (request.loggedIn) {
                          userProvider.user = User.fromJson(response['data']);
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) => const HomePage()));
                        } else {
                          userProvider.user =
                              User(username: 'guest', isAdmin: false);
                          const snackBar = SnackBar(
                            content: Text(
                                "Failed to Login, Check your Username/Password"),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      },
                      child: const Text('Login'),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: purple, foregroundColor: white),
                    onPressed: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => const HomePage()));
                    },
                    child: const Text('Continue as guest'),
                  )
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
