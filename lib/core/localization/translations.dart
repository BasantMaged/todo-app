import 'package:get/get.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en': {'settings': 'Settings', 'language': 'Language'},
    'ar': {'settings': 'الإعدادات', 'language': 'اللغة'},
  };
}
