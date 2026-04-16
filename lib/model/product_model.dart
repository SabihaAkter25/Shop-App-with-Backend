class Product {
  int? totalSize;
  int? offset;
  List<ProductModel> products;

  Product({
    this.totalSize,
    this.offset,
    required this.products,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      totalSize: json['total'],
      offset: json['skip'],
      products: json['products'] != null
          ? List<ProductModel>.from(
        json['products'].map((x) => ProductModel.fromJson(x)),
      )
          : [],
    );
  }
}

class ProductModel {
  int? id;
  String? title; // 🔥 FIX: name → title (backend match)
  String? description;
  double? price;
  double? rating; // 🔥 FIX: stars → rating (clean naming)
  String? thumbnail;
  List<String>? images;

  // optional fields
  String? category;
  String? brand;

  ProductModel({
    this.id,
    this.title,
    this.description,
    this.price,
    this.rating,
    this.thumbnail,
    this.images,
    this.category,
    this.brand,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],

      price: (json['price'] as num?)?.toDouble(),
      rating: (json['rating'] as num?)?.toDouble(),

      thumbnail: json['thumbnail'],

      category: json['category'],
      brand: json['brand'],

      images: json['images'] != null
          ? List<String>.from(json['images'])
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "description": description,
      "price": price,
      "rating": rating,
      "thumbnail": thumbnail,
      "images": images,
      "category": category,
      "brand": brand,
    };
  }
}