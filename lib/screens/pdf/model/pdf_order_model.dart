class PdfOrderModel {
  PdfOrderModel({
      this.id, 
      this.products, 
      this.total, 
      this.discountedTotal, 
      this.userId, 
      this.totalProducts, 
      this.totalQuantity,});

  PdfOrderModel.fromJson(dynamic json) {
    id = json['id'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(Products.fromJson(v));
      });
    }
    total = json['total'];
    discountedTotal = json['discountedTotal'];
    userId = json['userId'];
    totalProducts = json['totalProducts'];
    totalQuantity = json['totalQuantity'];
  }
  num? id;
  List<Products>? products;
  num? total;
  num? discountedTotal;
  num? userId;
  num? totalProducts;
  num? totalQuantity;
PdfOrderModel copyWith({  num? id,
  List<Products>? products,
  num? total,
  num? discountedTotal,
  num? userId,
  num? totalProducts,
  num? totalQuantity,
}) => PdfOrderModel(  id: id ?? this.id,
  products: products ?? this.products,
  total: total ?? this.total,
  discountedTotal: discountedTotal ?? this.discountedTotal,
  userId: userId ?? this.userId,
  totalProducts: totalProducts ?? this.totalProducts,
  totalQuantity: totalQuantity ?? this.totalQuantity,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    if (products != null) {
      map['products'] = products?.map((v) => v.toJson()).toList();
    }
    map['total'] = total;
    map['discountedTotal'] = discountedTotal;
    map['userId'] = userId;
    map['totalProducts'] = totalProducts;
    map['totalQuantity'] = totalQuantity;
    return map;
  }

}

class Products {
  Products({
      this.id, 
      this.title, 
      this.price, 
      this.quantity, 
      this.total, 
      this.discountPercentage, 
      this.discountedPrice,});

  Products.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    quantity = json['quantity'];
    total = json['total'];
    discountPercentage = json['discountPercentage'];
    discountedPrice = json['discountedPrice'];
  }
  num? id;
  String? title;
  num? price;
  num? quantity;
  num? total;
  num? discountPercentage;
  num? discountedPrice;
Products copyWith({  num? id,
  String? title,
  num? price,
  num? quantity,
  num? total,
  num? discountPercentage,
  num? discountedPrice,
}) => Products(  id: id ?? this.id,
  title: title ?? this.title,
  price: price ?? this.price,
  quantity: quantity ?? this.quantity,
  total: total ?? this.total,
  discountPercentage: discountPercentage ?? this.discountPercentage,
  discountedPrice: discountedPrice ?? this.discountedPrice,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['price'] = price;
    map['quantity'] = quantity;
    map['total'] = total;
    map['discountPercentage'] = discountPercentage;
    map['discountedPrice'] = discountedPrice;
    return map;
  }

}