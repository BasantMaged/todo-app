import 'package:update_to_do_app/core/network/dio_helper.dart';
import 'package:update_to_do_app/features/profile/data/model/profile_model.dart';
import 'package:update_to_do_app/core/network/end_points.dart';

class ProfileRepository {
  final APIHelper apiHelper;

  ProfileRepository(APIHelper apiHelperInstance, {required APIHelper apiHelper})
    : apiHelper = apiHelperInstance;

  Future<ProfileModel> getProfile() async {
    final response = await apiHelper.getRequest(
      endPoint: EndPoints.getUserProfile,
    );

    if (response.status) {
      return ProfileModel.fromJson(response.data);
    } else {
      throw Exception("Failed to fetch profile data.");
    }
  }

  Future<bool> updateProfile(Map<String, dynamic> updatedData) async {
    final response = await apiHelper.putRequest(
      endPoint: EndPoints.updateUserProfile,
      data: updatedData,
    );

    return response.status;
  }
}
