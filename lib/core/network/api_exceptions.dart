import 'package:dio/dio.dart';
import 'package:food_delivery_app/core/network/api_error.dart';

class ApiExceptions {
  static ApiError handleError(DioException error) {
    final statusCode = error.response?.statusCode;
    final data = error.response?.data;
   print('$statusCode and ${data['message']} ....................');
    if (statusCode != null) {
      print('$statusCode and ${data['message']} ....................');
      if (data is Map<String, dynamic> && data['message'] != null) {
        return ApiError(message: data['message'], statusCode: statusCode);
      }
    }

    if (statusCode == 302) {
      throw ApiError(message: 'This Email Already Taken');
    }

    print(statusCode);
    print(data);

    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return ApiError(
          message: "Connection timeout. Please check your internet connection",
        );
      case DioExceptionType.sendTimeout:
        return ApiError(message: "Request timeout. Please try again");
      case DioExceptionType.receiveTimeout:
        return ApiError(message: "Response timeout. Please try again");
      default:
        return ApiError(
          message: "An unexpected error occurred. Please try again",
        );
    }
  }
}
