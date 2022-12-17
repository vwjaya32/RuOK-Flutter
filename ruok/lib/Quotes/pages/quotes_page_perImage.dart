// Import Flutter
import 'package:flutter/material.dart';

// Import user
import 'package:provider/provider.dart';
import 'package:ruok/providers/user_provider.dart';

// Import drawer
import 'package:ruok/drawer.dart';

// Import utils
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:http/http.dart' as http;

// Import pages
import 'package:ruok/Quotes/pages/quotes_page_main.dart';

class QuotesPerImage extends StatefulWidget{
  QuotesPerImage({Key? key, required this.data})
      : super(key: key);

  var data;
  bool toggleDelete = false;

  @override
  State<QuotesPerImage> createState() => _QuotesPerImageState();
}



class _QuotesPerImageState extends State<QuotesPerImage> {
  Future<void> delete(CookieRequest request, int id) async {
    final response = await http.post(
      Uri.parse(
          'https://ruok.up.railway.app/quotes/mob_delete/$id'),
      headers: <String, String>{'Content-Type': 'application/json'},
    );
  }

  @override
  Widget build(BuildContext context){
    final user = context.watch<UserProvider>();
    final request = context.watch<CookieRequest>();

    // Quotes Model Breakdown
    int quotesID = widget.data.pk;
    String title = widget.data.fields.title;
    String imageURL = widget.data.fields.image;
    String imageUser = widget.data.fields.user;

    // isUser + isAdmincheck
    if (imageUser == user.user.username || user.user.username == 'admin'){
      widget.toggleDelete = true;
    };

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        title: const Text(''),
        backgroundColor: Colors.white30,
        foregroundColor: Color(0xFF613FE5),
        elevation: 0,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      drawer: const RuokDrawer(),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  color: Color(0xFF09050D),
                  width: double.infinity,
                  height: 500,
                  alignment: Alignment.center,
                  child: Image.network(
                      imageURL,
                      fit: BoxFit.cover),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Text(
                      title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,
                      ),
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                    imageUser,
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold)
                ),
                const SizedBox(height: 15),
                Visibility(
                  child: widget.toggleDelete ?
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                        ),
                        onPressed: (){
                          delete(request, quotesID);
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const QuotesPage()),
                          );
                        },
                        child: const Icon(Icons.delete)
                    ),
                  ) : const SizedBox(height: 0)
                ),
              ]
          ),
        ),
      ),
    );
  }
}