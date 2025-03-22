import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:update_to_do_app/features/profile/data/repo/profile_repo.dart';
import 'package:update_to_do_app/features/profile/manager/state/profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepository repository;

  ProfileCubit({required this.repository}) : super(ProfileInitial());

  Future<void> fetchProfile() async {
    emit(ProfileLoading());
    try {
      final profile = await repository.getProfile();
      emit(ProfileLoaded(profile));
    } catch (e) {
      emit(ProfileError("Failed to load profile. Please try again."));
    }
  }

  Future<void> updateProfile(Map<String, dynamic> updatedData) async {
    emit(ProfileLoading());
    try {
      final isUpdated = await repository.updateProfile(updatedData);

      if (isUpdated) {
        final updatedProfile =
            await repository.getProfile(); // Fetch latest data
        emit(
          ProfileLoaded(updatedProfile),
        ); //  Use ProfileLoaded instead of ProfileUpdated
      } else {
        emit(ProfileError("Profile update failed. Please try again."));
      }
    } catch (e) {
      emit(ProfileError("An error occurred while updating the profile."));
    }
  }
}
