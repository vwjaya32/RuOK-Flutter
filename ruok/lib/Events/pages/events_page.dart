import 'package:flutter/material.dart';
import 'package:ruok/drawer.dart';
import 'package:ruok/Events/pages/events_list.dart';
import 'package:ruok/Events/pages/add_events_page.dart';

class EventPage extends StatefulWidget {
  const EventPage({Key? key}) : super(key:key);

  @override
  State<EventPage> createState() => EventPageState();
}

class EventPageState extends State<EventPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Community Events'),
      ),
      drawer: RuokDrawer(),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text('COMMUNITY EVENTS'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text('From the Community For the Community'),
                  ],
                ),
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
                    TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const EventForm()));
                      }, 
                      child: const Text('Add Events'))
                    ],)
                  ]),)
              ]),)),
      ),
    );
  }
}