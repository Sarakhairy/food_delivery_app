import 'package:dio/dio.dart';
import 'package:food_delivery_app/core/utils/pref_helper.dart';

class DioClient {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://sonic-zdi0.onrender.com/api',
      headers: {"Content-Type": 'application/json'},
    ),
  );

  DioClient() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await PrefHelper.getToken(); 

          if (token != null && token.isNotEmpty && token != 'guest') {
            options.headers['Authorization'] = 'Bearer $token';
            print('Authorization header added');
          } else {
            print('No authorization header added');
          }
          return handler.next(options);
        },
      ),
    );
  }
  Dio get dio => _dio;
}
