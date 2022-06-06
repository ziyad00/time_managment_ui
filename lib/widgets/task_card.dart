import 'package:flutter/material.dart';

class taskCard extends StatelessWidget {
  String name;
  String taskNum;
   taskCard({required this.name,required this.taskNum, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      
      child: Card(
        
        child: SizedBox(
          width: 100,
          height: 150,
          child: Center(
              child: Column(
               // mainAxisAlignment: MainAxisAlignment.s,
            children: [
              Text(name),
              SizedBox(height: 50),
              Text(taskNum),
            ],
          )),
        ),
      ),
    );
  }
}
