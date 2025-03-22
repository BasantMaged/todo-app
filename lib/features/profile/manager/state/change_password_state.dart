abstract class ChangePasswordState {}

class ChangePasswordInitial extends ChangePasswordState {}

class ChangePasswordLoading extends ChangePasswordState {}

class ChangePasswordSuccess extends ChangePasswordState {
  final String message;

  ChangePasswordSuccess({required this.message});
}

class ChangePasswordError extends ChangePasswordState {
  final String errorMessage;

  ChangePasswordError({required this.errorMessage});
}
