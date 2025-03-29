class CartModel {

  final int? id;
  final String? name;
  final int? price;
  final String? img;
  final int? quantity;
  final bool? isExist;
  final String? time;
  CartModel({
    required this.id,
    required this.name,
    required this.price,
    required this.img,
    required this.quantity,
    required this.isExist,
    required this.time,
  });


  factory CartModel.fromJson(Map<String, dynamic> json){
    return CartModel(
      id: json["id"],
      name: json["name"],
      price: json["price"],
      img: json["img"],
        time:json['time'],
      isExist:json['isExist'],
      quantity:json['quantity'],
        );
  }
}
