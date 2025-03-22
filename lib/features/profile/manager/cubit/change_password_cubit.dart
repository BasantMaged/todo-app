import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:update_to_do_app/features/profile/data/model/profile_model.dart';
import 'package:update_to_do_app/features/profile/data/repo/change_password_repo.dart';
import 'package:update_to_do_app/features/profile/manager/state/change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  final ChangePasswordRepository repository;

  ChangePasswordCubit({required this.repository})
    : super(ChangePasswordInitial());

  Future<void> changePassword(ChangePasswordModel model) async {
    emit(ChangePasswordLoading());
    try {
      final response = await repository.changePassword(model);

      if (response.status) {
        emit(ChangePasswordSuccess(message: response.message));
      } else {
        emit(ChangePasswordError(errorMessage: response.message));
      }
    } catch (e) {
      emit(
        ChangePasswordError(
          errorMessage: "An error occurred while changing password.",
        ),
      );
    }
  }
}
