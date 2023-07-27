class FavoriteModel {
  List<Product>? data;
  String? message;
  int? status;

  FavoriteModel({this.data, this.message, this.status});

  FavoriteModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Product>[];
      json['data'].forEach((v) {
        data!.add(new Product.fromJson(v));
      });
    }
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    data['status'] = this.status;
    return data;
  }
}

class Product {
  int? id;
  String? name;
  String? price;
  int? stock;
  String? image;
  int? wishlistId;

  Product(
      {this.id,
        this.name,
        this.price,
        this.stock,
        this.image,
        this.wishlistId});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    stock = json['stock'];
    image = json['image'];
    wishlistId = json['wishlist_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['price'] = this.price;
    data['stock'] = this.stock;
    data['image'] = this.image;
    data['wishlist_id'] = this.wishlistId;
    return data;
  }
}