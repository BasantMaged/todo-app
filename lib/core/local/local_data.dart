import 'package:shared_preferences/shared_preferences.dart';

class LocalData {
  static String? accessToken;
  static String? refreshToken;
  static String? userName;

  // Load saved tokens and user data
  static Future<void> loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    accessToken = prefs.getString('access_token');
    refreshToken = prefs.getString('refresh_token');
    userName = prefs.getString('user_name');
  }

  // Save tokens after login
  static Future<void> saveUserData({
    required String token,
    required String refresh,
    required String username,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('access_token', token);
    await prefs.setString('refresh_token', refresh);
    await prefs.setString('user_name', username);

    accessToken = token;
    refreshToken = refresh;
    userName = username;
  }

  // Clear tokens and user data on logout
  static Future<void> clear() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    accessToken = null;
    refreshToken = null;
    userName = null;
  }
}
