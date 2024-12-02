import 'package:json_annotation/json_annotation.dart';

part 'product_response_model.g.dart';

@JsonSerializable()
class Product {
  final int id;
  final String name;
  final String description;
  final int price;
  final int quantity;
  final String imageUrl;
  final String createdAt;
  final double averageRating;
  final int categoryId;
  final String categoryName;
  final int supplierId;
  final String supplierName;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.quantity,
    required this.imageUrl,
    required this.createdAt,
    required this.averageRating,
    required this.categoryId,
    required this.categoryName,
    required this.supplierId,
    required this.supplierName,
  });

  /// A factory constructor for creating a new `Product` instance from a map.
  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);

  /// A method that serializes the `Product` instance to a map.
  Map<String, dynamic> toJson() => _$ProductToJson(this);
}

@JsonSerializable()
class GetProductsResponseBody {
  @JsonKey(name: 'model')
  final List<Product> result;
  final int statusCode;

  GetProductsResponseBody({
    required this.result,
    required this.statusCode,
  });

  factory GetProductsResponseBody.fromJson(Map<String, dynamic> json) =>
      _$GetProductsResponseBodyFromJson(json);
  Map<String, dynamic> toJson() => _$GetProductsResponseBodyToJson(this);
}
