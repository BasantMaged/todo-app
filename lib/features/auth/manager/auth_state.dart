abstract class AuthState {}

class AuthInitialState extends AuthState {}

// Register States
class AuthRegisterLoading extends AuthState {}

class AuthRegisterSuccess extends AuthState {
  final String msg;
  AuthRegisterSuccess({required this.msg});
}

class AuthRegisterError extends AuthState {
  final String error;
  AuthRegisterError({required this.error});
}

// Login States
class AuthLoginLoading extends AuthState {}

class AuthLoginSuccess extends AuthState {}

class AuthLoginError extends AuthState {
  final String error;
  AuthLoginError({required this.error});
}
