import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:time_managment_flutter/models/Task.dart';
import 'package:time_managment_flutter/screens/HomePage.dart';

class DetailTask extends StatefulWidget {
    final Task task;

  const DetailTask(this.task, {Key? key}) : super(key: key);

  @override
  DetailTaskState createState() {
    return DetailTaskState();
  }
}
class DetailTaskState extends State<DetailTask> {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: Text("Task Detail"),
      ),
      body:  Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
 TextFormField(
  decoration: InputDecoration(
    border: OutlineInputBorder(),
    labelText: 'Name',
    hintText: widget.task.name,
  ),
  
), TextFormField(
  decoration: InputDecoration(
    border: OutlineInputBorder(),
    labelText: 'description',
    hintText: 'some text based',
  ),
  
),
 TextFormField(
  decoration: InputDecoration(
    border: OutlineInputBorder(),
    labelText: 'Tags',
    hintText: 'sport, gaming',
  ),
  
),Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                // Validate returns true if the form is valid, or false otherwise.
                if (_formKey.currentState!.validate()) {
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );
                }
              },
              child: const Text('Submit'),
            ),
          ),
        ],
      ),
    )
      
      
      /*ListView(
  padding: const EdgeInsets.all(8),
  children: <Widget>[
    Container(
      height: 50,
      child: const Center(child: const TextField(
  decoration: InputDecoration(
    border: OutlineInputBorder(),
    labelText: 'Name',
    hintText: 'Task 1',
  ),
  
)),
    ),
    Container(
      height: 50,
      child: const Center(child: const TextField(
  decoration: InputDecoration(
    border: OutlineInputBorder(),
    labelText: 'description',
    hintText: 'some text based',
  ),
  
)),
    ),
    Container(
      height: 50,
      child: const Center(child: const TextField(
  decoration: InputDecoration(
    border: OutlineInputBorder(),
    labelText: 'Tags',
    hintText: 'sport, gaming',
  ),
  
)),
    ),
  ],
)*/
    );
  }
}

