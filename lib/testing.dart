import 'package:flutter/material.dart';
import 'package:time_managment_flutter/widgets/ongoingTask.dart';
import 'package:time_managment_flutter/widgets/task_card.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "My Task",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        body: Container(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(padding: EdgeInsets.all(25.0), child: Text("Categories")),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                taskCard(name: 'meeting', taskNum: '5 tasks'),
                taskCard(name: 'habits', taskNum: '11 tasks'),
              ],
            ),
            Container(
                padding: EdgeInsets.all(25.0), child: Text("Ongoing tasks")),
                
            
Expanded(
  child:   ListView(
  
    padding: const EdgeInsets.all(8),
  
    children: <Widget>[
  
      ongoingTask(name: 'task 1', taskNum: '1',),
  
      ongoingTask(name: 'task 1', taskNum: '1',),
  
      ongoingTask(name: 'task 1', taskNum: '1',),
      
  
    ],
  
  ),
)
          ],
        )));
  }
}
