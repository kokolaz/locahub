// To parse this JSON data, do
//
//     final productsModel = productsModelFromJson(jsonString);

import 'dart:convert';

import 'package:intl/intl.dart';

ProductsModel productsModelFromJson(String str) =>
    ProductsModel.fromJson(json.decode(str));

String productsModelToJson(ProductsModel data) => json.encode(data.toJson());

class ProductsModel {
  ProductsModel({
    this.meta,
    this.data,
  });

  Meta? meta;
  ProductResponse? data;

  factory ProductsModel.fromJson(Map<String, dynamic> json) => ProductsModel(
        meta: Meta.fromJson(json["meta"]),
        data: ProductResponse.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "meta": meta!.toJson(),
        "data": data!.toJson(),
      };
}

class ProductResponse {
  ProductResponse({
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.links,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  int? currentPage;
  List<Products>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Link>? links;
  dynamic nextPageUrl;
  String? path;
  int? perPage;
  dynamic prevPageUrl;
  int? to;
  int? total;

  factory ProductResponse.fromJson(Map<String, dynamic> json) =>
      ProductResponse(
        currentPage: json["current_page"],
        data:
            List<Products>.from(json["data"].map((x) => Products.fromJson(x))),
        firstPageUrl: json["first_page_url"],
        from: json["from"],
        lastPage: json["last_page"],
        lastPageUrl: json["last_page_url"],
        links: List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
        nextPageUrl: json["next_page_url"],
        path: json["path"],
        perPage: json["per_page"],
        prevPageUrl: json["prev_page_url"],
        to: json["to"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "first_page_url": firstPageUrl,
        "from": from,
        "last_page": lastPage,
        "last_page_url": lastPageUrl,
        "links": List<dynamic>.from(links!.map((x) => x.toJson())),
        "next_page_url": nextPageUrl,
        "path": path,
        "per_page": perPage,
        "prev_page_url": prevPageUrl,
        "to": to,
        "total": total,
      };
}

class Products {
  Products({
    this.id,
    this.name,
    this.price,
    this.productsInformation,
    this.categoriesId,
    this.storeId,
    this.tags,
    this.height,
    this.wide,
    this.long,
    this.weight,
    this.status,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.category,
    this.galleries,
    this.variation,
    this.rating,
    this.store,
  });

  int? id;
  String? name;
  String? price;
  String? productsInformation;
  String? categoriesId;
  String? storeId;
  String? tags;
  String? height;
  String? wide;
  String? long;
  String? weight;
  String? status;
  dynamic deletedAt;
  String? createdAt;
  String? updatedAt;
  Category? category;
  List<Gallery>? galleries;
  List<Variation>? variation;
  List<Rating>? rating;
  Store? store;

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
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        category: Category.fromJson(json["category"]),
        galleries: List<Gallery>.from(
            json["galleries"].map((x) => Gallery.fromJson(x))),
        variation: List<Variation>.from(
            json["variation"].map((x) => Variation.fromJson(x))),
        rating:
            List<Rating>.from(json["rating"].map((x) => Rating.fromJson(x))),
        store: Store.fromJson(json["store"]),
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
        "deleted_at": deletedAt,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "category": category!.toJson(),
        "galleries": List<dynamic>.from(galleries!.map((x) => x.toJson())),
        "variation": List<dynamic>.from(variation!.map((x) => x.toJson())),
        "rating": List<dynamic>.from(rating!.map((x) => x.toJson())),
        "store": store!.toJson(),
      };
}

class Category {
  Category({
    this.id,
    this.name,
    this.storeId,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? name;
  String? storeId;
  String? createdAt;
  String? updatedAt;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        storeId: json["store_id"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "store_id": storeId,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}

class Gallery {
  Gallery({
    this.id,
    this.productsId,
    this.url,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? productsId;
  String? url;
  dynamic deletedAt;
  String? createdAt;
  String? updatedAt;

  factory Gallery.fromJson(Map<String, dynamic> json) => Gallery(
        id: json["id"],
        productsId: json["products_id"],
        url: json["url"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "products_id": productsId,
        "url": url,
        "deleted_at": deletedAt,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}

class Rating {
  Rating({
    this.id,
    this.userId,
    this.productsId,
    this.content,
    this.status,
    this.rating,
    this.url,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? userId;
  String? productsId;
  String? content;
  String? status;
  String? rating;
  String? url;
  dynamic deletedAt;
  String? createdAt;
  String? updatedAt;

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        id: json["id"],
        userId: json["user_id"],
        productsId: json["products_id"],
        content: json["content"],
        status: json["status"],
        rating: json["rating"],
        url: json["url"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "products_id": productsId,
        "content": content,
        "status": status,
        "rating": rating,
        "url": url,
        "deleted_at": deletedAt,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}

class Store {
  Store({
    this.id,
    this.userId,
    this.couriersId,
    this.dayId,
    this.cityId,
    this.name,
    this.profile,
    this.image,
    this.url,
    this.username,
    this.addres,
    this.description,
    this.storeNote,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? userId;
  String? couriersId;
  String? dayId;
  String? cityId;
  String? name;
  String? profile;
  dynamic image;
  dynamic url;
  String? username;
  String? addres;
  String? description;
  String? storeNote;
  dynamic deletedAt;
  String? createdAt;
  String? updatedAt;

  factory Store.fromJson(Map<String, dynamic> json) => Store(
        id: json["id"],
        userId: json["user_id"],
        couriersId: json["couriers_id"],
        dayId: json["day_id"],
        cityId: json["city_id"],
        name: json["name"],
        profile: json["profile"],
        image: json["image"],
        url: json["url"],
        username: json["username"],
        addres: json["addres"],
        description: json["description"],
        storeNote: json["store_note"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "couriers_id": couriersId,
        "day_id": dayId,
        "city_id": cityId,
        "name": name,
        "profile": profile,
        "image": image,
        "url": url,
        "username": username,
        "addres": addres,
        "description": description,
        "store_note": storeNote,
        "deleted_at": deletedAt,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}

class Variation {
  Variation({
    this.id,
    this.productsId,
    this.name,
    this.detail,
    this.productsPrice,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? productsId;
  String? name;
  String? detail;
  String? productsPrice;
  dynamic deletedAt;
  String? createdAt;
  String? updatedAt;

  factory Variation.fromJson(Map<String, dynamic> json) => Variation(
        id: json["id"],
        productsId: json["products_id"],
        name: json["name"],
        detail: json["detail"],
        productsPrice: json["products_price"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "products_id": productsId,
        "name": name,
        "detail": detail,
        "products_price": productsPrice,
        "deleted_at": deletedAt,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}

class Link {
  Link({
    this.url,
    this.label,
    this.active,
  });

  String? url;
  String? label;
  bool? active;

  factory Link.fromJson(Map<String, dynamic> json) => Link(
        url: json["url"],
        label: json["label"],
        active: json["active"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "label": label,
        "active": active,
      };
}

class Meta {
  Meta({
    this.code,
    this.status,
    this.message,
  });

  int? code;
  String? status;
  String? message;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        code: json["code"],
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "message": message,
      };
}
