import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:update_to_do_app/features/auth/manager/auth_cubit.dart';
import 'package:update_to_do_app/features/auth/manager/auth_state.dart';

class RegisterView extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

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
            Navigator.pushReplacementNamed(context, '/login');
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
            TextField(
              controller: confirmPasswordController,
              decoration: InputDecoration(hintText: 'Confirm Password'),
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: () {
                if (passwordController.text == confirmPasswordController.text) {
                  context.read<AuthCubit>().register(
                    usernameController.text,
                    passwordController.text,
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Passwords do not match')),
                  );
                }
              },
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
