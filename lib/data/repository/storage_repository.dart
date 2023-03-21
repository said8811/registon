import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageRepository {
  static StorageRepository? _storageUtil;
  static SharedPreferences? _preferences;
  static const String _authTokenKey = 'token';
  static Future<StorageRepository> getInstance() async {
    if (_storageUtil == null) {
      var secureStorage = StorageRepository._();
      await secureStorage._init();
      _storageUtil = secureStorage;
    }
    return _storageUtil!;
  }

  StorageRepository._();
  Future _init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static Future<bool> saveId(String id) async {
    final prefs = await SharedPreferences.getInstance();
    return await prefs.setString("id", id);
  }

  static Future<String> getId() async {
    final prefs = await SharedPreferences.getInstance();
    return await prefs.getString("id") ?? "";
  }

  static Future<bool> saveNavigate(String navigate) async {
    final prefs = await SharedPreferences.getInstance();
    return await prefs.setString("navigate", navigate);
  }

  static Future<String> getNavigate() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("navigate") ?? "/onBoarding";
  }

  static Future<bool> savetoken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    return await prefs.setString(_authTokenKey, token);
  }

  static Future<String> gettoken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_authTokenKey) ?? "";
  }

  Future<bool> clearStorage() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.clear();
  }

  static String getString(String key, {String defValue = ''}) {
    if (_preferences == null) return defValue;
    return _preferences!.getString(key) ?? defValue;
  }

  static Future<bool>? deleteString(String key) {
    debugPrint("Deleting...");
    if (_preferences == null) return null;
    return _preferences!.remove(key);
  }
}
