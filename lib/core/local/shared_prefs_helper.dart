import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsHelper {
  static SharedPrefsHelper? _instance;
  static SharedPreferences? _prefs;

  // Private constructor
  SharedPrefsHelper._();

  /// Singleton Instance
  static Future<SharedPrefsHelper> getInstance() async {
    _instance ??= SharedPrefsHelper._();
    _prefs ??= await SharedPreferences.getInstance();
    return _instance!;
  }

  /// Save String Value
  Future<bool> setString(String key, String value) async {
    try {
      return await _prefs!.setString(key, value);
    } catch (e) {
      print("Error saving string [$key]: $e");
      return false;
    }
  }

  /// Get String Value
  String? getString(String key) {
    try {
      return _prefs!.getString(key);
    } catch (e) {
      print("Error retrieving string [$key]: $e");
      return null;
    }
  }

  /// Save Integer Value
  Future<bool> setInt(String key, int value) async {
    try {
      return await _prefs!.setInt(key, value);
    } catch (e) {
      print("Error saving int [$key]: $e");
      return false;
    }
  }

  /// Get Integer Value
  int? getInt(String key) {
    try {
      return _prefs!.getInt(key);
    } catch (e) {
      print("Error retrieving int [$key]: $e");
      return null;
    }
  }

  /// Save Boolean Value
  Future<bool> setBool(String key, bool value) async {
    try {
      return await _prefs!.setBool(key, value);
    } catch (e) {
      print("Error saving bool [$key]: $e");
      return false;
    }
  }

  /// Get Boolean Value
  bool? getBool(String key) {
    try {
      return _prefs!.getBool(key);
    } catch (e) {
      print("Error retrieving bool [$key]: $e");
      return null;
    }
  }

  /// Save Double Value
  Future<bool> setDouble(String key, double value) async {
    try {
      return await _prefs!.setDouble(key, value);
    } catch (e) {
      print("Error saving double [$key]: $e");
      return false;
    }
  }

  /// Get Double Value
  double? getDouble(String key) {
    try {
      return _prefs!.getDouble(key);
    } catch (e) {
      print("Error retrieving double [$key]: $e");
      return null;
    }
  }

  /// Save List of Strings
  Future<bool> setStringList(String key, List<String> value) async {
    try {
      return await _prefs!.setStringList(key, value);
    } catch (e) {
      print("Error saving string list [$key]: $e");
      return false;
    }
  }

  /// Get List of Strings
  List<String>? getStringList(String key) {
    try {
      return _prefs!.getStringList(key);
    } catch (e) {
      print("Error retrieving string list [$key]: $e");
      return null;
    }
  }

  /// Remove Key
  Future<bool> remove(String key) async {
    try {
      return await _prefs!.remove(key);
    } catch (e) {
      print("Error removing key [$key]: $e");
      return false;
    }
  }

  /// Clear All Data
  Future<bool> clearAll() async {
    try {
      return await _prefs!.clear();
    } catch (e) {
      print("Error clearing SharedPreferences: $e");
      return false;
    }
  }
}
