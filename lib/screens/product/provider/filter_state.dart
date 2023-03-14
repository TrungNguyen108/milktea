part of 'filter_provider.dart';

enum FilterStatus {Loading, Loaded, Success, Failure}
class FilterState extends Equatable {
  final RangeValues price;
  final FilterStatus status;
  final List<ProductModel> listProducts;
  final String? message;

  const FilterState({
    this.price = const RangeValues(0, 0),
    this.status = FilterStatus.Loading,
    this.listProducts = const [],
    this.message,
  });

  FilterState copyWith({
    RangeValues? price,
    FilterStatus? status,
    List<ProductModel>? listProducts,
    String? message,
  }) {
    return FilterState(
      price: price ?? this.price,
      status: status ?? this.status,
      listProducts: listProducts ?? this.listProducts,
      message: message ?? this.message,
    );
  }

  @override
  List<Object> get props => [ price , status, listProducts];
}