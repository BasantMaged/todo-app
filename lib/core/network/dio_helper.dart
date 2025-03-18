import 'package:dio/dio.dart';
import 'package:update_to_do_app/core/local/local_data.dart';
import 'package:update_to_do_app/core/network/dio_responce.dart';
import 'package:update_to_do_app/core/network/end_points.dart';

class APIHelper {
  // Singleton
  static final APIHelper _apiHelper = APIHelper._internal();

  factory APIHelper() => _apiHelper;

  APIHelper._internal();

  // Dio instance
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: EndPoints.baseUrl,
      connectTimeout: Duration(seconds: 10),
      sendTimeout: Duration(seconds: 10),
      receiveTimeout: Duration(seconds: 10),
      followRedirects: true, //  Enable automatic redirects
      validateStatus: (status) {
        return status! < 400; //  Ignore redirection errors
      },
    ),
  );

  Future<ApiResponse> getRequest({
    required String endPoint,
    Map<String, dynamic>? data,
    bool isFormData = true,
    bool isAuthorized = true,
  }) async {
    try {
      var response = await dio.get(
        endPoint,
        data: isFormData ? FormData.fromMap(data ?? {}) : data,
        options: getDefaultOptions(isAuthorized: isAuthorized),
      );
      return ApiResponse.fromResponse(response);
    } catch (e) {
      return ApiResponse.fromError(e);
    }
  }

  Future<ApiResponse> postRequest({
    required String endPoint,
    Map<String, dynamic>? data,
    bool isFormData = true,
    bool isAuthorized = true,
  }) async {
    try {
      var response = await dio.post(
        endPoint,
        data: isFormData ? FormData.fromMap(data ?? {}) : data,
        options: getDefaultOptions(isAuthorized: isAuthorized),
      );
      return ApiResponse.fromResponse(response);
    } catch (e) {
      return ApiResponse.fromError(e);
    }
  }

  Future<ApiResponse> putRequest({
    required String endPoint,
    Map<String, dynamic>? data,
    bool isFormData = true,
    bool isAuthorized = true,
  }) async {
    try {
      var response = await dio.put(
        endPoint,
        data: isFormData ? FormData.fromMap(data ?? {}) : data,
        options: getDefaultOptions(isAuthorized: isAuthorized),
      );
      return ApiResponse.fromResponse(response);
    } catch (e) {
      return ApiResponse.fromError(e);
    }
  }

  Future<ApiResponse> deleteRequest({
    required String endPoint,
    Map<String, dynamic>? data,
    bool isFormData = true,
    bool isAuthorized = true,
    required Map<String, String> headers,
  }) async {
    try {
      var response = await dio.delete(
        endPoint,
        data: isFormData ? FormData.fromMap(data ?? {}) : data,
        options: getDefaultOptions(isAuthorized: isAuthorized),
      );
      return ApiResponse.fromResponse(response);
    } catch (e) {
      return ApiResponse.fromError(e);
    }
  }
}

Options getDefaultOptions({required bool isAuthorized}) {
  return Options(
    headers: {
      if (isAuthorized) "Authorization": "Bearer ${LocalData.accessToken}",
    },
  );
}
