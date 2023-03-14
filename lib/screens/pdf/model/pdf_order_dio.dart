import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../common/api_constant.dart';
import 'pdf_product_model.dart';

final futurePdfOrderProvider = FutureProvider.autoDispose.family<List<PdfProductModel>? , String>((ref , id) async {
  final List<PdfProductModel> list = [];
  final _dio = Dio();
  final Response reponse = await _dio.get(ApiConstant.PDF_ORDER_URL+id);
  if (reponse.statusCode == 200) {
    final jsonReponse = reponse.data['products'];
    (jsonReponse as List).forEach((json) {
      list.add(PdfProductModel.fromJson(json));
    });
  }
  return list;
});