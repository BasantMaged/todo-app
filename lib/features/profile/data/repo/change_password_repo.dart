import 'package:update_to_do_app/core/network/dio_helper.dart';
import 'package:update_to_do_app/core/network/dio_responce.dart';
import 'package:update_to_do_app/core/network/end_points.dart';
import 'package:update_to_do_app/features/profile/data/model/profile_model.dart';

class ChangePasswordRepository {
  final APIHelper apiHelper = APIHelper();

  ChangePasswordRepository();

  Future<ApiResponse> changePassword(ChangePasswordModel model) async {
    try {
      final response = await apiHelper.postRequest(
        endPoint: EndPoints.changePassword,
        data: model.toJson(),
        isAuthorized: true, // Ensure authorization token is included
      );
      return response;
    } catch (e) {
      return ApiResponse.fromError(e);
    }
  }
}
