class ProductModel {
  Data? data;
  String? message;
  int? status;

  ProductModel({this.data, this.message, this.status});

  ProductModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = message;
    data['status'] = status;
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? image;
  List<Products>? products;

  Data({this.id, this.name, this.image, this.products});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  int? productId;
  String? productName;
  String? category;
  String? productDescription;
  int? productStock;
  String? productPrice;
  String? productImage;

  Products(
      {this.productId,
        this.productName,
        this.category,
        this.productDescription,
        this.productStock,
        this.productPrice,
        this.productImage});

  Products.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    productName = json['product_name'];
    category = json['category'];
    productDescription = json['product_description'];
    productStock = json['product_stock'];
    productPrice = json['product_price'];
    productImage = json['product_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product_id'] = productId;
    data['product_name'] = productName;
    data['category'] = category;
    data['product_description'] = productDescription;
    data['product_stock'] = productStock;
    data['product_price'] = productPrice;
    data['product_image'] = productImage;
    return data;
  }
}