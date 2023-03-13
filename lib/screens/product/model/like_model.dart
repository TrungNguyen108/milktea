class LikeModel {
  LikeModel({
    this.id,
    this.id_product,
    this.title,
    this.photo,
    this.price,
  });

  LikeModel.fromJson(dynamic json) {
    id = json['id'];
    id_product = json['id_product'];
    title = json['title'];
    photo = json['photo'];
    price = json['price'];
  }
  num? id;
  String? id_product;
  String? title;
  String? photo;
  num? price;
  LikeModel copyWith({  num? id,
    String? id_product,
    String? title,
    String? photo,
    num? price,
  }) => LikeModel(  id: id ?? this.id,
    id_product: id_product ?? this.id_product,
    title: title ?? this.title,
    photo: photo ?? this.photo,
    price: price ?? this.price,
  );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['id_product'] = id_product;
    map['title'] = title;
    map['photo'] = photo;
    map['price'] = price;
    return map;
  }
}