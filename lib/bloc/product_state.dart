part of 'product_bloc.dart';

sealed class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

final class ProductInitial extends ProductState {}

final class ProductLoadingState extends ProductState {}

final class ProductLoadedState extends ProductState {
  final List<ProductsModel> productModel;

  const ProductLoadedState({required this.productModel});
  @override
  List<Object> get props => [productModel];
}

final class ProductErrorState extends ProductState {
  final String errorMessage;

  const ProductErrorState({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}
