import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

import '../../cart/model/cart_model.dart';
import '../../cart/model/cart_model_hive.dart';

part 'cart_state.dart';


final cartProvider =StateNotifierProvider<CartController, CartState>((ref) => CartController(ref),);

class CartController extends StateNotifier<CartState> {
  final Ref ref;

  CartController(this.ref) : super(const CartState()){
    ShowCart();
  }
  void onChange(int value) {
    final qty = value;
    state = state.copyWith(
      status: CartStatus.Loaded,
      qty: qty,
    );
  }

  void CheckQuatity(String id_product, String title, String photo, num price) async{
    final _boxCart = await Hive.openBox('cart');
    final listCarts = _boxCart.toMap();
    List<CartModel> listTemp = [];
    if (listCarts.isNotEmpty && listCarts.length > 0) {
      listCarts.forEach((key, value) {
        final itemPro = value as CartModelHive;
        listTemp.add(CartModel(
          id_product: itemPro.id_product,
          title: itemPro.title,
          photo: itemPro.photo,
          qty: itemPro.qty,
          price: itemPro.price,
        ));
      });
    }
    int index = listTemp.indexWhere((element) => element.id_product == id_product);
    if(index > -1){
      _boxCart.put(index, CartModelHive(
        id_product: id_product,
        title: title,
        photo: photo,
        qty: listTemp[index].qty! + state.qty,
        price: price,
      ));
    }else{
      _boxCart.add(CartModelHive(
        id_product: id_product,
        title: title,
        photo: photo,
        qty: state.qty,
        price: price,
      ));
    }
  }
  void ShowCart() async {
    final _boxCart = await Hive.openBox('cart');
    // _boxCart.clear();
    final listCartsShow = _boxCart.toMap();
    List<CartModel> listTempShow = [];
    if (listCartsShow.isNotEmpty && listCartsShow.length > 0) {
      listCartsShow.forEach((key, value) {
        final itemPro = value as CartModelHive;
        listTempShow.add(CartModel(
          id_product: itemPro.id_product,
          title: itemPro.title,
          photo: itemPro.photo,
          qty: itemPro.qty,
          price: itemPro.price,
        ));
      });
    }
    state = state.copyWith(status: CartStatus.Success, listCarts: listTempShow);
  }
  void AddCart(String id_product,String title, String photo , int price) async {
    state = state.copyWith(status: CartStatus.Loading);
    try {
      CheckQuatity(id_product,title,photo,price);
      ShowCart();
    } catch (e) {
      state = state.copyWith(status:  CartStatus.Failure, message: e.toString());
    }
  }

  void UpdateCart(String id_product, String title, String photo, num qty, num price) async{
    state = state.copyWith(status: CartStatus.Loading);
    try {
      final _boxCart = await Hive.openBox('cart');
      final listCarts = _boxCart.toMap();
      List<CartModel> listTemp = [];
      if (listCarts.isNotEmpty && listCarts.length > 0) {
        listCarts.forEach((key, value) {
          final itemPro = value as CartModelHive;
          listTemp.add(CartModel(
            id_product: itemPro.id_product,
            title: itemPro.title,
            photo: itemPro.photo,
            qty: itemPro.qty,
            price: itemPro.price,
          ));
        });
      }
      int index = listTemp.indexWhere((element) => element.id_product == id_product);
      if(qty == 0){
        _boxCart.deleteAt(index);
        if(_boxCart.length == 0){
          _boxCart.clear();
        }
      }else if(index > -1){
        _boxCart.put(index, CartModelHive(
          id_product: id_product,
          title: title,
          photo: photo,
          qty: qty,
          price: price,
        ));
      };
      ShowCart();
    } catch (e) {
      state = state.copyWith(status:  CartStatus.Failure, message: e.toString());
    }
  }
}