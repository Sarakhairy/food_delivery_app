import 'package:dio/dio.dart';
import 'package:food_delivery_app/core/network/api_error.dart';
import 'package:food_delivery_app/core/network/api_exceptions.dart';
import 'package:food_delivery_app/core/network/dio_client.dart';

class ApiService {
  final DioClient _dioClient = DioClient();
  Future<dynamic> get(String endPoint) async {
    try {
      final response = await _dioClient.dio.get(endPoint);
      return response.data;
    } on DioError catch (e) {
      return ApiExceptions.handleError(e);
    }
  }

 Future<dynamic> post(String endPoint, Map<String, dynamic>? body) async {
  try {
    final response = await _dioClient.dio.post(endPoint, data: body);
    print("response is $response.............");
    return response.data;
  } on DioError catch (e) {
    print("❌ DioError caught:");
    print("Message: ${e.message}");
    print("Response: ${e.response?.data}");
    print("Status Code: ${e.response?.statusCode}");
    print("Headers: ${e.response?.headers}");
    return ApiExceptions.handleError(e);
  }
}


  Future<dynamic> put(String endPoint, Map<String, dynamic> body) async {
    try {
      final response = await _dioClient.dio.put(endPoint, data: body);
      return response.data;
    } on DioError catch (e) {
      return ApiExceptions.handleError(e);
    }
  }

  Future<dynamic> delete(String endPoint, Map<String, dynamic> body) async {
    try {
      final response = await _dioClient.dio.delete(endPoint, data: body);
      return response.data;
    } on DioError catch (e) {
      return ApiExceptions.handleError(e);
    }
  }
}
