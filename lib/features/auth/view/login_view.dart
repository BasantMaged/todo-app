import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:update_to_do_app/features/auth/manager/auth_cubit.dart';
import 'package:update_to_do_app/features/auth/manager/auth_state.dart';

class LoginView extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthFailure) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.error)));
          } else if (state is AuthSuccess) {
            Navigator.pushReplacementNamed(context, '/home');
          }
        },
        child: Column(
          children: [
            TextField(
              controller: usernameController,
              decoration: InputDecoration(hintText: 'Username'),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(hintText: 'Password'),
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: () {
                context.read<AuthCubit>().login(
                  usernameController.text,
                  passwordController.text,
                );
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
