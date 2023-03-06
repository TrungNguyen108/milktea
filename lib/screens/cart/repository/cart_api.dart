import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/produt_model.dart';

class ApiPro{
  String endpoint = 'https://api.escuelajs.co/api/v1/products';
  Future<List<ProductModel>?> getUsers() async {
    List<ProductModel>? result = [];
    Response response = await Dio().get(endpoint);
    if (response.statusCode == 200){
          for(var product in response.data){
        result.add(ProductModel.fromJson(product));
      }
      //final List result = jsonDecode(response.data)['data'];
      //return result.map(((e) => ProductModel.fromJson(e))).toList();
    }else {
      throw Exception(response.statusMessage);
    }
    return result;
  }
}
final userProvider= Provider<ApiPro>((ref)=>ApiPro());

