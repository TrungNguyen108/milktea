class CategoriesModel {
  CategoriesModel({
      this.id, 
      this.name, 
      this.image, 
      this.creationAt, 
      this.updatedAt,});

  CategoriesModel.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    creationAt = json['creationAt'];
    updatedAt = json['updatedAt'];
  }
  num? id;
  String? name;
  String? image;
  String? creationAt;
  String? updatedAt;
CategoriesModel copyWith({  num? id,
  String? name,
  String? image,
  String? creationAt,
  String? updatedAt,
}) => CategoriesModel(  id: id ?? this.id,
  name: name ?? this.name,
  image: image ?? this.image,
  creationAt: creationAt ?? this.creationAt,
  updatedAt: updatedAt ?? this.updatedAt,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['image'] = image;
    map['creationAt'] = creationAt;
    map['updatedAt'] = updatedAt;
    return map;
  }

}