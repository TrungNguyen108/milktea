import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repository/cart_api.dart';
import '../model/produt_model.dart';

final userDataProvider = FutureProvider<List<ProductModel>?>((ref) async {
  return ref.watch(userProvider).getUsers();
});