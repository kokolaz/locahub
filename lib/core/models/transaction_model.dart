// To parse this JSON data, do
//
//     final transactionModel = transactionModelFromJson(jsonString);

import 'dart:convert';

TransactionModel transactionModelFromJson(String str) =>
    TransactionModel.fromJson(json.decode(str));

String transactionModelToJson(TransactionModel data) =>
    json.encode(data.toJson());

class TransactionModel {
  bool success;
  Transaction transaction;
  String message;

  TransactionModel({
    required this.success,
    required this.transaction,
    required this.message,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) =>
      TransactionModel(
        success: json["success"],
        transaction: Transaction.fromJson(json["transaction"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "transaction": transaction.toJson(),
        "message": message,
      };
}

class Transaction {
  int id;
  String buyerId;
  String addressId;
  String code;
  dynamic note;
  String grandTotal;
  String paymentStatus;
  String snapToken;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  Buyer buyer;
  List<StoreTransaction> storeTransactions;
  Address address;

  Transaction({
    required this.id,
    required this.buyerId,
    required this.addressId,
    required this.code,
    this.note,
    required this.grandTotal,
    required this.paymentStatus,
    required this.snapToken,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.buyer,
    required this.storeTransactions,
    required this.address,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
        id: json["id"],
        buyerId: json["buyer_id"],
        addressId: json["address_id"],
        code: json["code"],
        note: json["note"],
        grandTotal: json["grand_total"],
        paymentStatus: json["payment_status"],
        snapToken: json["snap_token"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        buyer: Buyer.fromJson(json["buyer"]),
        storeTransactions: List<StoreTransaction>.from(
            json["store_transactions"]
                .map((x) => StoreTransaction.fromJson(x))),
        address: Address.fromJson(json["address"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "buyer_id": buyerId,
        "address_id": addressId,
        "code": code,
        "note": note,
        "grand_total": grandTotal,
        "payment_status": paymentStatus,
        "snap_token": snapToken,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
        "buyer": buyer.toJson(),
        "store_transactions":
            List<dynamic>.from(storeTransactions.map((x) => x.toJson())),
        "address": address.toJson(),
      };
}

class Address {
  int id;
  String userId;
  String addressLabel;
  String name;
  String phoneNumber;
  String address;
  String completeAddress;
  String addressDetail;
  String choice;
  String postcode;
  String district;
  String cityId;
  String provinceId;
  dynamic deletedAt;
  DateTime createdAt;
  DateTime updatedAt;

  Address({
    required this.id,
    required this.userId,
    required this.addressLabel,
    required this.name,
    required this.phoneNumber,
    required this.address,
    required this.completeAddress,
    required this.addressDetail,
    required this.choice,
    required this.postcode,
    required this.district,
    required this.cityId,
    required this.provinceId,
    this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        id: json["id"],
        userId: json["user_id"],
        addressLabel: json["address_label"],
        name: json["name"],
        phoneNumber: json["phone_number"],
        address: json["address"],
        completeAddress: json["complete_address"],
        addressDetail: json["address_detail"],
        choice: json["choice"],
        postcode: json["postcode"],
        district: json["district"],
        cityId: json["city_id"],
        provinceId: json["province_id"],
        deletedAt: json["deleted_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "address_label": addressLabel,
        "name": name,
        "phone_number": phoneNumber,
        "address": address,
        "complete_address": completeAddress,
        "address_detail": addressDetail,
        "choice": choice,
        "postcode": postcode,
        "district": district,
        "city_id": cityId,
        "province_id": provinceId,
        "deleted_at": deletedAt,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class Buyer {
  int id;
  String name;
  String email;
  String bio;
  DateTime ttl;
  dynamic username;
  String phoneNumber;
  String roles;
  dynamic emailVerifiedAt;
  dynamic providerId;
  dynamic providerBy;
  dynamic twoFactorConfirmedAt;
  dynamic currentTeamId;
  dynamic profilePhotoPath;
  DateTime createdAt;
  DateTime updatedAt;
  String profilePhotoUrl;

  Buyer({
    required this.id,
    required this.name,
    required this.email,
    required this.bio,
    required this.ttl,
    this.username,
    required this.phoneNumber,
    required this.roles,
    this.emailVerifiedAt,
    this.providerId,
    this.providerBy,
    this.twoFactorConfirmedAt,
    this.currentTeamId,
    this.profilePhotoPath,
    required this.createdAt,
    required this.updatedAt,
    required this.profilePhotoUrl,
  });

  factory Buyer.fromJson(Map<String, dynamic> json) => Buyer(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        bio: json["bio"],
        ttl: DateTime.parse(json["ttl"]),
        username: json["username"],
        phoneNumber: json["phone_number"],
        roles: json["roles"],
        emailVerifiedAt: json["email_verified_at"],
        providerId: json["provider_id"],
        providerBy: json["provider_by"],
        twoFactorConfirmedAt: json["two_factor_confirmed_at"],
        currentTeamId: json["current_team_id"],
        profilePhotoPath: json["profile_photo_path"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        profilePhotoUrl: json["profile_photo_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "bio": bio,
        "ttl": ttl.toIso8601String(),
        "username": username,
        "phone_number": phoneNumber,
        "roles": roles,
        "email_verified_at": emailVerifiedAt,
        "provider_id": providerId,
        "provider_by": providerBy,
        "two_factor_confirmed_at": twoFactorConfirmedAt,
        "current_team_id": currentTeamId,
        "profile_photo_path": profilePhotoPath,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "profile_photo_url": profilePhotoUrl,
      };
}

class StoreTransaction {
  int id;
  String storeId;
  String transactionId;
  String status;
  String total;
  String shippingCost;
  String courier;
  String courierName;
  String shippingService;
  String shippingEtd;
  dynamic receipt;
  dynamic cancellationNote;
  DateTime createdAt;
  DateTime updatedAt;
  List<Item> items;

  StoreTransaction({
    required this.id,
    required this.storeId,
    required this.transactionId,
    required this.status,
    required this.total,
    required this.shippingCost,
    required this.courier,
    required this.courierName,
    required this.shippingService,
    required this.shippingEtd,
    this.receipt,
    this.cancellationNote,
    required this.createdAt,
    required this.updatedAt,
    required this.items,
  });

  factory StoreTransaction.fromJson(Map<String, dynamic> json) =>
      StoreTransaction(
        id: json["id"],
        storeId: json["store_id"],
        transactionId: json["transaction_id"],
        status: json["status"],
        total: json["total"],
        shippingCost: json["shipping_cost"],
        courier: json["courier"],
        courierName: json["courier_name"],
        shippingService: json["shipping_service"],
        shippingEtd: json["shipping_etd"],
        receipt: json["receipt"],
        cancellationNote: json["cancellation_note"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "store_id": storeId,
        "transaction_id": transactionId,
        "status": status,
        "total": total,
        "shipping_cost": shippingCost,
        "courier": courier,
        "courier_name": courierName,
        "shipping_service": shippingService,
        "shipping_etd": shippingEtd,
        "receipt": receipt,
        "cancellation_note": cancellationNote,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class Item {
  int id;
  String storeTransactionId;
  String productId;
  Product product;
  dynamic variation;
  String price;
  String quantity;
  String total;
  DateTime createdAt;
  DateTime updatedAt;

  Item({
    required this.id,
    required this.storeTransactionId,
    required this.productId,
    required this.product,
    this.variation,
    required this.price,
    required this.quantity,
    required this.total,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        storeTransactionId: json["store_transaction_id"],
        productId: json["product_id"],
        product: Product.fromJson(json["product"]),
        variation: json["variation"],
        price: json["price"],
        quantity: json["quantity"],
        total: json["total"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "store_transaction_id": storeTransactionId,
        "product_id": productId,
        "product": product.toJson(),
        "variation": variation,
        "price": price,
        "quantity": quantity,
        "total": total,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
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
  List<Gallery> galleries;

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
    required this.galleries,
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
        galleries: List<Gallery>.from(
            json["galleries"].map((x) => Gallery.fromJson(x))),
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
        "galleries": List<dynamic>.from(galleries.map((x) => x.toJson())),
      };
}

class Gallery {
  int id;
  String productsId;
  String url;
  dynamic deletedAt;
  DateTime createdAt;
  DateTime updatedAt;

  Gallery({
    required this.id,
    required this.productsId,
    required this.url,
    this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Gallery.fromJson(Map<String, dynamic> json) => Gallery(
        id: json["id"],
        productsId: json["products_id"],
        url: json["url"],
        deletedAt: json["deleted_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "products_id": productsId,
        "url": url,
        "deleted_at": deletedAt,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
