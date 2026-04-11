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
      totalSize: json['total'],
      typeId: null,
      offset: json['skip'],


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
  double? price;
  double? stars;
  String? img;// thumbnail
  String? thumbnail;
  List<String>? images;     // extra images
  String? location;
  String? createdAt;
  String? updatedAt;
  int? typeId;

  ProductModel({
    this.id,
    this.name,
    this.description,
    this.price,
    this.stars,
    this.img,
    this.images,
    this.location,
    this.createdAt,
    this.updatedAt,
    this.typeId,
    this.thumbnail
  });

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['title'];
    description = json['description'];

    // ✅ safe conversion
    price = (json['price'] as num?)?.toDouble();
    stars = (json['rating'] as num?)?.toDouble();

    // 🔥 IMPORTANT (thumbnail)

    thumbnail = json['thumbnail'];
    // 🔥 images list
    if (json['images'] != null) {
      images = List<String>.from(json['images']);
    }
    location = null;
    createdAt = null;
    updatedAt = null;
    typeId = null;
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": name,
      "description": description,
      "price": price,
      "rating": stars,
      "thumbnail": thumbnail,
      "images": images,
      "location": location,
      "createdAt": createdAt,
      "updatedAt": updatedAt,
      "typeId": typeId,
    };
  }
}