import 'package:flutter/material.dart';
import 'package:time_managment_flutter/services/auth_service.dart';
class HomeScreen extends StatelessWidget {
  // render
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title:  Text("home"),
          automaticallyImplyLeading: false, // Used for removing back buttoon. 
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.only(top: 400),
          child: Column(
            children: [
              Text('Home Screen'),
              RaisedButton(
                child: Text('Log out'),
                onPressed: () {
                  Navigator.popAndPushNamed(context, '/login');
                  AuthService.removeToken();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}