import 'package:flutter/material.dart';
import 'package:time_managment_flutter/providers/form_provider.dart';
import 'package:time_managment_flutter/screens/detailTask.dart';
import 'package:time_managment_flutter/screens/HomePage.dart';
import 'package:time_managment_flutter/screens/forgot_password_screen.dart';
import 'package:time_managment_flutter/screens/login.dart';
import 'package:time_managment_flutter/screens/signup_screen.dart';
import 'package:time_managment_flutter/screens/Home_screen.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
 @override
  Widget build(BuildContext context) {
    return FormProvider(
      child: MaterialApp(
        title: 'Login_bloc_screen',
        darkTheme: ThemeData.dark(),
        themeMode: ThemeMode.dark,
        initialRoute: '/login',
        onGenerateRoute: onGenerateRoute,
      ),
    );
  }

  Route? onGenerateRoute(RouteSettings routeSettings) {
   if (routeSettings.name == '/second') {
               final value = routeSettings.arguments as String; // Retrieve the value.
      return MaterialPageRoute(builder: (context) => DetailTask(value));
   }
    else if (routeSettings.name == '/login') {
      return MaterialPageRoute(builder: (context) => LoginScreen());
    }
  
    else if (routeSettings.name == '/forgot_password') {
      return MaterialPageRoute(builder: (_) => ForgotPassword());
    }
    else if (routeSettings.name == '/sign_up') {
      return MaterialPageRoute(builder: (_) => SignupScreen());
    }
    else if(routeSettings.name == '/') {
    return MaterialPageRoute(builder: (context) => MyHomePage());
    }
   
    else {
    return null;
    }
  }
}