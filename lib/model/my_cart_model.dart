
// class MyCartModel {
//   bool? success;
//   CartData? cartData;

//   MyCartModel({this.success, this.cartData});

//   MyCartModel.fromJson(Map<String, dynamic> json) {
//     if(json["success"] is bool) {
//       success = json["success"];
//     }
//     if(json["data"] is Map) {
//       cartData = json["data"] == null ? null : CartData.fromJson(json["data"]);
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> _data = <String, dynamic>{};
//     _data["success"] = success;
//     if(cartData != null) {
//       _data["data"] = cartData?.toJson();
//     }
//     return _data;
//   }
// }

// class CartData {
//   String? id;
//   String? user;
//   int? totalAmount;
//   List<Products>? products;
//   String? createdAt;
//   String? updatedAt;
//   int? v;

//   CartData({this.id, this.user, this.totalAmount, this.products, this.createdAt, this.updatedAt, this.v});

//   CartData.fromJson(Map<String, dynamic> json) {
//     if(json["_id"] is String) {
//       id = json["_id"];
//     }
//     if(json["user"] is String) {
//       user = json["user"];
//     }
//     if(json["totalAmount"] is int) {
//       totalAmount = json["totalAmount"];
//     }
//     if(json["products"] is List) {
//       products = json["products"] == null ? null : (json["products"] as List).map((e) => Products.fromJson(e)).toList();
//     }
//     if(json["createdAt"] is String) {
//       createdAt = json["createdAt"];
//     }
//     if(json["updatedAt"] is String) {
//       updatedAt = json["updatedAt"];
//     }
//     if(json["__v"] is int) {
//       v = json["__v"];
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> _data = <String, dynamic>{};
//     _data["_id"] = id;
//     _data["user"] = user;
//     _data["totalAmount"] = totalAmount;
//     if(products != null) {
//       _data["products"] = products?.map((e) => e.toJson()).toList();
//     }
//     _data["createdAt"] = createdAt;
//     _data["updatedAt"] = updatedAt;
//     _data["__v"] = v;
//     return _data;
//   }
// }

// class Products {
//   String? id;
//   String? name;
//   String? brand;
//   int? price;
//   int? quantity;

//   Products({this.id, this.name, this.brand, this.price, this.quantity});

//   Products.fromJson(Map<String, dynamic> json) {
//     if(json["_id"] is String) {
//       id = json["_id"];
//     }
//     if(json["name"] is String) {
//       name = json["name"];
//     }
//     if(json["brand"] is String) {
//       brand = json["brand"];
//     }
//     if(json["price"] is int) {
//       price = json["price"];
//     }
//     if(json["quantity"] is int) {
//       quantity = json["quantity"];
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> _data = <String, dynamic>{};
//     _data["_id"] = id;
//     _data["name"] = name;
//     _data["brand"] = brand;
//     _data["price"] = price;
//     _data["quantity"] = quantity;
//     return _data;
//   }
// }


class MyCartModel {
  bool? success;
   CartData? cartData;

  MyCartModel({this.success, this.cartData});

  MyCartModel.fromJson(Map<String, dynamic> json) {
    if(json["success"] is bool) {
      success = json["success"];
    }
    if(json["data"] is Map) {
      cartData = json["data"] == null ? null : CartData.fromJson(json["data"]);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["success"] = success;
    if(cartData != null) {
      _data["data"] = cartData?.toJson();
    }
    return _data;
  }
}

class CartData {
  String? id;
  User? user;
  int? totalAmount;
  List<Products>? products;
  String? createdAt;
  String? updatedAt;
  int? v;

  CartData({this.id, this.user, this.totalAmount, this.products, this.createdAt, this.updatedAt, this.v});

  CartData.fromJson(Map<String, dynamic> json) {
    if(json["_id"] is String) {
      id = json["_id"];
    }
    if(json["user"] is Map) {
      user = json["user"] == null ? null : User.fromJson(json["user"]);
    }
    if(json["totalAmount"] is int) {
      totalAmount = json["totalAmount"];
    }
    if(json["products"] is List) {
      products = json["products"] == null ? null : (json["products"] as List).map((e) => Products.fromJson(e)).toList();
    }
    if(json["createdAt"] is String) {
      createdAt = json["createdAt"];
    }
    if(json["updatedAt"] is String) {
      updatedAt = json["updatedAt"];
    }
    if(json["__v"] is int) {
      v = json["__v"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["_id"] = id;
    if(user != null) {
      _data["user"] = user?.toJson();
    }
    _data["totalAmount"] = totalAmount;
    if(products != null) {
      _data["products"] = products?.map((e) => e.toJson()).toList();
    }
    _data["createdAt"] = createdAt;
    _data["updatedAt"] = updatedAt;
    _data["__v"] = v;
    return _data;
  }
}

class Products {
  Id? id;
  String? name;
  String? brand;
  int? price;
  int? quantity;

  Products({this.id, this.name, this.brand, this.price, this.quantity});

  Products.fromJson(Map<String, dynamic> json) {
    if(json["_id"] is Map) {
      id = json["_id"] == null ? null : Id.fromJson(json["_id"]);
    }
    if(json["name"] is String) {
      name = json["name"];
    }
    if(json["brand"] is String) {
      brand = json["brand"];
    }
    if(json["price"] is int) {
      price = json["price"];
    }
    if(json["quantity"] is int) {
      quantity = json["quantity"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if(id != null) {
      _data["_id"] = id?.toJson();
    }
    _data["name"] = name;
    _data["brand"] = brand;
    _data["price"] = price;
    _data["quantity"] = quantity;
    return _data;
  }
}

class Id {
  String? id;
  String? name;
  String? brand;
  String? category;
  List<String>? tags;
  String? size;
  String? color;
  int? price;
  int? quantity;
  int? rating;
  bool? isPublished;
  String? image;
  String? createdAt;
  String? updatedAt;
  int? v;
  String? description;

  Id({this.id, this.name, this.brand, this.category, this.tags, this.size, this.color, this.price, this.quantity, this.rating, this.isPublished, this.image, this.createdAt, this.updatedAt, this.v, this.description});

  Id.fromJson(Map<String, dynamic> json) {
    if(json["_id"] is String) {
      id = json["_id"];
    }
    if(json["name"] is String) {
      name = json["name"];
    }
    if(json["brand"] is String) {
      brand = json["brand"];
    }
    if(json["category"] is String) {
      category = json["category"];
    }
    if(json["tags"] is List) {
      tags = json["tags"] == null ? null : List<String>.from(json["tags"]);
    }
    if(json["size"] is String) {
      size = json["size"];
    }
    if(json["color"] is String) {
      color = json["color"];
    }
    if(json["price"] is int) {
      price = json["price"];
    }
    if(json["quantity"] is int) {
      quantity = json["quantity"];
    }
    if(json["rating"] is int) {
      rating = json["rating"];
    }
    if(json["isPublished"] is bool) {
      isPublished = json["isPublished"];
    }
    if(json["image"] is String) {
      image = json["image"];
    }
    if(json["createdAt"] is String) {
      createdAt = json["createdAt"];
    }
    if(json["updatedAt"] is String) {
      updatedAt = json["updatedAt"];
    }
    if(json["__v"] is int) {
      v = json["__v"];
    }
    if(json["description"] is String) {
      description = json["description"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["_id"] = id;
    _data["name"] = name;
    _data["brand"] = brand;
    _data["category"] = category;
    if(tags != null) {
      _data["tags"] = tags;
    }
    _data["size"] = size;
    _data["color"] = color;
    _data["price"] = price;
    _data["quantity"] = quantity;
    _data["rating"] = rating;
    _data["isPublished"] = isPublished;
    _data["image"] = image;
    _data["createdAt"] = createdAt;
    _data["updatedAt"] = updatedAt;
    _data["__v"] = v;
    _data["description"] = description;
    return _data;
  }
}

class User {
  String? id;
  String? name;
  String? email;
  int? phone;
  List<String>? roles;
  int? balance;
  String? createdAt;
  String? updatedAt;
  int? v;

  User({this.id, this.name, this.email, this.phone, this.roles, this.balance, this.createdAt, this.updatedAt, this.v});

  User.fromJson(Map<String, dynamic> json) {
    if(json["_id"] is String) {
      id = json["_id"];
    }
    if(json["name"] is String) {
      name = json["name"];
    }
    if(json["email"] is String) {
      email = json["email"];
    }
    if(json["phone"] is int) {
      phone = json["phone"];
    }
    if(json["roles"] is List) {
      roles = json["roles"] == null ? null : List<String>.from(json["roles"]);
    }
    if(json["balance"] is int) {
      balance = json["balance"];
    }
    if(json["createdAt"] is String) {
      createdAt = json["createdAt"];
    }
    if(json["updatedAt"] is String) {
      updatedAt = json["updatedAt"];
    }
    if(json["__v"] is int) {
      v = json["__v"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["_id"] = id;
    _data["name"] = name;
    _data["email"] = email;
    _data["phone"] = phone;
    if(roles != null) {
      _data["roles"] = roles;
    }
    _data["balance"] = balance;
    _data["createdAt"] = createdAt;
    _data["updatedAt"] = updatedAt;
    _data["__v"] = v;
    return _data;
  }
}