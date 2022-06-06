import 'package:flutter/material.dart';

class ongoingTask extends StatelessWidget {
  String name;
  String taskNum;
   ongoingTask({required this.name,required this.taskNum, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      
      child: Card(
        
        child: SizedBox(
          width: 300,
          height: 100,
          child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
                  Text(name),
                  SizedBox(height: 50),
                  Text(taskNum + " hour"),
            ],
          ),
          Row(
            
            children: [
              Container(
                    padding: const EdgeInsets.all(8),

                child: Icon(Icons.timer_sharp)),
              Text("10.00 pm - 11.00 pm"),

            ],
          )
                ],
              )),
        ),
      ),
    );
  }
}
