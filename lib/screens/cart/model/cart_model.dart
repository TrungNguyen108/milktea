import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';


part 'cart_model.g.dart';

@HiveType(typeId: 0)
class CartModel{
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String size;
  @HiveField(2)
  final String img;
  @HiveField(3)
  final double price;
  @HiveField(4)
  final int quantity;
  CartModel({required this.title,required this.size,required this.img,required this.price,required this.quantity});
}
