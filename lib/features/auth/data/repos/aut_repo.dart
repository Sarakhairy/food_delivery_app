import 'package:dio/dio.dart';
import 'package:food_delivery_app/core/network/api_error.dart';
import 'package:food_delivery_app/core/network/api_exceptions.dart';
import 'package:food_delivery_app/core/network/api_service.dart';
import 'package:food_delivery_app/core/utils/pref_helper.dart';
import 'package:food_delivery_app/features/auth/data/models/user_model.dart';

class AutRepo {
  ApiService apiService = ApiService();
  Future<UserModel?> login(String email, String password) async {
    try {
      final response = await apiService.post("/login", {
        'email': email,
        "password": password,
      });
      final user = UserModel.fromJson(response['data']);
      if (user.token != null) {
        await PrefHelper.saveToken(user.token!);
      }
      return user;
    } on DioError catch (e) {
      throw ApiExceptions.handleError(e);
    } catch (e) {
      ApiError(message: e.toString());
    }
  }
}
