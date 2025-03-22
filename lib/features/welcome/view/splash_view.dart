import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:update_to_do_app/core/constants/app_constants.dart';
import 'package:update_to_do_app/core/local/local_data.dart';
import 'package:update_to_do_app/core/utils/app_assets.dart';
import 'package:update_to_do_app/core/utils/app_sizes.dart';
import 'package:update_to_do_app/features/welcome/view/welcome_view.dart';
import 'package:update_to_do_app/features/home/view/home_view.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    _navigateToNextScreen();

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            child: Image.asset(AppAssets.splashLogo, fit: BoxFit.contain),
          ),
          const SizedBox(height: AppSizes.h45),
          Text(AppConstants.appName, textAlign: TextAlign.center),
        ],
      ),
    );
  }

  void _navigateToNextScreen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('access_token');
    print("Stored Token: $token"); // Debugging
    // Check login state

    Future.delayed(const Duration(seconds: 3), () {
      if (token != null && token.isNotEmpty) {
        print("Navigating to Home Screen");
        Get.offAll(
          () => HomeView(userName: LocalData.userName ?? "Guest"),
        ); // Navigate to Home if logged in
      } else {
        print("Navigating to Welcome Screen");

        Get.offAll(() => WelcomeScreen()); // Otherwise, go to WelcomeScreen
      }
    });
  }
}
