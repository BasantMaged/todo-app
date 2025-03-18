import 'package:dio/dio.dart' as dio;

class ApiResponse {
  final bool status;
  final int statusCode;
  final dynamic data;
  final String message;

  ApiResponse({
    required this.status,
    required this.statusCode,
    this.data,
    required this.message,
  });

  // Use 'dio.Response' instead of plain 'Response'
  factory ApiResponse.fromResponse(dio.Response response) {
    return ApiResponse(
      status: response.data["status"] ?? false,
      statusCode: response.statusCode ?? 500,
      data: response.data,
      message: response.data["message"] ?? 'An error occurred.',
    );
  }

  factory ApiResponse.fromError(dynamic error) {
    if (error is dio.DioException) {
      print('Dio error: $error');
      return ApiResponse(
        status: false,
        data: error.response,
        statusCode:
            error.response != null ? error.response!.statusCode ?? 500 : 500,
        message: _handleDioError(error),
      );
    } else {
      return ApiResponse(
        status: false,
        statusCode: 500,
        message: 'An error occurred.',
      );
    }
  }

  static String _handleDioError(dio.DioException error) {
    switch (error.type) {
      case dio.DioExceptionType.connectionTimeout:
        return "Connection timeout, please try again.";
      case dio.DioExceptionType.sendTimeout:
        return "Send timeout, please check your internet.";
      case dio.DioExceptionType.receiveTimeout:
        return "Receive timeout, please try again later.";
      case dio.DioExceptionType.badResponse:
        return _handleServerError(error.response);
      case dio.DioExceptionType.cancel:
        return "Request was cancelled.";
      case dio.DioExceptionType.connectionError:
        return "No internet connection.";
      default:
        return "Unknown error occurred.";
    }
  }

  static String _handleServerError(dio.Response? response) {
    print(response?.data.toString());
    if (response == null) return "No response from server.";
    if (response.data is Map<String, dynamic>) {
      return response.data["message"] ?? "An error occurred.";
    }
    return "Server error: ${response.statusMessage}";
  }
}
