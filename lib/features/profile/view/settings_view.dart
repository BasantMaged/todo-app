import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:update_to_do_app/core/localization/localization_service.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  final LocalizationService localizationService = Get.find();
  int selectedIndex = Get.locale?.languageCode == 'ar' ? 0 : 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('settings'.tr), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('language'.tr, style: const TextStyle(fontSize: 18)),
            ToggleButtons(
              borderRadius: BorderRadius.circular(12),
              selectedColor: Colors.white,
              fillColor: Colors.green,
              color: Colors.black54,
              isSelected: [selectedIndex == 0, selectedIndex == 1],
              onPressed: (int index) {
                setState(() {
                  selectedIndex = index;
                  localizationService.changeLanguage(index == 0 ? 'ar' : 'en');
                });
              },
              children: const [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Text("AR"),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Text("EN"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
