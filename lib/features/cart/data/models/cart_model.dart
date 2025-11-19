class CartModel {
  final int productId;
  final int quantity;
  final int spicy;
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
    return {
      'items': items.map((e) {
        e.toJson();
      }).toList(),
    };
  }
}
