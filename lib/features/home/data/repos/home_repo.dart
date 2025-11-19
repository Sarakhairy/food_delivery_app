import 'package:dio/dio.dart';
import 'package:flutter/rendering.dart';
import 'package:food_delivery_app/core/network/api_service.dart';
import 'package:food_delivery_app/features/home/data/models/product_model.dart';

class HomeRepo {
  ApiService apiService = ApiService();
  Future<List<ProductModel>> getProducts() async {
    try {
      final response = await apiService.get("/products/");
      return (response['data'] as List).map((e) {
        return ProductModel.fromJson(e);
      }).toList();
    } catch (e) {
      return [];
    }
  }
}
