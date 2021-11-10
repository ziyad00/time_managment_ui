import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:time_managment_flutter/blocs/TaskManager.dart';
import 'package:time_managment_flutter/models/Task.dart';
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
 // late final ScrollController  _controller;
  final DateTime date = DateTime(2019);
  final DateTime now = DateTime.now();
  final taskService = TaskService();
  bool _isLoading = false;
  List<String> _dummy = List.generate(20, (index) => 'Item $index');
  final TaskManager manager = TaskManager();




 /* _printing()async {
    var x = await taskService.get_all();
    final data = jsonDecode(x.body) as Map<dynamic, dynamic>;
    data['tasks'].forEach((task) => tasks.add(task));
    print(tasks);
    return tasks;
  }
  */
  something() async {
        var x = await TaskService.get_all();
        print("objectnssnsn");
        
        print(x[0].toString());
  }
    @override
    void initState() {
      super.initState();
      something();
     //   _controller.addListener(_onScroll);


    /*  print("starter");
      print(tasks);
    streamController = StreamController.broadcast();

    streamController.stream.listen((p) => setState(() => tasks.add(p)));

    TaskService.get_all(streamController);
    print("end");
    print(tasks);
    */
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
        body: StreamBuilder<dynamic>(
          stream: manager.TaskListView,
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            List<Widget> children;
            if (snapshot.hasError) {
              children = <Widget>[
                const Icon(
                  Icons.error_outline,
                  color: Colors.red,
                  size: 60,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Text('Error: ${snapshot.error}'),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text('Stack trace: ${snapshot.stackTrace}'),
                ),
              ];
            } else {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  children = const <Widget>[
                    Icon(
                      Icons.info,
                      color: Colors.blue,
                      size: 60,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 16),
                      child: Text('Select a lot'),
                    )
                  ];
                  break;
                case ConnectionState.waiting:
                  children = const <Widget>[
                    SizedBox(
                      child: CircularProgressIndicator(),
                      width: 60,
                      height: 60,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 16),
                      child: Text('Awaiting bids...'),
                    )
                  ];
                  break;
                case ConnectionState.active:
                  children = <Widget>[
                    const Icon(
                      Icons.check_circle_outline,
                      color: Colors.green,
                      size: 60,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Text('${snapshot.data.runtimeType} fjjjjjjjj'),
                    )
                  ];
                  break;
                case ConnectionState.done:
                  children = <Widget>[
                    const Icon(
                      Icons.info,
                      color: Colors.blue,
                      size: 60,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Text('\$${snapshot.data} (closed)'),
                    )
                  ];
                  break;
              }
            }

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: children,
            );
          },
        ),

   /*   body: ListView.separated(
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
      ),*/
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
    //_controller.dispose();
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

