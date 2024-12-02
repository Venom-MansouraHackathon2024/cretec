import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../core/network/api_error_model.dart';
import '../data/model/product_response_model.dart';

part 'product_state.freezed.dart';

@freezed
class ProductsState<T> with _$ProductsState<T> {
  const factory ProductsState.initial() = _Initial;

  const factory ProductsState.productsLoading() = ProductsLoading;

  const factory ProductsState.productsSuccess(List<Product> productsList) =
      ProductsSuccess<T>;

  const factory ProductsState.productsError({required ApiErrorModel error}) =
      ProductsError;
}
