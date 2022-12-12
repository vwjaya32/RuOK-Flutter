import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class EventForm extends StatefulWidget {
  const EventForm({Key? key}) : super(key:key);

  @override
  State<EventForm> createState() => _EventFormState();
}

class _EventFormState extends State<EventForm> {
  static const purple = Color(0xFF613FE5);
  final _formKey = GlobalKey<FormState>();
  String? _name = "";
  String? _description = "";
  DateTime _date = DateTime.now();
  int _hour = 0;
  int _minute = 0;

  Future<void> submit(BuildContext context) async {
    final response = await http.post(
        Uri.parse('https://ruok.up.railway.app/com_events/add_flutter/'),
        headers: <String, String>{'Content-Type': 'application/json'},
        body: jsonEncode(<String, dynamic>{
          'name': _name,
          'description': _description,
          'date': '${_date.year.toString().padLeft(4,'0')}-${_date.month.toString().padLeft(2, '0')}-${_date.day.toString().padLeft(2, '0')} ${_hour}:${_minute}'
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: purple,
        title: const Text('Add Community Events'),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  children: const [
                    Text("Enter Event's Name:",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                  ],
                ),
                TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0))
                    ),
                    onChanged: (String? value){
                      setState(() {
                        _name = value!;
                      });
                    },
                    onSaved: (String? value){
                      setState(() {
                        _name = value!;
                      });
                    },
                    validator: (String? value){
                      if (value ==  null || value.isEmpty){
                        return 'Nama Event tidak boleh kosong!';
                      }
                      return null;
                    },
                  ),
                  Row(
                    children: const [Text('')],
                  ),
                  Row(
                  children: const [
                    Text("Enter Event's Description:",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),)
                  ],
                ),
                TextFormField(
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0))
                    ),
                    onChanged: (String? value){
                      setState(() {
                        _description = value!;
                      });
                    },
                    onSaved: (String? value){
                      setState(() {
                        _description = value!;
                      });
                    },
                    validator: (String? value){
                      if (value ==  null || value.isEmpty){
                        return 'Deskripsi Event tidak boleh kosong!';
                      }
                      return null;
                    },
                  ),
                  Row(
                    children: const [Text('')],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                    const Text("Event's Date: ",
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                    const SizedBox(width: 2,),
                    SizedBox(
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: purple),
                    child: const Text('Select Date',
                    style: TextStyle(fontSize: 20),),
                    onPressed: () async {
                      DateTime? newDate = await showDatePicker(
                          context: context,
                          initialDate: _date,
                          firstDate: DateTime(1900),
                          lastDate: DateTime(2100));
                      if (newDate == null) return;
                      setState(() => _date = newDate);
                    }),
                    ),
                    ],
                  ),
                  Row(
                    children: const [Text('')],
                  ),
                  Row(
                  children: const [
                    Text("Enter Event's Time: ",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),)
                  ],),
                  Row(
                    children: [
                      SizedBox(
                      height: 50,
                      width: 100,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: "Jam",
                          border:OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            )
                        ),
                        onChanged: (String? value){
                          setState(() {
                            _hour = value!.isEmpty ? 0 : int.parse(value);
                          });
                        },
                        onSaved: (String? value){
                          setState(() {
                            _hour = value!.isEmpty ? 0 : int.parse(value);
                          });
                        },
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Waktu tidak boleh kosong!';
                          }
                            return null;
                        },
                      ),
                    ),
                    const SizedBox(width: 20),
                    SizedBox(
                      height: 50,
                      width: 100,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: "Menit",
                          border:OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            )
                        ),
                        onChanged: (String? value){
                          setState(() {
                            _minute = value!.isEmpty ? 0 : int.parse(value);
                          });
                        },
                        onSaved: (String? value){
                          setState(() {
                            _minute = value!.isEmpty ? 0 : int.parse(value);
                          });
                        },
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Waktu tidak boleh kosong!';
                          }
                            return null;
                        },
                      ),
                    )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                     TextButton(
                      child: const Text('Simpan', style: TextStyle(color: purple),),
                      onPressed: (){
                        if(_formKey.currentState!.validate()){
                          submit(context);
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
                                      child: const Text('Back'),
                                      onPressed: () {
                                        Navigator.pop(context);
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