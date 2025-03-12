import 'package:flutter/material.dart';
import 'package:update_to_do_app/features/welcome/view/splash_view.dart';
import 'package:update_to_do_app/features/welcome/view/welcome_view.dart';
import 'package:update_to_do_app/features/auth/view/register_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TODO APP',
      theme: ThemeData(fontFamily: 'LexendDeca'),
      initialRoute: '/', // Start with SplashScreen
      routes: {
        '/': (context) => const SplashScreen(),
        '/welcome': (context) => const WelcomeScreen(),
        '/register': (context) => RegisterView(), // Navigate to Register
      },
    );
  }
}
