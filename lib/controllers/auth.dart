import 'dart:async';
import 'dart:convert';
import 'package:flutter_template/app_preferences/user_preferences.dart';
import 'package:flutter_template/models/user.dart';
import 'package:flutter_template/res.dart';
import 'package:get/get.dart';

enum AuthStatus {
  loggedOut,
  loggingIn,
  loginFail,
  loggedIn,
  registering,
  registerFail,
  registered,
}

class Auth extends GetxController {
  GetConnect gc = GetConnect();
  AuthStatus _authStatus = AuthStatus.loggedOut;
  AuthStatus get authStatus => _authStatus;

  Future<Map<String, Object>> login({
    required String username,
    required String password,
  }) async {
    _authStatus = AuthStatus.loggingIn;
    update();

    Response response = await gc.post(
      Res.urls.login,
      {
        'username': username,
        'password': password,
      },
      headers: {
        'Content-Type': 'application/json',
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
          update();
          return {'status': 'ok', 'user': user};
        } catch (e) {
          return {'status': 'bad response'};
        }

      case 401:
      case 403:
        _authStatus = AuthStatus.loginFail;
        update();
        return {'status': 'unauthorized'};
      case 404:
      default:
        _authStatus = AuthStatus.loginFail;
        update();
        return {'status': 'connection error'};
    }
  }

  Future<Map<String, Object>> register({
    required String email,
    required String username,
    required String password,
  }) async {
    _authStatus = AuthStatus.registering;
    update();

    Response response = await gc.post(
      Res.urls.register,
      {
        'email': email,
        'username': username,
        'password': password,
      },
      headers: {
        'Content-Type': 'application/json',
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
          update();
          return {'status': 'ok', 'user': user};
        } catch (e) {
          return {'status': 'bad response'};
        }

      case 401:
      case 403:
        _authStatus = AuthStatus.registerFail;
        update();
        return {'status': 'unauthorized'};
      case 404:
      default:
        _authStatus = AuthStatus.registerFail;
        update();
        return {'status': 'connection error'};
    }
  }
}
