// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      description: json['description'] as String,
      price: (json['price'] as num).toInt(),
      quantity: (json['quantity'] as num).toInt(),
      imageUrl: json['imageUrl'] as String,
      createdAt: json['createdAt'] as String,
      averageRating: (json['averageRating'] as num).toDouble(),
      categoryId: (json['categoryId'] as num).toInt(),
      categoryName: json['categoryName'] as String,
      supplierId: (json['supplierId'] as num).toInt(),
      supplierName: json['supplierName'] as String,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'quantity': instance.quantity,
      'imageUrl': instance.imageUrl,
      'createdAt': instance.createdAt,
      'averageRating': instance.averageRating,
      'categoryId': instance.categoryId,
      'categoryName': instance.categoryName,
      'supplierId': instance.supplierId,
      'supplierName': instance.supplierName,
    };

GetProductsResponseBody _$GetProductsResponseBodyFromJson(
        Map<String, dynamic> json) =>
    GetProductsResponseBody(
      result: (json['model'] as List<dynamic>)
          .map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
      statusCode: (json['statusCode'] as num).toInt(),
    );

Map<String, dynamic> _$GetProductsResponseBodyToJson(
        GetProductsResponseBody instance) =>
    <String, dynamic>{
      'model': instance.result,
      'statusCode': instance.statusCode,
    };
