import 'dart:async';
import 'dart:convert';

import 'package:flutter_session/flutter_session.dart';
import 'package:http/http.dart' as http;
import 'package:time_managment_flutter/models/Task.dart';
import 'package:time_managment_flutter/screens/HomePage.dart';
import 'package:time_managment_flutter/services/auth_service.dart';
class TaskService {
  final baseUrl = 'http://localhost:3000/tasks';
  // ignore: non_constant_identifier_names
  static final SESSION = FlutterSession();


  //Future<dynamic> get_all() async {
    //try {
      //var token = (await AuthService.getToken())['token'];
      //var res = await http.get(Uri.parse('$baseUrl/'), headers: {'Authorization':'bearer ${token}'});
      //var client = http.Client();
      //var req =  http.Request('get', Uri.parse(baseUrl));
    //  var streamRes = await client.send(req);
  // streamRes.stream.transofrm();
     // return res;
    //} finally {
      // done you can do something here
    //}
  //}

  static Future get_all() async {
    String url = "http://localhost:3000/tasks";
    var client =  http.Client();
    var token = (await AuthService.getToken())['token'];
    var userAgent = UserAgentClient(token, client);

   var req = await client.get(Uri.parse(url), headers: {'Authorization':'bearer ${token}'});
   // var req =  http.Request('get', Uri.parse(url) );

    //var streamedRes = await client.send(req);
    //var streamedRes = await userAgent.send(req);
   // streamedRes.stream
     //   .transform(utf8.decoder)
       // .transform(json.decoder)
     /*   .expand((e) {
          print("object");
            print("["+e.toString() +"]");
            var expanded = e  as Iterable<dynamic>;
            print("runtime");
            print(expanded.runtimeType);
           return expanded;
        })*/
      //  .map((map) => Task.fromJsonMap(map as Map))
       // .pipe(sc);
           final data = jsonDecode(req.body) ;
        List<dynamic> tasks = data['tasks'].map((json) => Task.fromJsonMap(json)).toList();
        print("sssss");
        print(tasks);
       return tasks;
  }

  Future<dynamic> login(String email, String password) async {
    try {
      var res = await http.post(
        Uri.parse('$baseUrl/auth/login'),
        body: {
          'email': email,
          'password': password,
        },
      );

      return res;
    } finally {
      // you can do somethig here
    }
  }

  static setToken(String token, String refreshToken) async {
    _AuthData data = _AuthData(token, refreshToken);
    await SESSION.set('tokens', data);
  }

  static Future<Map<String, dynamic>> getToken() async {
    return await SESSION.get('tokens');
  }

  static removeToken()async {
    await SESSION.prefs.clear();
  }
}

class _AuthData {
  String token, refreshToken;
  String? clientId;
  _AuthData(this.token, this.refreshToken, {this.clientId});

  // toJson
  // required by Session lib
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();

    data['token'] = token;
    data['refreshToken'] = refreshToken;
    data['clientId'] = clientId;
    return data;
  }
}
class UserAgentClient extends http.BaseClient {
  final String token;
  final http.Client _inner;

  UserAgentClient(this.token, this._inner);

  Future<http.StreamedResponse> send(http.BaseRequest request) {
    request.headers['Authorization'] = 'bearer ${token}';
    return _inner.send(request);
  }
}