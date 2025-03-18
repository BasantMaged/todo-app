import 'package:flutter/material.dart';
import 'package:update_to_do_app/core/constants/app_constants.dart';
import 'package:update_to_do_app/core/utils/app_assets.dart';
import 'package:update_to_do_app/core/utils/app_sizes.dart';
import 'package:update_to_do_app/core/helper/my_navigator.dart';
import 'package:update_to_do_app/features/welcome/view/welcome_view.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      // ignore: use_build_context_synchronously
      MyNavigator.navigateTo(context, WelcomeScreen());
    });

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
}

  
  



/*import 'dart:async';
import 'package:flutter/material.dart';
import 'package:update_to_do_app/core/utils/app_assets.dart';
import 'package:update_to_do_app/features/welcome/view/welcome_view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Wait for 3 seconds and navigate to WelcomeScreen
    Timer(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const WelcomeScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          AppAssets.splashLogo, // Ensure this path is correct

          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
*/



