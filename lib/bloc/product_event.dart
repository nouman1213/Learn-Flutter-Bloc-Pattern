part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

class ProductLoadedEvent extends Equatable {
  const ProductLoadedEvent();

  @override
  List<Object> get props => [];
}
