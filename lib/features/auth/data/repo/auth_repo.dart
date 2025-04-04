import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:update_to_do_app/core/local/local_data.dart';
import 'package:update_to_do_app/core/network/dio_helper.dart';
import 'package:update_to_do_app/core/network/dio_responce.dart';
import 'package:update_to_do_app/core/network/end_points.dart';
import 'package:update_to_do_app/features/auth/data/model/user_model.dart';
import 'package:update_to_do_app/features/auth/view/login_view.dart';

class AuthRepo {
  AuthRepo._internal(); // Private constructor
  static final AuthRepo _instance = AuthRepo._internal();

  factory AuthRepo() => _instance;

  final APIHelper apiHelper = APIHelper();

  // Register Method
  Future<Either<String, String>> register({
    required String username,
    required String password,
  }) async {
    try {
      ApiResponse apiResponse = await apiHelper.postRequest(
        endPoint: EndPoints.register,
        data: {"username": username, "password": password},
        isAuthorized: false,
      );
      print("Register Response: ${apiResponse.data}"); // Debugging

      return apiResponse.status
          ? Right(apiResponse.message)
          : Left(apiResponse.message);
    } catch (e) {
      return Left(ApiResponse.fromError(e).message);
    }
  }

  // Login Method
  Future<Either<String, UserModel>> login({
    required String username,
    required String password,
  }) async {
    try {
      ApiResponse apiResponse = await apiHelper.postRequest(
        endPoint: EndPoints.login,
        data: {"username": username, "password": password},
        isAuthorized: false,
      );

      if (apiResponse.status) {
        AuthResponseModel authResponse = AuthResponseModel.fromJson(
          apiResponse.data,
        );

        if (authResponse.user == null) {
          return Left(apiResponse.message);
        }

        // Save user data in LocalData & SharedPreferences
        await LocalData.saveUserData(
          token: authResponse.accessToken ?? "",
          refresh: authResponse.refreshToken ?? "",
          username: authResponse.user!.username ?? '',
        );

        return Right(authResponse.user!);
      } else {
        return Left(apiResponse.message);
      }
    } catch (e) {
      return Left(ApiResponse.fromError(e).message);
    }
  }
}
