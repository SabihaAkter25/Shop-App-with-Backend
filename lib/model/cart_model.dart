import 'package:shop_app_with_backend/model/product_model.dart';

class CartModel {
  int? id;
  String? name;
  double? price;
  String? img;
  int? quantity;
  bool? isExist;
  String? time;
  String? thumbnail;
  ProductModel? product;

  CartModel({
    this.id,
    this.name,
    this.price,
    this.img,
    this.quantity,
    this.isExist,
    this.time,
    this.thumbnail,
    this.product,
  });

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];

    // ✅ safe conversion
    price = (json['price'] as num?)?.toDouble();

    img = json['img'];
    thumbnail = json['thumbnail'];
    quantity = json['quantity'];
    isExist = json['isExist'];
    time = json['time'];

    // ✅ product parsing
    product = json['product'] != null
        ? ProductModel.fromJson(json['product'])
        : null;
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "price": price,
      "img": img,
      "quantity": quantity,
      "isExist": isExist,
      "time": time,
      "thumbnail":thumbnail,
      "product": product?.toJson(),
    };
  }
}