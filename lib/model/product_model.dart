class Product {
  Product({
    required totalSize,
    required typeId,
    required offset,
    required products,
  }){
    this._totalSize=totalSize;
    this._typeId=typeId;
    this._offset=offset;
    this._products=products;
  }

   int? _totalSize;
   int? _typeId;
   int? _offset;
  late List<ProductElement> _products;
  List<ProductElement> get products=>_products;


  factory Product.fromJson(Map<String, dynamic> json){
    return Product(
      totalSize: json["total_size"],
      typeId: json["type_id"],
      offset: json["offset"],
      products: json["products"] == null ? [] : List<ProductElement>.from(json["products"]!.map((x) => ProductElement.fromJson(x))),
    );
  }

}

class ProductElement {
  ProductElement({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.stars,
    required this.img,
    required this.location,
    required this.createdAt,
    required this.updatedAt,
    required this.typeId,
  });

  final int? id;
  final String? name;
  final String? description;
  final int? price;
  final int? stars;
  final String? img;
  final String? location;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? typeId;

  factory ProductElement.fromJson(Map<String, dynamic> json){
    return ProductElement(
      id: json["id"],
      name: json["name"],
      description: json["description"],
      price: json["price"],
      stars: json["stars"],
      img: json["img"],
      location: json["location"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
      typeId: json["type_id"],
    );
  }

}
