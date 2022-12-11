// Import flutter
import 'package:flutter/material.dart';

// Import Authentication
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

// Import user provider
import 'package:ruok/providers/user_provider.dart';

// Import model
import 'package:ruok/models/user_model.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _loginFormKey = GlobalKey<FormState>();
  bool ViewPassword = false;

  void viewPassword() {
    setState(() {
      ViewPassword = !ViewPassword;
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
        title: const Text('Login'),
      ),
      body: Form(
        key: _loginFormKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 30),
                child: Text(
                    "Login",
                    style: TextStyle(
                        fontSize: 30, fontFamily: "Roboto Slab", fontWeight: FontWeight.bold)
                ),
              ),
              // Username
              Padding(
                padding: const EdgeInsets.all(15),
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
                padding: const EdgeInsets.all(15),
                child: TextFormField(
                  obscureText: !ViewPassword,
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
              ElevatedButton(
                onPressed: () async {
                  final response = await request.login('https://ruok.up.railway.app/mob/login/', {
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
                    print("user " + userProvider.user.username);
                    Navigator.pop(context);
                  } else {
                    userProvider.user = User(
                        username: 'guest',
                        isAdmin: false);
                    final snackBar = SnackBar(
                      content: Text(response['message']),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                },
                child: const Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}