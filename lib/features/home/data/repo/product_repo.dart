import 'package:flutter/cupertino.dart';

import '../../../../core/network/api_error_handler.dart';
import '../../../../core/network/api_result.dart';
import '../../../../core/network/api_service.dart';
import '../model/product_response_model.dart';

class ProductRepo {
  final ApiService _apiService;

  ProductRepo(this._apiService);

  Future<ApiResult<GetProductsResponseBody>> getProducts() async {
    try {
      final response = await _apiService.getProducts();
      debugPrint("API response: $response");
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
