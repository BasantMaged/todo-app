import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:update_to_do_app/core/local/local_data.dart';
import 'package:update_to_do_app/features/auth/data/model/user_model.dart';
import 'package:update_to_do_app/features/auth/data/repo/auth_repo.dart';

import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit._internal() : super(AuthInitialState());

  static final AuthCubit _cubitInstance = AuthCubit._internal();
  factory AuthCubit() => _cubitInstance;

  static AuthCubit get(context) => BlocProvider.of(context);

  // Controllers for TextFields
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmController =
      TextEditingController();

  final AuthRepo authRepo = AuthRepo();

  // Register Function
  void onRegisterPressed() async {
    emit(AuthRegisterLoading());

    if (passwordController.text != passwordConfirmController.text) {
      emit(AuthRegisterError(error: "Passwords do not match!"));
      return;
    }

    var response = await authRepo.register(
      username: usernameController.text,
      password: passwordController.text,
    );

    response.fold(
      (String error) => emit(AuthRegisterError(error: error)),
      (String successMessage) => emit(AuthRegisterSuccess(msg: successMessage)),
    );
  }

  // Login Function
  void onLoginPressed() async {
    emit(AuthLoginLoading());

    var response = await authRepo.login(
      username: usernameController.text,
      password: passwordController.text,
    );

    response.fold((String error) => emit(AuthLoginError(error: error)), (
      UserModel user,
    ) {
      LocalData.userName = user.username; // Store username in Singleton
      emit(AuthLoginSuccess());
    });
  }
}
