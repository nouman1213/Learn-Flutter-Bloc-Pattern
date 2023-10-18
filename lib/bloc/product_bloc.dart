import 'package:api_project_bloc/repo/product_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../models/product_model.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductLoadedEvent, ProductState> {
  ProductBloc() : super(ProductLoadingState()) {
    final productRepo = ProductRepo();
    on<ProductLoadedEvent>((event, emit) async {
      try {
        emit(ProductLoadingState());

        var data = await productRepo.getProduct();
        emit(ProductLoadedState(productModel: data));
      } catch (e) {
        emit(ProductErrorState(errorMessage: e.toString()));
      }
    });
  }
}
