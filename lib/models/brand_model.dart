// class BrandModel {
//   Item? data;
//   String? message;
//   // List<Null>? error;
//   int? status;
//
//   BrandModel({this.data, this.message, this.status});
//
//   BrandModel.fromJson(Map<String, dynamic> json) {
//     data = json['data'] != null ? Item.fromJson(json['data']) : null;
//     message = json['message'];
//     // if (json['error'] != null) {
//     //   error = <Null>[];
//     //   json['error'].forEach((v) { error!.add(Null.fromJson(v)); });
//     // }
//     status = json['status'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     if (this.data != null) {
//       data['data'] = this.data!.toJson();
//     }
//     data['message'] = message;
//     // if (error != null) {
//     //   data['error'] = error!.map((v) => v.toJson()).toList();
//     // }
//     data['status'] = status;
//     return data;
//   }
// }
//
// class Data {
//   Item? data;
//
//   Data({this.data});
//
//   Data.fromJson(Map<String, dynamic> json) {
//     data = json['data'] != null ? Item.fromJson(json['data']) : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     if (this.data != null) {
//       data['data'] = this.data!.toJson();
//     }
//     return data;
//   }
// }
//
// class Item {
//   Original? original;
//   String? exception;
//
//   Item({ this.original, this.exception});
//
//   Item.fromJson(Map<String, dynamic> json) {
//     original = json['original'] != null ? Original.fromJson(json['original']) : null;
//     exception = json['exception'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     if (original != null) {
//       data['original'] = original!.toJson();
//     }
//     data['exception'] = exception;
//     return data;
//   }
// }
//
//
// Map<String, dynamic> toJson() {
//   final Map<String, dynamic> data = <String, dynamic>{};
//   return data;
// }
//
//
// class Original {
//   List<Item>? data;
//   String? message;
//   // List<Null>? error;
//   int? status;
//
//   Original({this.data, this.message, this.status});
//
//   Original.fromJson(Map<String, dynamic> json) {
//     if (json['data'] != null) {
//       data = <Item>[];
//       json['data'].forEach((v) { data!.add(Item.fromJson(v)); });
//     }
//     message = json['message'];
//     // if (json['error'] != null) {
//     //   // error = <Null>[];
//     //   json['error'].forEach((v) { error!.add(Null.fromJson(v)); });
//     // }
//     status = json['status'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     if (this.data != null) {
//       data['data'] = this.data!.map((v) => v.toJson()).toList();
//     }
//     data['message'] = message;
//     // if (this.error != null) {
//     //   data['error'] = this.error!.map((v) => v.toJson()).toList();
//     // }
//     data['status'] = status;
//     return data;
//   }
// }
//
// class ItemData {
//   int? id;
//   String? name;
//   int? productsCount;
//
//   ItemData({this.id, this.name, this.productsCount});
//
//   ItemData.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     productsCount = json['products_count'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['name'] = name;
//     data['products_count'] = productsCount;
//     return data;
//   }
// }

//
// class BrandModel{
//   String? message;
//   int? status;
//   List<Brand>?brand;
//
//   BrandModel(this.message, this.status, this.brand);
//
//   BrandModel.fromJson(Map<String, dynamic> json) {
//     message = json['message'];
//     status = json['status'];
//     if (json['brand'] != null) {
//       brand = <Brand>[];
//       json['data'].forEach((v) {
//         brand!.add(Brand.fromJson(v));
//       });
//     }
//   }
//
// }
// class Brand{
//   int? id;
//   String? name;
//   int? productsCount;
//   String? image;
//   Brand(this.id, this.name, this.productsCount,this.image);
//
//   Brand.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     productsCount = json['productsCount'];
//     image=json['image'];
//   }
// }

class BrandModel {
  Data? data;
  String? message;
  int? status;

  BrandModel({this.data, this.message, this.status});

  BrandModel.fromJson(Map<String, dynamic> json) {
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
  Item? data;

  Data({this.data});

  Data.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Item.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Item {
  Original? original;

  Item({ this.original, });

  Item.fromJson(Map<String, dynamic> json) {
    original = json['original'] != null ? Original.fromJson(json['original']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    if (original != null) {
      data['original'] = original!.toJson();
    }
    return data;
  }
}




class Original {
  List<ItemData>? data;
  String? message;
  int? status;

  Original({this.data, this.message,  this.status});

  Original.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <ItemData>[];
      json['data'].forEach((v) { data!.add(ItemData.fromJson(v)); });
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

class ItemData {
  int? id;
  String? name;
  int? productsCount;
  String? image;
  String? description;
  String? price;
  int? stock;
  String? brand;
  String?category;
  ItemData(this.id, this.name, this.productsCount,this.price, this.image, this.description,
      this.stock, this.brand, this.category);

  ItemData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image=json['image'];
    name = json['name'];
    productsCount = json['products_count'];
    description = json['description'];
    stock = json['stock'];
    brand = json['brand'];
    category = json['category'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image']=image;
    data['products_count'] = productsCount;
    data['description'] = description;
    data['stock'] = stock;
    data['brand'] = brand;
    data['category'] = category;
    return data;
  }
}