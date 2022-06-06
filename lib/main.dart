import 'package:flutter/material.dart';
import 'package:time_managment_flutter/models/Task.dart';
import 'package:time_managment_flutter/screens/LoginScreen.dart';
import 'package:time_managment_flutter/screens/ProfilePage.dart';
import 'package:time_managment_flutter/screens/SignUpScreen.dart';
import 'package:time_managment_flutter/screens/detailTask.dart';
import 'package:time_managment_flutter/screens/HomePage.dart';
import 'package:time_managment_flutter/screens/forgot_password_screen.dart';
import 'package:time_managment_flutter/testing.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
 @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Login_bloc_screen',
        darkTheme: ThemeData.dark(),
    //    themeMode: ThemeMode.dark,
        initialRoute: '/testing',
        onGenerateRoute: onGenerateRoute,
      );
  }

  Route? onGenerateRoute(RouteSettings routeSettings) {
   if (routeSettings.name == '/detail') {
               final value = routeSettings.arguments as Task; // Retrieve the value.
      return MaterialPageRoute(builder: (context) => DetailTask(value));
   }

  
    else if (routeSettings.name == '/login') {
      return MaterialPageRoute(builder: (_) => LoginPage());
    }

    else if(routeSettings.name == '/home') {
    return MaterialPageRoute(builder: (context) => MyHomePage());
    }
   else if(routeSettings.name == '/signup') {
     return MaterialPageRoute(builder: (context) => SignUpPage());
   } else if(routeSettings.name == '/testing') {
     return MaterialPageRoute(builder: (context) => Home());
   }
   //else if(routeSettings.name == '/profile') {
  //   return MaterialPageRoute(builder: (context) => ProfilePage(user: null,));
  // }
    else {
    return null;
    }
  }
}