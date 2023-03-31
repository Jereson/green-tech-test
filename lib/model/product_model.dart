class ProductModel {
  bool? success;
  int? count;
  Pagination? pagination;
  List<ProductData>? productData;

  ProductModel({this.success, this.count, this.pagination, this.productData});

  ProductModel.fromJson(Map<String, dynamic> json) {
    if (json["success"] is bool) {
      success = json["success"];
    }
    if (json["count"] is int) {
      count = json["count"];
    }
    if (json["pagination"] is Map) {
      pagination = json["pagination"] == null
          ? null
          : Pagination.fromJson(json["pagination"]);
    }
    if (json["data"] is List) {
      productData = json["data"] == null
          ? null
          : (json["data"] as List).map((e) => ProductData.fromJson(e)).toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["success"] = success;
    _data["count"] = count;
    if (pagination != null) {
      _data["pagination"] = pagination?.toJson();
    }
    if (productData != null) {
      _data["data"] = productData?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class ProductData {
  String? id;
  String? name;
  String? brand;
  String? category;
  String? image;
  String? description;
  List<String>? tags;
  int? price;
  int? quantity;
  int? rating;
  bool? isPublished;
  String? createdAt;
  String? updatedAt;
  int? v;

  ProductData(
      {this.id,
      this.name,
      this.brand,
      this.category,
      this.image,
      this.tags,
      this.price,
      this.quantity,
      this.rating,
      this.isPublished,
      this.createdAt,
      this.updatedAt,
      this.v});

  ProductData.fromJson(Map<String, dynamic> json) {
    if (json["_id"] is String) {
      id = json["_id"];
    }
    if (json["name"] is String) {
      name = json["name"];
    }
    if (json["brand"] is String) {
      brand = json["brand"];
    }
    if (json["category"] is String) {
      category = json["category"];
    }
    if (json["image"] is String) {
      image = json["image"];
    }
    if (json["description"] is String) {
      description = json["description"];
    }
    if (json["tags"] is List) {
      tags = json["tags"] == null ? null : List<String>.from(json["tags"]);
    }
    if (json["price"] is int) {
      price = json["price"];
    }
    if (json["quantity"] is int) {
      quantity = json["quantity"];
    }
    if (json["rating"] is int) {
      rating = json["rating"];
    }
    if (json["isPublished"] is bool) {
      isPublished = json["isPublished"];
    }
    if (json["createdAt"] is String) {
      createdAt = json["createdAt"];
    }
    if (json["updatedAt"] is String) {
      updatedAt = json["updatedAt"];
    }
    if (json["__v"] is int) {
      v = json["__v"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["_id"] = id;
    _data["name"] = name;
    _data["brand"] = brand;
    _data["category"] = category;
    _data["image"] = image;
    _data["description"] = description;
    if (tags != null) {
      _data["tags"] = tags;
    }
    _data["price"] = price;
    _data["quantity"] = quantity;
    _data["rating"] = rating;
    _data["isPublished"] = isPublished;
    _data["createdAt"] = createdAt;
    _data["updatedAt"] = updatedAt;
    _data["__v"] = v;
    return _data;
  }
}

class Pagination {
  Pagination();

  Pagination.fromJson(Map<String, dynamic> json) {}

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};

    return _data;
  }
}
