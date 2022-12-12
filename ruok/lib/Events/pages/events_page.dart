import 'package:flutter/material.dart';
import 'package:ruok/drawer.dart';
import 'package:ruok/Events/pages/events_list.dart';
import 'package:ruok/Events/pages/add_events_page.dart';
import 'package:provider/provider.dart';
import 'package:ruok/providers/user_provider.dart';

class EventPage extends StatefulWidget {
  const EventPage({Key? key}) : super(key:key);

  @override
  State<EventPage> createState() => EventPageState();
}

class EventPageState extends State<EventPage> {

  @override
  Widget build(BuildContext context) {
    final user = context.watch<UserProvider>();
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Halo ${user.user.username}!'),
      ),
      drawer: RuokDrawer(),
      body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                const Padding(
                  padding:EdgeInsets.only(top: 20),
                  child:Text('COMMUNITY EVENTS', style: TextStyle(fontSize: 80),)),
                const Padding(
                  padding: EdgeInsets.only(bottom: 30),
                  child: Text('From the Community For the Community', style: TextStyle(fontSize: 30),),),
                Padding(padding: const EdgeInsets.only(top: 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      TextButton(
                        onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const EventList()));
                      }, 
                      child: const Text('List Of Events')),
                      Visibility(child: user.user.username != 'guest'
                      ? TextButton(
                        onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const EventForm()));
                      }, 
                      child: const Text('Add Events'))
                      : const Text(''))
                    ],)
                  ]),)
              ]),)),
    );
  }
}