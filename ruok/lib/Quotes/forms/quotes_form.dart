// Import flutter
import 'package:flutter/material.dart';

// Import Authentication
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

// Import provider
import 'package:ruok/providers/user_provider.dart';

// Import utils
import 'package:http/http.dart' as http;
import 'dart:convert';

// Import pages
import 'package:ruok/Quotes/pages/quotes_page_main.dart';

class QuotesForm extends StatefulWidget {
  const QuotesForm({Key? key}) : super(key:key);

  @override
  State<QuotesForm> createState() => _QuotesFormState();
}

class _QuotesFormState extends State<QuotesForm> {
  final _formKey = GlobalKey<FormState>();
  String? _title = "";
  String? _image = "";
  String? user = "";

  Future<void> submit(CookieRequest request, UserProvider who) async {
    user = who.user.username;

    final response = await http.post(
        Uri.parse('https://ruok.up.railway.app/quotes/mob_add_quote'),
        headers: <String, String>{'Content-Type': 'application/json'},
        body: jsonEncode(<String, dynamic>{
          'title': _title,
          'image': _image,
          'user': user,
        }));
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    final who = context.watch<UserProvider>();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const QuotesPage()));
          },
          icon:Icon(Icons.arrow_back),
        ),
        centerTitle: true,
        toolbarHeight: 60,
        title: const Text(
          'Motivational Quotes',
          style: TextStyle(
            fontFamily: "Roboto Slab",
            fontWeight: FontWeight.bold,
            color: Color(0xFF613FE5),
          ),
        ),
        backgroundColor: Colors.white30,
        foregroundColor: Color(0xFF613FE5),
        elevation: 0,
      ),
      body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Container(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Title",
                        icon: const Icon(Icons.text_fields_rounded),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))
                      ),
                      onChanged: (String? value){
                        setState(() {
                          _title = value!;
                        });
                      },
                      onSaved: (String? value){
                        setState(() {
                          _title = value!;
                        });
                      },
                      validator: (String? value){
                        if (value ==  null || value.isEmpty){
                          return 'Title is required';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
                        labelText: "Image URL",
                        icon: const Icon(Icons.image),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))
                      ),
                      onChanged: (String? value){
                        setState(() {
                          _image = value!;
                        });
                      },
                      onSaved: (String? value){
                        setState(() {
                          _image = value!;
                        });
                      },
                      validator: (String? value){
                        if (value ==  null || value.isEmpty){
                          return 'Image URL is essential!';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF613FE5),
                          ),
                          child: const Text('Share with others'),
                          onPressed: (){
                            if(_formKey.currentState!.validate()){
                              submit(request, who);
                              showDialog(
                                  context: context,
                                  builder: (context){
                                    return Dialog(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10)),
                                      elevation: 15,
                                      child: Container(
                                          child: ListView(
                                            padding: const EdgeInsets.only(top: 20, bottom: 20),
                                            shrinkWrap: true,
                                            children: <Widget>[
                                              const SizedBox(height: 20),
                                              const Center (
                                                  child: Text('DONE!',
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          fontWeight: FontWeight.bold)
                                                  )),
                                              const SizedBox(height: 20,),
                                              TextButton(
                                                child: Text('Back'),
                                                onPressed: () {
                                                  Navigator.pushReplacement(context,
                                                      MaterialPageRoute(builder: (context) => const QuotesPage())
                                                  );
                                                },
                                              ),
                                            ],
                                          )),
                                    );
                                  });
                            }
                          },
                        )
                      ],
                    )
                  ],
                )
            ),)),
    );
  }
}