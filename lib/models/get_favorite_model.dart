class GetFavoriteModel {
  Data? data;
  String? message;
  int? status;

  GetFavoriteModel({this.data, this.message, this.status});

  GetFavoriteModel.fromJson(Map<String, dynamic> json) {
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
  Dataa? data;

  Data({this.data});

  Data.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Dataa.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Dataa {
  Original? original;
  String? exception;

  Dataa({ this.original, this.exception});

  Dataa.fromJson(Map<String, dynamic> json) {
    original = json['original'] != null ? Original.fromJson(json['original']) : null;
    exception = json['exception'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    return data;
  }
}


Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = <String, dynamic>{};
  return data;
}


class Original {
  List<DataItem>? data;
  String? message;
  int? status;

  Original({this.data, this.message, this.status});

  Original.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <DataItem>[];
      json['data'].forEach((v) { data!.add(DataItem.fromJson(v)); });
    }
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    data['status'] = status;
    return data;
  }
}

class DataItem {
  int? id;
  int? userId;
  String? userName;
  List<Product>? product;

  DataItem({this.id, this.userId, this.userName, this.product});

  DataItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    userName = json['user_name'];
    if (json['product'] != null) {
      product = <Product>[];
      json['product'].forEach((v) { product!.add(Product.fromJson(v)); });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['user_name'] = userName;
    if (product != null) {
      data['product'] = product!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Product {
  int? productId;
  String? productName;
  String? category;
  String? brand;
  String? productPrice;
  int? productStock;
  String? productImage;
  bool? isFavorite=true;

  Product({this.productId, this.productName, this.category, this.brand, this.productPrice, this.productStock, this.productImage});

  Product.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    productName = json['product_name'];
    category = json['category'];
    brand = json['brand'];
    productPrice = json['product_price'];
    productStock = json['product_stock'];
    productImage = json['product_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product_id'] = productId;
    data['product_name'] = productName;
    data['category'] = category;
    data['brand'] = brand;
    data['product_price'] = productPrice;
    data['product_stock'] = productStock;
    data['product_image'] = productImage;
    return data;
  }
}