import 'dart:convert';

class ProductModel {
  final String? categoryId;
  final String? categoryName;
  final bool isPromotion;
  final String name;
  final String? description;
  final double price;
  final String? image;
  ProductModel({
    this.categoryId,
    this.categoryName,
    required this.isPromotion,
    required this.name,
    this.description,
    required this.price,
    this.image,
  });

  ProductModel copyWith({
    String? categoryId,
    String? categoryName,
    bool? isPromotion,
    String? name,
    String? description,
    double? price,
    String? image,
  }) {
    return ProductModel(
      categoryId: categoryId ?? this.categoryId,
      categoryName: categoryName ?? this.categoryName,
      isPromotion: isPromotion ?? this.isPromotion,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'categoryId': categoryId,
      'categoryName': categoryName,
      'isPromotion': isPromotion,
      'name': name,
      'description': description,
      'price': price,
      'image': image,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      categoryId: map['categoryId'],
      categoryName: map['categoryName'],
      isPromotion: map['isPromotion'],
      name: map['name'],
      description: map['description'],
      price: map['price'].toDouble(),
      image: map['image'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ProductModel(categoryId: $categoryId, categoryName: $categoryName, isPromotion: $isPromotion, name: $name, description: $description, price: $price, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProductModel &&
        other.categoryId == categoryId &&
        other.categoryName == categoryName &&
        other.isPromotion == isPromotion &&
        other.name == name &&
        other.description == description &&
        other.price == price &&
        other.image == image;
  }

  @override
  int get hashCode {
    return categoryId.hashCode ^
        categoryName.hashCode ^
        isPromotion.hashCode ^
        name.hashCode ^
        description.hashCode ^
        price.hashCode ^
        image.hashCode;
  }
}
