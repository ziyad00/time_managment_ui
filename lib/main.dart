import 'package:flutter/material.dart';
import 'package:time_managment_flutter/detailTask.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Time Manamgent',
  
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        
      ),
      initialRoute: '/',
      routes: {
          // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) =>  MyHomePage(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/second': (context) =>  DetailTask(ModalRoute.of(context)!.settings.arguments),
  },
//      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);



  final String title = "Home";

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
final List<String> entries = <String>['A', 'B', 'C'];
final List<int> colorCodes = <int>[600, 500, 100];
_OnPressedAddList() {
setState(() {
     this.entries.add(" ");

  });

  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),
        body: ListView.separated(
  padding: const EdgeInsets.all(8),
  itemCount: entries.length,
  itemBuilder: (BuildContext context, int index) {
    return new GestureDetector(
      onTap: (){
            Navigator.pushNamed(context, '/second',arguments: ScreenArguments(
                    entries[index]));
        },
      child: Row(
  children:  <Widget>[
    Expanded(
      child: Text("dddl ${entries[index]}", textAlign: TextAlign.center),
    ),
    Expanded(
      child: Text('Craft beautiful UIs', textAlign: TextAlign.center),
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
}

class ScreenArguments {
  final String element;

  ScreenArguments(this.element);
}