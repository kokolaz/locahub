// To parse this JSON data, do
//
//     final favoriteModel = favoriteModelFromJson(jsonString);

import 'dart:convert';

List<FavoriteModel> favoriteModelFromJson(String str) =>
    List<FavoriteModel>.from(
        json.decode(str).map((x) => FavoriteModel.fromJson(x)));

String favoriteModelToJson(List<FavoriteModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FavoriteModel {
  int id;
  String userId;
  String productsId;
  DateTime createdAt;
  DateTime updatedAt;
  Products products;

  FavoriteModel({
    required this.id,
    required this.userId,
    required this.productsId,
    required this.createdAt,
    required this.updatedAt,
    required this.products,
  });

  factory FavoriteModel.fromJson(Map<String, dynamic> json) => FavoriteModel(
        id: json["id"],
        userId: json["user_id"],
        productsId: json["products_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        products: Products.fromJson(json["products"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "products_id": productsId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "products": products.toJson(),
      };
}

class Products {
  int id;
  String name;
  String price;
  String productsInformation;
  String categoriesId;
  String storeId;
  String tags;
  String height;
  String wide;
  String long;
  String weight;
  String status;
  String stock;
  String productSold;
  dynamic deletedAt;
  DateTime createdAt;
  DateTime updatedAt;

  Products({
    required this.id,
    required this.name,
    required this.price,
    required this.productsInformation,
    required this.categoriesId,
    required this.storeId,
    required this.tags,
    required this.height,
    required this.wide,
    required this.long,
    required this.weight,
    required this.status,
    required this.stock,
    required this.productSold,
    this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Products.fromJson(Map<String, dynamic> json) => Products(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        productsInformation: json["products_information"],
        categoriesId: json["categories_id"],
        storeId: json["store_id"],
        tags: json["tags"],
        height: json["height"],
        wide: json["wide"],
        long: json["long"],
        weight: json["weight"],
        status: json["status"],
        stock: json["stock"],
        productSold: json["product_sold"],
        deletedAt: json["deleted_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "products_information": productsInformation,
        "categories_id": categoriesId,
        "store_id": storeId,
        "tags": tags,
        "height": height,
        "wide": wide,
        "long": long,
        "weight": weight,
        "status": status,
        "stock": stock,
        "product_sold": productSold,
        "deleted_at": deletedAt,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
