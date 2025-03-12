import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:update_to_do_app/features/auth/data/repo/auth_repo.dart';
import 'package:update_to_do_app/features/auth/manager/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository repository;
  AuthCubit(this.repository) : super(AuthInitial());

  void register(String username, String password) async {
    emit(AuthLoading());
    final result = await repository.register(username, password);
    result.fold(
      (error) => emit(AuthFailure(error)),
      (user) => emit(AuthSuccess(user)),
    );
  }

  void login(String username, String password) async {
    emit(AuthLoading());
    final result = await repository.login(username, password);
    result.fold(
      (error) => emit(AuthFailure(error)),
      (user) => emit(AuthSuccess(user)),
    );
  }
}
