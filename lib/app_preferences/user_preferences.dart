import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_template/models/user.dart';

class UserPreferences {
  static Future saveUser(User user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("token", user.token);
    return;
  }

  static Future<User?> getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");
    if (token == null) {
      return null;
    } else {
      return User(
        token: token,
      );
    }
  }

  static void removeUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("token");
  }
}
