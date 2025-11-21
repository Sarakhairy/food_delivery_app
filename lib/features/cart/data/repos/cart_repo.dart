import 'package:food_delivery_app/core/network/api_error.dart';
import 'package:food_delivery_app/core/network/api_service.dart';
import 'package:food_delivery_app/features/cart/data/models/cart_model.dart';

class CartRepo {
  final ApiService _apiService = ApiService();
  Future<void> addToCart(CartRequestModel cartData) async {
    try {
      final res = await _apiService.post("/cart/add",cartData.toJson());
      if (res is ApiError) {
        throw ApiError(message: res.message);
      }
    } catch (e) {
      throw ApiError(message: e.toString());
    }
  }
  Future<GetCartResponse> getCartData()async{
    try {
      final res = await _apiService.get("/cart");
      if (res is ApiError) {
        throw ApiError(message: res.message);
      }
      return GetCartResponse.fromJson(res);
    } catch (e) {
      throw ApiError(message: e.toString());
    }
  }
}
