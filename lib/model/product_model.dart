class Product {
  int? totalSize;
  int? typeId;
  int? offset;
  List<ProductModel> products;

  Product({
    this.totalSize,
    this.typeId,
    this.offset,
    required this.products,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      totalSize: json['total_size'],
      typeId: json['type_id'],
      offset: json['offset'],
      products: json['products'] != null
          ? List<ProductModel>.from(
          json['products'].map((x) => ProductModel.fromJson(x)))
          : [],
    );
  }
}

class ProductModel {
  int? id;
  String? name;
  String? description;
  int? price;
  int? stars;
  String? img;
  String? location;
  String? createdAt;
  String? updatedAt;
  int? typeId;

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    stars = json['stars'];
    img = json['img'];
    location = json['location'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    typeId = json['type_id'];
  }

  Map<String,dynamic>tojson() {
    return{
      "id":id,
      "name":name,
      "price":price,
      "img":img,
      "location":location,
      "createdAt":createdAt,
      "updatedAt":updatedAt,
      "typeId":typeId

    };
  }
}
