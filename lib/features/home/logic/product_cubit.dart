import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tranquilo_app/features/home/logic/product_state.dart';

import '../data/model/product_response_model.dart';
import '../data/repo/product_repo.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final ProductRepo _productRepo;

  ProductsCubit(this._productRepo) : super(const ProductsState.initial());

  Future<void> fetchProducts() async {
    emit(const ProductsState.productsLoading());

    final result = await _productRepo.getProducts();

    result.when(
      success: (data) {
        final List<Product> result = data.result.toList();
        emit(ProductsState.productsSuccess(result));
      },
      failure: (error) {
        emit(ProductsState.productsError(error: error.apiErrorModel));
      },
    );
  }
}
