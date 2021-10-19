import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:time_managment_flutter/main.dart';
class DetailTask extends StatelessWidget {
  const DetailTask(this.arguments, { Key? key}) : super(key: key);
 // final  Map<String, Object> rcvdData = ModalRoute.of(context).settings.arguments;
  final ScreenArguments arguments;


  @override
  Widget build(BuildContext context) {
    final x = arguments.element;
    return Scaffold(
      appBar:  AppBar(
        title: Text("Multi Page Application"),
      ),
      body: Text("G")
    );
  }
}

