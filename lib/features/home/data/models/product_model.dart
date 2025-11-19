class ProductModel {
  final int id;
  final String name;
  final String image;
  final String desc;
  final String price;
  final String rate;
  const ProductModel({
    required this.id,
    required this.name,
    required this.image,
    required this.desc,
    required this.price,
    required this.rate,
  });
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      desc: json['description'],
      price: json['price'],
      rate: json['rating'],
    );
  }
}
