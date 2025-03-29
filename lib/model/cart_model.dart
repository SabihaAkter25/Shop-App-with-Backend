class CartModel {
  CartModel({
    required this.id,
    required this.name,
    required this.price,
    required this.img,
  });

  final int? id;
  final String? name;
  final int? price;
  final String? img;
  factory CartModel.fromJson(Map<String, dynamic> json){
    return CartModel(
      id: json["id"],
      name: json["name"],
      price: json["price"],
      img: json["img"],
        );
  }
}
