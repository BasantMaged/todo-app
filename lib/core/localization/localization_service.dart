import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class LocalizationService extends GetxController {
  static const String languageKey = "language";
  static final List<Locale> locales = [Locale('en'), Locale('ar')];

  // Load saved language preference
  Future<void> loadLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? langCode = prefs.getString(languageKey);
    if (langCode != null) {
      Get.updateLocale(Locale(langCode));
    }
  }

  // Change language and save preference
  void changeLanguage(String langCode) async {
    Get.updateLocale(Locale(langCode));
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(languageKey, langCode);
    update();
  }
}
