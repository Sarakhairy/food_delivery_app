import 'package:dio/dio.dart';
import 'package:food_delivery_app/core/network/api_error.dart';
import 'package:food_delivery_app/core/network/api_exceptions.dart';
import 'package:food_delivery_app/core/network/api_service.dart';
import 'package:food_delivery_app/core/utils/pref_helper.dart';
import 'package:food_delivery_app/features/auth/data/models/user_model.dart';

class AuthRepo {
  ApiService apiService = ApiService();
  bool isGuest = false;
  UserModel? _currentUser;

  /// Login
  Future<UserModel?> login(String email, String password) async {
    try {
      final response = await apiService.post('/login', {
        'email': email,
        'password': password,
      });
      print('📩 Raw signup response: $response (${response.runtimeType})');
      if (response is ApiError) {
        throw response;
      }

      if (response is Map<String, dynamic>) {
        final msg = response['message'];
        final code = response['code'];
        final coder = code is int ? code : int.tryParse(code.toString());

        final data = response['data'];

        print('📡 Login response - code: $code, data: $data');

        if (code != 200 && code != 201) {
          throw ApiError(message: msg ?? 'Unknown error');
        }

        final user = UserModel.fromJson(data);
        print('🔐 Login successful - User token: ${user.token ?? 'null'}');

        if (user.token != null) {
          await PrefHelper.saveToken(user.token!);
          print('💾 Token saved to storage: ${user.token}');
        } else {
          print('⚠️ No token received from server!');
        }

        isGuest = false;
        _currentUser = user;
        return user;
      } else {
        throw ApiError(message: 'UnExpected Error From Server');
      }
    } on DioError catch (e) {
      throw ApiExceptions.handleError(e);
    } catch (e) {
      throw ApiError(message: e.toString());
    }
  }

  /// Signup
  Future<UserModel?> signup(String name, String email, String password) async {
    print("🚀 signup() CALLED with name=$name, email=$email");

    try {
      print("🚀 Sending signup request...");
      final response = await apiService.post('/register', {
        'name': name,
        'password': password,
        'email': email,
      });
      print('📩 Raw signup response: $response (${response.runtimeType})');
      if (response is ApiError) {
        throw response;
      }

      if (response is Map<String, dynamic>) {
        final msg = response['message'];
        final code = response['code'];
        final coder = code is int ? code : int.tryParse(code.toString());

        final data = response['data'];

        if (coder != 200 && coder != 201) {
          throw ApiError(message: msg ?? 'Unknown error');
        }

        /// condtion assement
        final user = UserModel.fromJson(data);
        if (user.token != null) {
          await PrefHelper.saveToken(user.token!);
        }
        isGuest = false;
        _currentUser = user;
        return user;
      } else {
        throw ApiError(message: 'UnExpected Error From Server');
      }
    } on DioError catch (e) {
      throw ApiExceptions.handleError(e);
    } catch (e) {
      throw ApiError(message: e.toString());
    }
  }

  Future<UserModel?> getProfileData() async {
    try {
      final token = await PrefHelper.getToken();
      if (token == null || token == 'guest') {
        return null;
      }
      final response = await apiService.get('/profile');
      final user = UserModel.fromJson(response['data']);
      _currentUser = user;
      return user;
    } on DioException catch (e) {
      ApiExceptions.handleError(e);
    } catch (e) {
      throw ApiError(message: e.toString());
    }
    return null;
  }

  Future<UserModel?> updateProfileData({
    required String name,
    required String email,
    required String address,
    String? visa,
    String? imagePath,
  }) async {
    try {
      final formData = FormData.fromMap({
        'name': name,
        'email': email,
        'address': address,
        if (visa != null && visa.isNotEmpty) 'Visa': visa,
        if (imagePath != null && imagePath.isNotEmpty)
          "image": await MultipartFile.fromFile(
            imagePath,
            filename: 'profile.jpg',
          ),
      });
      final response = await apiService.post('/update-profile', formData);
      if (response is ApiError) {
        throw response;
      }

      if (response is Map<String, dynamic>) {
        final msg = response['message'];
        final code = response['code'];
        final coder = code is int ? code : int.tryParse(code.toString());

        final data = response['data'];

        if (coder != 200 && coder != 201) {
          throw ApiError(message: msg ?? 'Unknown error');
        }

        /// condtion assement
        final updatedUser = UserModel.fromJson(data);
        _currentUser = updatedUser;
        return updatedUser;
      } else {
        throw ApiError(message: 'UnExpected Error From Server');
      }
    } on DioException catch (e) {
      throw ApiExceptions.handleError(e);
    } catch (e) {
      throw ApiError(message: e.toString());
    }
  }

  Future<void> logout() async {
    final response = await apiService.post('/logout', {});
    await PrefHelper.clearToken();
    _currentUser = null;
    isGuest = true;
  }
Future<UserModel?> autoLogin() async {
    final token = await PrefHelper.getToken();
 
    if (token == null || token == 'guest') {
      isGuest = true;
      _currentUser = null;
      return null;
    }


    isGuest = false;

    try {
      final user = await getProfileData();
      _currentUser = user;
      return user;
    } catch (e) {
      await PrefHelper.clearToken();
      isGuest = true;
      _currentUser = null;
      return null;
    }
  }
    Future<void> continueAsGuest() async {
    isGuest = true;
    _currentUser = null;
    await PrefHelper.saveToken('guest');
  }

  UserModel? get currentUser => _currentUser;

  bool get isLoggedIn => !isGuest && _currentUser != null;

}
