import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_template/app_preferences/user_preferences.dart';
import 'package:flutter_template/models/user.dart';
import 'package:flutter_template/provider/res_provider.dart';
import 'package:http/http.dart';

enum AuthStatus {
  loggedOut,
  loggingIn,
  loginFail,
  loggedIn,
  registering,
  registerFail,
  registered,
}

class AuthProvider with ChangeNotifier {
  AuthStatus _authStatus = AuthStatus.loggedOut;
  AuthStatus get authStatus => _authStatus;

  Future<Map<String, Object>> login({
    required String username,
    required String password,
  }) async {
    _authStatus = AuthStatus.loggingIn;
    notifyListeners();

    Response response = await post(
      Uri.parse(ResProvider.urls.login),
      headers: {
        'Content-Type': 'application/json',
      },
      body: {
        'username': username,
        'password': password,
      },
    );

    switch (response.statusCode) {
      case 200:
      case 201:
      case 204:
        try {
          User user = User.fromJson((json.decode(response.body)));
          UserPreferences.saveUser(user);
          _authStatus = AuthStatus.loggedIn;
          notifyListeners();
          return {'status': 'ok', 'user': user};
        } catch (e) {
          return {'status': 'bad response'};
        }

      case 401:
      case 403:
        _authStatus = AuthStatus.loginFail;
        notifyListeners();
        return {'status': 'unauthorized'};
      case 404:
      default:
        _authStatus = AuthStatus.loginFail;
        notifyListeners();
        return {'status': 'connection error'};
    }
  }

  Future<Map<String, Object>> register({
    required String email,
    required String username,
    required String password,
  }) async {
    _authStatus = AuthStatus.registering;
    notifyListeners();

    Response response = await post(
      Uri.parse(ResProvider.urls.register),
      headers: {
        'Content-Type': 'application/json',
      },
      body: {
        'email': email,
        'username': username,
        'password': password,
      },
    );

    switch (response.statusCode) {
      case 200:
      case 201:
      case 204:
        try {
          User user = User.fromJson((json.decode(response.body)));
          UserPreferences.saveUser(user);
          _authStatus = AuthStatus.registered;
          notifyListeners();
          return {'status': 'ok', 'user': user};
        } catch (e) {
          return {'status': 'bad response'};
        }

      case 401:
      case 403:
        _authStatus = AuthStatus.registerFail;
        notifyListeners();
        return {'status': 'unauthorized'};
      case 404:
      default:
        _authStatus = AuthStatus.registerFail;
        notifyListeners();
        return {'status': 'connection error'};
    }
  }
}
