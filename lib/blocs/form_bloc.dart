import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:time_managment_flutter/services/auth_service.dart';
import 'package:rxdart/rxdart.dart';

import '../mixins/validation_mixin.dart';

class FormBloc with ValidationMixin {
  final _email = new BehaviorSubject<String>();
  final _password = new BehaviorSubject<String>();
  final _errorMessage = new BehaviorSubject<String>();

  // getters: Changers
  Function(String) get changeEmail {
    addError("");
    return _email.sink.add;
  }

  Function(String) get changePassword {
    addError("");
    return _password.sink.add;
  }

  Function(String) get addError => _errorMessage.sink.add;
  // getters: Add stream
  Stream<String> get email => _email.stream.transform(validatorEmail);
  Stream<String> get password => _password.stream.transform(validatorPassword);
  Stream<String> get errorMessage => _errorMessage.stream;

  Stream<bool> get submitValidForm => Rx.combineLatest3(
        email,
        password,
        errorMessage,
        (e, p, er) => true,
      );

  var authInfo;
  // rgister
  dynamic register(BuildContext context) async {
    authInfo = AuthService();
    final res = await authInfo.register(_email.value, _password.value);

    final data = jsonDecode(res.body) as Map<String, dynamic>;

    if (res.statusCode != 201) {
      addError(data['message']);
    } else {
    final res2 = await authInfo.login(_email.value, _password.value);
    final data2 = jsonDecode(res2.body) as Map<String, dynamic>;
    AuthService.setToken(data2['token'], data2['refreshToken']);
    Navigator.pushReplacementNamed(context, '/');

    return data2;
    }
  }

  // login
  dynamic login(BuildContext context) async {
    authInfo = AuthService();

    final res = await authInfo.login(_email.value, _password.value);
    final data = jsonDecode(res.body) as Map<String, dynamic>;
    if (res.statusCode != 200) {
      addError(data['message']);
    } else {
      AuthService.setToken(data['token'], data['refreshToken']);
      Navigator.pushReplacementNamed(context, '/');
      return data;
    }
  }

  // close streams
  dispose() {
    _email.close();
    _password.close();
    _errorMessage.close();
  }
}