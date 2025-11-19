import 'package:food_delivery_app/core/network/api_service.dart';
import 'package:food_delivery_app/features/product/data/models/topping_model.dart';

class ProductRepo {
  ApiService apiService = ApiService();
  Future<List<ToppingModel>> getToppings() async {
    try {
      final res = await apiService.get('/toppings');
      return (res['data'] as List).map((e) {
        return ToppingModel.fromJson(e);
      }).toList();
    } catch (e) {
      return [];
    }
  }
    Future<List<ToppingModel>> getOptions() async {
    try {
      final res = await apiService.get('/side-options');
      return (res['data'] as List).map((e) {
        return ToppingModel.fromJson(e);
      }).toList();
    } catch (e) {
      return [];
    }
  }
}
