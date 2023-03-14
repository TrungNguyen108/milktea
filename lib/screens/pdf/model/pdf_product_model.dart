class PdfProductModel {
  PdfProductModel({
      this.id, 
      this.title, 
      this.description, 
      this.price, 
      this.discountPercentage, 
      this.rating, 
      this.stock, 
      this.brand, 
      this.category, 
      this.thumbnail, 
      this.images,});

  PdfProductModel.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    price = json['price'];
    discountPercentage = json['discountPercentage'];
    rating = json['rating'];
    stock = json['stock'];
    brand = json['brand'];
    category = json['category'];
    thumbnail = json['thumbnail'];
    images = json['images'] != null ? json['images'].cast<String>() : [];
  }
  num? id;
  String? title;
  String? description;
  num? price;
  num? discountPercentage;
  num? rating;
  num? stock;
  String? brand;
  String? category;
  String? thumbnail;
  List<String>? images;
PdfProductModel copyWith({  num? id,
  String? title,
  String? description,
  num? price,
  num? discountPercentage,
  num? rating,
  num? stock,
  String? brand,
  String? category,
  String? thumbnail,
  List<String>? images,
}) => PdfProductModel(  id: id ?? this.id,
  title: title ?? this.title,
  description: description ?? this.description,
  price: price ?? this.price,
  discountPercentage: discountPercentage ?? this.discountPercentage,
  rating: rating ?? this.rating,
  stock: stock ?? this.stock,
  brand: brand ?? this.brand,
  category: category ?? this.category,
  thumbnail: thumbnail ?? this.thumbnail,
  images: images ?? this.images,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['description'] = description;
    map['price'] = price;
    map['discountPercentage'] = discountPercentage;
    map['rating'] = rating;
    map['stock'] = stock;
    map['brand'] = brand;
    map['category'] = category;
    map['thumbnail'] = thumbnail;
    map['images'] = images;
    return map;
  }

}