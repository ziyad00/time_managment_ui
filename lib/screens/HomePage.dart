import 'dart:async';
import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:time_managment_flutter/models/Task.dart';
import 'package:time_managment_flutter/screens/detailTask.dart';
import 'package:http/http.dart' as http;
import 'package:time_managment_flutter/widgets/Drawer.dart';

class MyHomePage extends StatefulWidget {
  final String title = "Home";
  //final User user;

  // const MyHomePage({required this.user});
  const MyHomePage();

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final List<Task> tasks = [

  ];
  int x = 0;
  
  final DateTime now = DateTime.now();

  @override
  void initState() {
    super.initState();


  }

  _OnPressedAddList() {
    setState(() {
      for (var item in tasks) {
        if(item.status==true){
        item.stopCount();

        }
        item.status=false;
        
      }
      
      var task = Task(name: "name " + x.toString());
      x+=1;
      task.addCount();
      this.tasks.add(task);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        automaticallyImplyLeading: false, // Used for removing back buttoon.
      ),
      drawer: drawer(),

      body: ListView.separated(
        padding: const EdgeInsets.all(8),
        itemCount: tasks.length,
        itemBuilder: (BuildContext context, int index) {
          if (tasks[index].status == true) {
            var dateTask = tasks[index].dates?.last['start_time'];
            return  GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/detail',
                      arguments: tasks[index]);
                },
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text('${tasks[index].name} ',
                          textAlign: TextAlign.center),
                    ),
                    Expanded(
                      child: StreamBuilder(
                        initialData: "working",
                        stream: calcTimerPeriodically(dateTask!),
                        builder: (context, snapshot) {
                          return Text(
                              "${snapshot.data.toString()}",
                              textAlign: TextAlign.center);
                        },
                      ),
                    ),
                    Expanded(child: 
                     GestureDetector(
                onTap: () {
                  tasks[index].status=false;
                  tasks[index].stopCount();

                  setState(() {
                    
                  });

                },child:
                    Icon(Icons.stop_circle_outlined))
                )],
                ));
          } else {
            return new GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/detail',
                      arguments: tasks[index]);
                },
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text('${tasks[index].name} ',
                          textAlign: TextAlign.center),
                    ),
                    Expanded(
                        child: Text(
                            "Craft ${tasks[index].calcCount()}",
                            textAlign: TextAlign.center)),
                  ],
                ));
          }
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _OnPressedAddList,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}

Stream<int> calcTimerPeriodically(DateTime date) async* {
  yield* Stream.periodic(Duration(seconds: 1), (int a) {
    final DateTime now = DateTime.now();
    a = now.difference(date).inSeconds;
    return a;
  });
}


