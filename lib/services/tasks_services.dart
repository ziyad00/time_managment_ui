import 'package:flutter_session/flutter_session.dart';
import 'package:http/http.dart' as http;
import 'package:time_managment_flutter/services/auth_service.dart';
class TaskService {
  final baseUrl = 'http://localhost:3000/tasks';
  // ignore: non_constant_identifier_names
  static final SESSION = FlutterSession();


  Future<dynamic> get_all() async {
    try {
      var token = (await AuthService.getToken())['token'];
      var res = await http.get(Uri.parse('$baseUrl/'), headers: {'Authorization':'bearer ${token}'});
      return res;
    } finally {
      // done you can do something here
    }
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