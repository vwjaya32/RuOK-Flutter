import 'package:ruok/Stories/models/replies_models.dart';
import 'package:ruok/Stories/models/stories_fetch.dart';
import 'package:ruok/Stories/pages/stories_post.dart';
import 'package:ruok/Stories/pages/replies_post.dart';
import 'package:ruok/Stories/pages/stories_detail.dart';
import 'package:ruok/Stories/models/replies_fetch.dart';
import 'package:ruok/Stories/models/stories_models.dart';
import 'package:ruok/drawer.dart';
import 'package:flutter/material.dart';

class MyReplyPage extends StatefulWidget {
  MyReplyPage({
    Key? key,
    required this.stories_id,
  }) : super(key: key);

  int stories_id;

  @override
  State<MyReplyPage> createState() => _MyReplyState();
}

class _MyReplyState extends State<MyReplyPage> {
  static const purple = Color(0xFF613FE5);
  static const black = Color(0xFF09050D);
  static const yellow = Color(0xFFFFCA0C);
  static const red = Color(0xFFDE1C1C);

  @override
  Widget build(BuildContext context) {
    int id = 0;

    return Scaffold(
      backgroundColor: black,
      appBar: AppBar(
        backgroundColor: purple,
        title: const Text('Stories',
            style: TextStyle(
              fontFamily: "Roboto Slab",
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            )),
      ),
      drawer: RuokDrawer(),
      body: FutureBuilder(
        future: fetchMyReplies(widget.stories_id),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (!snapshot.hasData) {
              return Column(
                children: const [
                  Text(
                    "Tidak Ada Replies",
                    style: TextStyle(color: Colors.deepPurple, fontSize: 20),
                  ),
                  SizedBox(height: 8),
                ],
              );
            } else {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (_, i) => Column(
                        children: [
                          const SizedBox(height: 8),
                          Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 8),
                            padding: const EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15.0),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.black, blurRadius: 2.0)
                                ]),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "${snapshot.data![i].fields.author}",
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "${snapshot.data![i].fields.content}",
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ));
            }
          }
        },
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.fromLTRB(35, 10, 10, 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                backgroundColor: purple,
                onPressed: () => Navigator.pop(context),
                child: const Icon(Icons.arrow_back),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                backgroundColor: purple,
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyRepliesFormPage()),
                ),
                child: const Icon(Icons.message),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class MyForumDetail extends StatelessWidget {
//   const MyForumDetail({super.key, required this.MyForum});

//   final MyForum;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Detail Stories'),
//       ),
//       drawer: buildDrawer(context),
//       body: SingleChildScrollView(
//         child: Stack(children: [
//           Container(
//             margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//             padding: const EdgeInsets.all(20),
//             decoration: BoxDecoration(
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.grey.withOpacity(0.5),
//                   spreadRadius: 5,
//                   blurRadius: 7,
//                   offset: const Offset(0, 3), // changes position of shadow
//                 ),
//               ],
//               borderRadius: BorderRadius.circular(20),
//               color: const Color.fromARGB(255, 165, 224, 167),
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Text(
//                   MyForum.fields.title,
//                   style: const TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 18,
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 5,
//                 ),
//                 Text(
//                   MyForum.fields.author.toString(),
//                   style: const TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 18,
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 Text(
//                   MyForum.fields.dateTime.toString(),
//                   style: const TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 18,
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 5,
//                 ),
//                 Text(
//                   MyForum.fields.content,
//                   style: const TextStyle(
//                     fontSize: 16,
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//               ],
//             ),
//           ),
//           Container(
//             margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 200),
//             padding: const EdgeInsets.all(20),
//             decoration: BoxDecoration(
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.grey.withOpacity(0.5),
//                   spreadRadius: 5,
//                   blurRadius: 7,
//                   offset: const Offset(0, 3), // changes position of shadow
//                 ),
//               ],
//               borderRadius: BorderRadius.circular(20),
//               color: const Color.fromARGB(255, 165, 224, 167),
//             ),
//             child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: const [
//                       Text(
//                         "COMMENT",
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 18,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ]),
//           ),
//           Container(
//             margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 280),
//             padding: const EdgeInsets.all(20),
//             decoration: BoxDecoration(
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.grey.withOpacity(0.5),
//                   spreadRadius: 5,
//                   blurRadius: 7,
//                   offset: const Offset(0, 3), // changes position of shadow
//                 ),
//               ],
//               borderRadius: BorderRadius.circular(20),
//               color: const Color.fromARGB(255, 165, 224, 167),
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Text(
//                   MyForum.fields.author.toString(),
//                   style: const TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 18,
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 5,
//                 ),
//                 Text(
//                   MyForum.fields.title.toString(),
//                   style: const TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 18,
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 Text(
//                   MyForum.fields.dateTime.toString(),
//                   style: const TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 18,
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 5,
//                 ),
//                 Text(
//                   MyForum.fields.content,
//                   style: const TextStyle(
//                     fontSize: 16,
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//               ],
//             ),
//           ),
//           Column(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//                 child: Text('Back', style: TextStyle(color: Colors.white)),
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.deepPurple,
//                   minimumSize: const Size.fromHeight(60),
//                 ),
//               )
//             ],
//           ),
//         ]),
//       ),
//     );
//   }
// }

// class MyForumDetail extends StatelessWidget {
//   const MyForumDetail({super.key, required this.MyForum});

//   final MyForum;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Detail Stories'),
//       ),
//       drawer: buildDrawer(context),
//       body: FutureBuilder(
//         future: fetchMyReplies(MyForum.pk),
//         builder: (context, AsyncSnapshot snapshot) {
//           if (snapshot.data == null) {
//             return const Center(child: CircularProgressIndicator());
//           } else {
//             if (!snapshot.hasData) {
//               return Column(
//                 children: [
//                   Container(
//                     margin: const EdgeInsets.symmetric(
//                         horizontal: 20, vertical: 10),
//                     padding: const EdgeInsets.all(20),
//                     decoration: BoxDecoration(
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.grey.withOpacity(0.5),
//                           spreadRadius: 5,
//                           blurRadius: 7,
//                           offset:
//                               const Offset(0, 3), // changes position of shadow
//                         ),
//                       ],
//                       borderRadius: BorderRadius.circular(20),
//                       color: const Color.fromARGB(255, 165, 224, 167),
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.stretch,
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         Text(
//                           MyForum.fields.title,
//                           style: const TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 18,
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 5,
//                         ),
//                         Text(
//                           snapshot.data!,
//                           style: const TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 18,
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 20,
//                         ),
//                         Text(
//                           MyForum.fields.dateTime.toString(),
//                           style: const TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 18,
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 5,
//                         ),
//                         Text(
//                           MyForum.fields.content,
//                           style: const TextStyle(
//                             fontSize: 16,
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 20,
//                         ),
//                       ],
//                     ),
//                   ),
//                   const Text(
//                     "Tidak Ada Comment",
//                     style: TextStyle(color: Colors.deepPurple, fontSize: 20),
//                   ),
//                   const SizedBox(height: 8),
//                 ],
//               );
//             } else {
//               return ListView.builder(
//                 itemCount: snapshot.data!.length,
//                 itemBuilder: (_, i) => SingleChildScrollView(
//                   child: Stack(children: [
//                     Container(
//                       margin: const EdgeInsets.symmetric(
//                           horizontal: 20, vertical: 10),
//                       padding: const EdgeInsets.all(20),
//                       decoration: BoxDecoration(
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.grey.withOpacity(0.5),
//                             spreadRadius: 5,
//                             blurRadius: 7,
//                             offset: const Offset(
//                                 0, 3), // changes position of shadow
//                           ),
//                         ],
//                         borderRadius: BorderRadius.circular(20),
//                         color: const Color.fromARGB(255, 165, 224, 167),
//                       ),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.stretch,
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           Text(
//                             MyForum.fields.author.toString(),
//                             style: const TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize: 18,
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 5,
//                           ),
//                           Text(
//                             MyForum.fields.title.toString(),
//                             style: const TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize: 18,
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 20,
//                           ),
//                           Text(
//                             MyForum.fields.dateTime.toString(),
//                             style: const TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize: 18,
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 5,
//                           ),
//                           Text(
//                             MyForum.fields.content,
//                             style: const TextStyle(
//                               fontSize: 16,
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 20,
//                           ),
//                         ],
//                       ),
//                     ),
//                     Container(
//                       margin: const EdgeInsets.symmetric(
//                           horizontal: 20, vertical: 200),
//                       padding: const EdgeInsets.all(20),
//                       decoration: BoxDecoration(
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.grey.withOpacity(0.5),
//                             spreadRadius: 5,
//                             blurRadius: 7,
//                             offset: const Offset(
//                                 0, 3), // changes position of shadow
//                           ),
//                         ],
//                         borderRadius: BorderRadius.circular(20),
//                         color: const Color.fromARGB(255, 165, 224, 167),
//                       ),
//                       child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.stretch,
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                               children: const [
//                                 Text(
//                                   "COMMENT",
//                                   style: TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 18,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ]),
//                     ),
//                     Container(
//                       margin: const EdgeInsets.symmetric(
//                           horizontal: 20, vertical: 280),
//                       padding: const EdgeInsets.all(20),
//                       decoration: BoxDecoration(
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.grey.withOpacity(0.5),
//                             spreadRadius: 5,
//                             blurRadius: 7,
//                             offset: const Offset(
//                                 0, 3), // changes position of shadow
//                           ),
//                         ],
//                         borderRadius: BorderRadius.circular(20),
//                         color: const Color.fromARGB(255, 165, 224, 167),
//                       ),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.stretch,
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           Text(
//                             MyForum.fields.title,
//                             style: const TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize: 18,
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 5,
//                           ),
//                           Text(
//                             MyForum.fields.author.toString(),
//                             style: const TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize: 18,
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 20,
//                           ),
//                           Text(
//                             MyForum.fields.dateTime.toString(),
//                             style: const TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize: 18,
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 5,
//                           ),
//                           Text(
//                             MyForum.fields.content,
//                             style: const TextStyle(
//                               fontSize: 16,
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 20,
//                           ),
//                         ],
//                       ),
//                     ),
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: [
//                         ElevatedButton(
//                           onPressed: () {
//                             Navigator.pop(context);
//                           },
//                           child: Text('Back',
//                               style: TextStyle(color: Colors.white)),
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: Colors.deepPurple,
//                             minimumSize: const Size.fromHeight(60),
//                           ),
//                         )
//                       ],
//                     ),
//                   ]),
//                 ),
//               );
//             }
//           }
//         },
//       ),
//     );
//   }
// }


// import 'package:ruok/Stories/models/replies_models.dart';
// import 'package:ruok/Stories/models/stories_fetch.dart';
// import 'package:ruok/Stories/models/replies_fetch.dart';
// import 'package:ruok/Stories/models/stories_models.dart';
// import 'package:flutter/material.dart';

// import 'package:ruok/drawer.dart';

// class MyRepliesDetail extends StatelessWidget {
//   const MyRepliesDetail(
//       {super.key, required this.MyReplies, required this.MyForum});

//   final MyReplies;
//   final MyForum;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Detail Stories'),
//       ),
//       drawer: RuokDrawer(),
//       body: FutureBuilder(
//         future: fetchMyReplies(MyForum.pk),
//         builder: (context, AsyncSnapshot snapshot) {
//           if (snapshot.data == null) {
//             return const Center(child: CircularProgressIndicator());
//           } else {
//             if (!snapshot.hasData) {
//               return Column(
//                 children: [
//                   Container(
//                     margin: const EdgeInsets.symmetric(
//                         horizontal: 20, vertical: 10),
//                     padding: const EdgeInsets.all(20),
//                     decoration: BoxDecoration(
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.grey.withOpacity(0.5),
//                           spreadRadius: 5,
//                           blurRadius: 7,
//                           offset:
//                               const Offset(0, 3), // changes position of shadow
//                         ),
//                       ],
//                       borderRadius: BorderRadius.circular(20),
//                       color: const Color.fromARGB(255, 165, 224, 167),
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.stretch,
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         Text(
//                           MyForum.fields.title,
//                           style: const TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 18,
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 5,
//                         ),
//                         Text(
//                           snapshot.data!,
//                           style: const TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 18,
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 20,
//                         ),
//                         Text(
//                           MyForum.fields.dateTime.toString(),
//                           style: const TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 18,
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 5,
//                         ),
//                         Text(
//                           MyForum.fields.content,
//                           style: const TextStyle(
//                             fontSize: 16,
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 20,
//                         ),
//                       ],
//                     ),
//                   ),
//                   const Text(
//                     "Tidak Ada Comment",
//                     style: TextStyle(color: Colors.deepPurple, fontSize: 20),
//                   ),
//                   const SizedBox(height: 8),
//                 ],
//               );
//             } else {
//               return ListView.builder(
//                 itemCount: snapshot.data!.length,
//                 itemBuilder: (_, i) => SingleChildScrollView(
//                   child: Stack(children: [
//                     Container(
//                       margin: const EdgeInsets.symmetric(
//                           horizontal: 20, vertical: 10),
//                       padding: const EdgeInsets.all(20),
//                       decoration: BoxDecoration(
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.grey.withOpacity(0.5),
//                             spreadRadius: 5,
//                             blurRadius: 7,
//                             offset: const Offset(
//                                 0, 3), // changes position of shadow
//                           ),
//                         ],
//                         borderRadius: BorderRadius.circular(20),
//                         color: const Color.fromARGB(255, 165, 224, 167),
//                       ),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.stretch,
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           Text(
//                             MyForum.fields.author.toString(),
//                             style: const TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize: 18,
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 5,
//                           ),
//                           Text(
//                             MyForum.fields.title.toString(),
//                             style: const TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize: 18,
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 20,
//                           ),
//                           Text(
//                             MyForum.fields.dateTime.toString(),
//                             style: const TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize: 18,
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 5,
//                           ),
//                           Text(
//                             MyForum.fields.content,
//                             style: const TextStyle(
//                               fontSize: 16,
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 20,
//                           ),
//                         ],
//                       ),
//                     ),
//                     Container(
//                       margin: const EdgeInsets.symmetric(
//                           horizontal: 20, vertical: 200),
//                       padding: const EdgeInsets.all(20),
//                       decoration: BoxDecoration(
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.grey.withOpacity(0.5),
//                             spreadRadius: 5,
//                             blurRadius: 7,
//                             offset: const Offset(
//                                 0, 3), // changes position of shadow
//                           ),
//                         ],
//                         borderRadius: BorderRadius.circular(20),
//                         color: const Color.fromARGB(255, 165, 224, 167),
//                       ),
//                       child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.stretch,
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                               children: const [
//                                 Text(
//                                   "COMMENT",
//                                   style: TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 18,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ]),
//                     ),
//                     Container(
//                       margin: const EdgeInsets.symmetric(
//                           horizontal: 20, vertical: 280),
//                       padding: const EdgeInsets.all(20),
//                       decoration: BoxDecoration(
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.grey.withOpacity(0.5),
//                             spreadRadius: 5,
//                             blurRadius: 7,
//                             offset: const Offset(
//                                 0, 3), // changes position of shadow
//                           ),
//                         ],
//                         borderRadius: BorderRadius.circular(20),
//                         color: const Color.fromARGB(255, 165, 224, 167),
//                       ),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.stretch,
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           Text(
//                             MyForum.fields.title,
//                             style: const TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize: 18,
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 5,
//                           ),
//                           Text(
//                             MyForum.fields.author.toString(),
//                             style: const TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize: 18,
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 20,
//                           ),
//                           Text(
//                             MyForum.fields.dateTime.toString(),
//                             style: const TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize: 18,
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 5,
//                           ),
//                           Text(
//                             MyForum.fields.content,
//                             style: const TextStyle(
//                               fontSize: 16,
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 20,
//                           ),
//                         ],
//                       ),
//                     ),
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: [
//                         ElevatedButton(
//                           onPressed: () {
//                             Navigator.pop(context);
//                           },
//                           child: Text('Back',
//                               style: TextStyle(color: Colors.white)),
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: Colors.deepPurple,
//                             minimumSize: const Size.fromHeight(60),
//                           ),
//                         )
//                       ],
//                     ),
//                   ]),
//                 ),
//               );
//             }
//           }
//         },
//       ),
//     );
//   }
// }


// // class MyRepliesDetail extends StatelessWidget {
// //   const MyRepliesDetail({super.key, required this.MyForum});

// //   final MyForum;

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text('Detail Stories'),
// //       ),
// //       drawer: buildDrawer(context),
// //       body: SingleChildScrollView(
// //         child: Stack(children: [
// //           Container(
// //             margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
// //             padding: const EdgeInsets.all(20),
// //             decoration: BoxDecoration(
// //               boxShadow: [
// //                 BoxShadow(
// //                   color: Colors.grey.withOpacity(0.5),
// //                   spreadRadius: 5,
// //                   blurRadius: 7,
// //                   offset: const Offset(0, 3), // changes position of shadow
// //                 ),
// //               ],
// //               borderRadius: BorderRadius.circular(20),
// //               color: const Color.fromARGB(255, 165, 224, 167),
// //             ),
// //             child: Column(
// //               crossAxisAlignment: CrossAxisAlignment.stretch,
// //               mainAxisSize: MainAxisSize.min,
// //               children: [
// //                 Text(
// //                   MyForum.fields.title,
// //                   style: const TextStyle(
// //                     fontWeight: FontWeight.bold,
// //                     fontSize: 18,
// //                   ),
// //                 ),
// //                 const SizedBox(
// //                   height: 5,
// //                 ),
// //                 Text(
// //                   MyForum.fields.author.toString(),
// //                   style: const TextStyle(
// //                     fontWeight: FontWeight.bold,
// //                     fontSize: 18,
// //                   ),
// //                 ),
// //                 const SizedBox(
// //                   height: 20,
// //                 ),
// //                 Text(
// //                   MyForum.fields.dateTime.toString(),
// //                   style: const TextStyle(
// //                     fontWeight: FontWeight.bold,
// //                     fontSize: 18,
// //                   ),
// //                 ),
// //                 const SizedBox(
// //                   height: 5,
// //                 ),
// //                 Text(
// //                   MyForum.fields.content,
// //                   style: const TextStyle(
// //                     fontSize: 16,
// //                   ),
// //                 ),
// //                 const SizedBox(
// //                   height: 20,
// //                 ),
// //               ],
// //             ),
// //           ),
// //           Container(
// //             margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 200),
// //             padding: const EdgeInsets.all(20),
// //             decoration: BoxDecoration(
// //               boxShadow: [
// //                 BoxShadow(
// //                   color: Colors.grey.withOpacity(0.5),
// //                   spreadRadius: 5,
// //                   blurRadius: 7,
// //                   offset: const Offset(0, 3), // changes position of shadow
// //                 ),
// //               ],
// //               borderRadius: BorderRadius.circular(20),
// //               color: const Color.fromARGB(255, 165, 224, 167),
// //             ),
// //             child: Column(
// //                 crossAxisAlignment: CrossAxisAlignment.stretch,
// //                 mainAxisSize: MainAxisSize.min,
// //                 children: [
// //                   Row(
// //                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //                     children: const [
// //                       Text(
// //                         "COMMENT",
// //                         style: TextStyle(
// //                           fontWeight: FontWeight.bold,
// //                           fontSize: 18,
// //                         ),
// //                       ),
// //                     ],
// //                   ),
// //                 ]),
// //           ),
// //           Container(
// //             margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 280),
// //             padding: const EdgeInsets.all(20),
// //             decoration: BoxDecoration(
// //               boxShadow: [
// //                 BoxShadow(
// //                   color: Colors.grey.withOpacity(0.5),
// //                   spreadRadius: 5,
// //                   blurRadius: 7,
// //                   offset: const Offset(0, 3), // changes position of shadow
// //                 ),
// //               ],
// //               borderRadius: BorderRadius.circular(20),
// //               color: const Color.fromARGB(255, 165, 224, 167),
// //             ),
// //             child: Column(
// //               crossAxisAlignment: CrossAxisAlignment.stretch,
// //               mainAxisSize: MainAxisSize.min,
// //               children: [
// //                 Text(
// //                   MyForum.fields.author.toString(),
// //                   style: const TextStyle(
// //                     fontWeight: FontWeight.bold,
// //                     fontSize: 18,
// //                   ),
// //                 ),
// //                 const SizedBox(
// //                   height: 5,
// //                 ),
// //                 Text(
// //                   MyForum.fields.title.toString(),
// //                   style: const TextStyle(
// //                     fontWeight: FontWeight.bold,
// //                     fontSize: 18,
// //                   ),
// //                 ),
// //                 const SizedBox(
// //                   height: 20,
// //                 ),
// //                 Text(
// //                   MyForum.fields.dateTime.toString(),
// //                   style: const TextStyle(
// //                     fontWeight: FontWeight.bold,
// //                     fontSize: 18,
// //                   ),
// //                 ),
// //                 const SizedBox(
// //                   height: 5,
// //                 ),
// //                 Text(
// //                   MyForum.fields.content,
// //                   style: const TextStyle(
// //                     fontSize: 16,
// //                   ),
// //                 ),
// //                 const SizedBox(
// //                   height: 20,
// //                 ),
// //               ],
// //             ),
// //           ),
// //           Column(
// //             mainAxisAlignment: MainAxisAlignment.end,
// //             children: [
// //               ElevatedButton(
// //                 onPressed: () {
// //                   Navigator.pop(context);
// //                 },
// //                 child: Text('Back', style: TextStyle(color: Colors.white)),
// //                 style: ElevatedButton.styleFrom(
// //                   backgroundColor: Colors.deepPurple,
// //                   minimumSize: const Size.fromHeight(60),
// //                 ),
// //               )
// //             ],
// //           ),
// //         ]),
// //       ),
// //     );
// //   }
// // }