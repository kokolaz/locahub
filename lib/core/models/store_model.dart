// To parse this JSON data, do
//
//     final storeModel = storeModelFromJson(jsonString);

import 'dart:convert';

List<StoreModel> storeModelFromJson(String str) =>
    List<StoreModel>.from(json.decode(str).map((x) => StoreModel.fromJson(x)));

String storeModelToJson(List<StoreModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class StoreModel {
  String city;
  String name;
  List<Product> products;

  StoreModel({
    required this.city,
    required this.name,
    required this.products,
  });

  factory StoreModel.fromJson(Map<String, dynamic> json) => StoreModel(
        city: json["city"],
        name: json["name"],
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "city": city,
        "name": name,
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
      };
}

class Product {
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

  Product({
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

  factory Product.fromJson(Map<String, dynamic> json) => Product(
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
