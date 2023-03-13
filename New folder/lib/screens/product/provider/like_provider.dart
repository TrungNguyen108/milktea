import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

import '../model/like_model.dart';
import '../model/like_model_hive.dart';

part 'like_state.dart';
final likeProvider =
StateNotifierProvider<LikeController, LikeState>(
      (ref) => LikeController(ref),
);

class LikeController extends StateNotifier<LikeState> {
  final Ref ref;

  LikeController(this.ref) : super(const LikeState()){
    ShowLike();
  }


  void ShowLike() async {
    final _boxLike = await Hive.openBox('like');
    final listLikes = _boxLike.toMap();
    List<LikeModel> listTemp = [];
    if (listLikes.isNotEmpty && listLikes.length > 0) {
      listLikes.forEach((key, value) {
        final itemPro = value as LikeModelHive;
        listTemp.add(LikeModel(
          id_product: itemPro.id_product,
          title: itemPro.title,
          photo: itemPro.photo,
          price: itemPro.price,
        ));
      });
    }
    state = state.copyWith(status: LikeStatus.Success, listLikes: listTemp);
  }

  void LikeClick(String id_product, String title, String photo, num price) async {
    state = state.copyWith(status: LikeStatus.Loading);
    try {
      final _boxLike = await Hive.openBox('like');
      final listLikes = _boxLike.toMap();
      List<LikeModel> listTemp = [];
      if (listLikes.isNotEmpty && listLikes.length > 0) {
        listLikes.forEach((key, value) {
          final itemPro = value as LikeModelHive;
          listTemp.add(LikeModel(
            id_product: itemPro.id_product,
            title: itemPro.title,
            photo: itemPro.photo,
            price: itemPro.price,
          ));
        });
      }
      int index = listTemp.indexWhere((element) => element.id_product == id_product);
      if(index == -1){
        _boxLike.add(LikeModelHive(
          id_product: id_product,
          title: title,
          photo: photo,
          price: price,
        ));
      }

      final _boxLike1 = await Hive.openBox('like');
      final listLikes1 = _boxLike1.toMap();
      List<LikeModel> listTemp1 = [];
      if (listLikes1.isNotEmpty && listLikes1.length > 0) {
        listLikes1.forEach((key, value) {
          final itemPro = value as LikeModelHive;
          listTemp1.add(LikeModel(
            id_product: itemPro.id_product,
            title: itemPro.title,
            photo: itemPro.photo,
            price: itemPro.price,
          ));
        });
      }
      // print(index);
      if(index == -1) {
        state = state.copyWith(status: LikeStatus.Success, listLikes: listTemp1);
      }else{
        state = state.copyWith(status: LikeStatus.Loaded, listLikes: listTemp1);
      }
    } catch (e) {
      state = state.copyWith(status:  LikeStatus.Failure);
    }
  }
}