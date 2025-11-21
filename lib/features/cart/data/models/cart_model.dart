import 'package:flutter/foundation.dart';

class CartModel {
  final int productId;
  final int quantity;
  final String spicy;
  final List<int> toppings;
  final List<int> options;

  CartModel({
    required this.productId,
    required this.quantity,
    required this.spicy,
    required this.toppings,
    required this.options,
  });
  Map<String, dynamic> toJson() {
    return {
      'product_id': productId,
      'quantity': quantity,
      'spicy': spicy,
      'toppings': toppings,
      'side_options': options,
    };
  }
}

class CartRequestModel {
  final List<CartModel> items;
  CartRequestModel({required this.items});
  Map<String, dynamic> toJson() {
    return {'items': items.map((e) => e.toJson()).toList()};
  }
}

class CartItemModel {
  final int itemId;
  final int productId;
  final String name;
  final String image;
  final int quantity;
  final String price;
  final String spicy;

  CartItemModel({
    required this.itemId,
    required this.productId,
    required this.name,
    required this.image,
    required this.quantity,
    required this.price,
    required this.spicy,
  });
  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      itemId: json['item_id'],
      productId: json['product_id'],
      name: json['name'],
      image: json['image'],
      quantity: json['quantity'],
      price: json['price'].toString(),
      spicy: json['spicy'].toString(),
    );
  }
}

class CartDate {
  final int id;
  final String totalPrice;
  final List<CartItemModel> items;

  CartDate({required this.id, required this.totalPrice, required this.items});
  factory CartDate.fromJson(Map<String, dynamic> json) {
    return CartDate(
      id: json['id']??0,
      totalPrice: json['totalPrice']?.toString()??'0',
      items: (json['items'] as List).map((e) {
        return CartItemModel.fromJson(e);
      }).toList(),
    );
  }
}

class GetCartResponse {
  final int code;
  final String message;
  final CartDate data;

  GetCartResponse({required this.code, required this.message, required this.data});
  factory GetCartResponse.fromJson(Map<String,dynamic> json){
    return GetCartResponse(
      code: json['code']??200,
      message: json['message']?.toString()??"",
      data: CartDate.fromJson(json['data']),
    );
  }
}
