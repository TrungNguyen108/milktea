import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../common/api_constant.dart';
import '../model/product_model.dart';
part 'filter_state.dart';

final filterProvider =
StateNotifierProvider<FilterController, FilterState>(
      (ref) => FilterController(ref),
);

class FilterController extends StateNotifier<FilterState> {
  final Ref ref;

  FilterController(this.ref) : super(const FilterState()){ }
  void onPriceChange(RangeValues price){
    state = state.copyWith(
      price: price,
      status: FilterStatus.Loaded,
    );
  }
  void FilterSubmit() async {
    state = state.copyWith(status: FilterStatus.Loading);
    try {
      final List<ProductModel> list = [];
      final _dio = Dio();
      final Response reponse = await _dio.get(ApiConstant.LIST_PRODUCT_URL+'/?price_min='+state.price.start.toString()+'&price_max='+state.price.end.toString());
      if (reponse.statusCode == 200) {
        final jsonReponse = reponse.data;
        (jsonReponse as List).forEach((json) {
          list.add(ProductModel.fromJson(json));
        });
      }
      state = state.copyWith( status: FilterStatus.Success, listProducts: list);
    } catch (e) {
      state = state.copyWith(status:  FilterStatus.Failure, message: e.toString());
    }
  }
}
