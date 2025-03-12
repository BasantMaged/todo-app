import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:update_to_do_app/features/welcome/manager/welcome_cubit.dart';
import 'package:update_to_do_app/features/welcome/manager/welcome_state.dart';
import 'package:update_to_do_app/core/utils/app_assets.dart';

import '../data/repo/welcome_repo.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WelcomeCubit(WelcomeRepository())..loadWelcomeData(),
      child: BlocBuilder<WelcomeCubit, WelcomeState>(
        builder: (context, state) {
          if (state is WelcomeLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is WelcomeFailure) {
            return Center(child: Text(state.error, style: TextStyle(color: Colors.red)));
          } else if (state is WelcomeSuccess) {
            return Scaffold(
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(AppAssets.welcomePage), // Your image asset
                    const SizedBox(height: 20),
                    const Text(
                      "Welcome To Do It!",
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Ready to conquer your tasks? Let's Do It together.",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: () {
                        context.read<WelcomeCubit>().navigateToRegister(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                      ),
                      child: const Text(
                        "Let's Start",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
