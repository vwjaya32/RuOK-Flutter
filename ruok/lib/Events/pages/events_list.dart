import 'package:flutter/material.dart';
import 'package:ruok/Events/models/com_events.dart';
import 'package:ruok/Events/utils/fetch_events.dart';
import 'package:provider/provider.dart';
import 'package:ruok/providers/user_provider.dart';

class EventList extends StatefulWidget {
  const EventList({Key? key}) : super(key:key);

  @override
  State<EventList> createState() => _EventDetailState();
}

class _EventDetailState extends State<EventList> {
  late Future<List<EventItem>> eventlist;

  @override
  void initState(){
    super.initState();
    eventlist = fetchEvents();
  }

  @override
  Widget build(BuildContext context) {
    final user = context.watch<UserProvider>();
    return Scaffold(
      appBar: AppBar(
        title: Text('List Of Events'),
      ),
      body: FutureBuilder(
        future: eventlist,
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {return const Center(child: CircularProgressIndicator());
          }else {
            if (!snapshot.hasData){
              return Column(children: const[Text('Tidak ada Event')],);
            }else{
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) => 
                Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16, vertical: 12
                  ),
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                  color: Colors.white, 
                  border: Border.all(
                    width: 2,
                    color: ((snapshot.data![index].fields.is_joined)
                        ? Colors.green
                        : Colors.black)
                    ),
                  boxShadow: [BoxShadow(
                    color: ((snapshot.data![index].fields.is_joined)
                        ? Colors.green
                        : Colors.black),
                        blurRadius: 5.0,)]),
                  child: GestureDetector(
                    onTap: (){
                      showDialog(
                      context: context,
                      builder: (context) {
                        return Dialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          elevation: 15,
                          child: Container(
                            child: ListView(
                              padding: const EdgeInsets.only(
                                  top: 20, bottom: 20),
                              shrinkWrap: true,
                              children: <Widget>[
                                Stack(
                                  children: [
                                    Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text('${snapshot.data![index].fields.name}',
                                            style: const TextStyle(fontSize: 35, fontWeight: FontWeight.bold),)
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text('${snapshot.data![index].fields.description}',
                                            )
                                          ],
                                        ),
                                        Row(children: const [Text('')],)
                                      ],
                                    )
                                  ],
                                ),
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text('Kembali'))
                              ],
                            ),
                          ),
                        );
                      });
                    },
                    child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [ 
                            Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('${snapshot.data![index].fields.name}',
                                style: const TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                    ),
                                  ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Text('Event Date: '),
                                Text('${snapshot.data![index].fields.date}'),
                              ],
                            )
                          ],)
                        ),
                      Visibility(child: user.user.username != 'guest'
                      ? TextButton(
                        child: snapshot.data![index].fields.is_joined ? Text('Unjoin') : Text('Join'),
                        onPressed: (){
                          showDialog(
                            context: context, 
                            builder: (context){
                              return Dialog(
                                shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              elevation: 15,
                              child: Container(
                                child: ListView(
                                  padding: const EdgeInsets.only(
                                  top: 20, bottom: 20),
                                  shrinkWrap: true,
                                  children: <Widget>[
                                    Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: const [
                                            Text('Are You Sure?', style: TextStyle(
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.bold,)),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            TextButton(onPressed: () {
                                              Navigator.pop(context);
                                              }, 
                                              child: const Text('No')),
                                            TextButton(onPressed: () {
                                              setState(() {
                                                snapshot.data![index].fields.is_joined = !snapshot.data![index].fields.is_joined;
                                              });
                                              Navigator.pop(context);
                                            }, child: const Text('Yes'))
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              );
                            });
                          }, 
                        )
                      : Text(''))
                    ],
                  ),
                )
              ));
            }
          }
        }
    ),);
  }
}