import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import '../data/model/welcome_model.dart';
import '../data/repo/welcome_repo.dart';
import 'welcome_state.dart';

class WelcomeCubit extends Cubit<WelcomeState> {
  final WelcomeRepository _welcomeRepository;

  WelcomeCubit(this._welcomeRepository) : super(WelcomeInitial());

  void loadWelcomeData() async {
    emit(WelcomeLoading());

    final Either<String, WelcomeModel> result = await _welcomeRepository.fetchWelcomeData();

    result.fold(
          (failure) => emit(WelcomeFailure(failure)),
          (data) => emit(WelcomeSuccess(data)),
    );
  }

  void navigateToRegister(context) {
    Navigator.pushReplacementNamed(context, '/register');
  }
}
