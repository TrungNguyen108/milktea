import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../common/api_constant.dart';
import 'pdf_order_model.dart';

final futurePdfOrderProvider = FutureProvider.autoDispose.family<List<PdfOrderModel>? , String>((ref , id) async {
  final List<PdfOrderModel> list = [];
  final _dio = Dio();
  final Response reponse1 = await _dio.get(ApiConstant.PDF_ORDER_URL+id);
  if (reponse1.statusCode == 200) {
    final jsonReponse1 = reponse1.data;
    (jsonReponse1 as List).forEach((json) {
      list.add(PdfOrderModel.fromJson(json));
    });
  }
  return list;
});