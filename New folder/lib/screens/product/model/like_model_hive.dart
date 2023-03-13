import 'package:hive/hive.dart';

part 'like_model_hive.g.dart';

@HiveType(typeId: 0)
class LikeModelHive {
  @HiveField(0)
  final String id_product;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String photo;

  @HiveField(3)
  final num price;

  LikeModelHive({required this.id_product, required this.title, required this.photo , required this.price});
}