import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:time_managment_flutter/screens/detailTask.dart';
import 'package:time_managment_flutter/services/tasks_services.dart';
import 'package:http/http.dart' as http;



class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);
  final String title = "Home";

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final List<Task> tasks = [];
  late final StreamController<Task> streamController;
  final DateTime date = DateTime(2019);
  final DateTime now = DateTime.now();
  final taskService = TaskService();




 /* _printing()async {
    var x = await taskService.get_all();
    final data = jsonDecode(x.body) as Map<dynamic, dynamic>;
    data['tasks'].forEach((task) => tasks.add(task));
    print(tasks);
    return tasks;
  }
  */
    @override
    void initState() {
      super.initState();
      print("starter");
      print(tasks);
    streamController = StreamController.broadcast();

    streamController.stream.listen((p) => setState(() => tasks.add(p)));

    TaskService.get_all(streamController);
    print("end")
    print(tasks);
    //print(tasks);

    
  }
     
  _OnPressedAddList() {
   // setState(() {
      //this.tasks.add("dhdhhdhdhdhdh ");
   // });
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        automaticallyImplyLeading: false, // Used for removing back buttoon. 

      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(8),
        itemCount: tasks.length,
        itemBuilder: (BuildContext context, int index) {
          return new GestureDetector(
          //    onTap: () {
            //    Navigator.pushNamed(context, '/second',
              //      arguments: tasks[index]['task']['name'] );
              //},
              child: Row(
                children: <Widget>[
                  // Expanded(
            //        child: Text('${tasks[index].name} ',
              //          textAlign: TextAlign.center),
                //  ),
                  Expanded(
                    child: StreamBuilder(
                      initialData: "working", 
                      stream: _someData(date),
                      builder: (context, snapshot) {
                        return Text("Craft ${now.difference(date).inMilliseconds} ${snapshot.data.toString()}",
                      textAlign: TextAlign.center);

                        
                      },
                      ),
   
                  ),
                
                ],
              ));
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
    streamController?.close();
   // streamController = null;
  }
}



Stream<int> _someData(DateTime date) async* {
  yield* Stream.periodic(Duration(seconds: 1), (int a){
    final DateTime now = DateTime.now();
    a = now.difference(date).inSeconds;
    return a;
    //return a++;
  });
}

class Task {
  final String name;
  final bool status;
  final List tags;
  final double count;
  Task.fromJsonMap(Map map):
  name= map['task']['name'],
  status= map['task']['status'],
  tags= map['task']['tags'],
  count=map['task']['count']['countedTime'];
}