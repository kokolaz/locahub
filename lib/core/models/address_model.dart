// To parse this JSON data, do
//
//     final addressModel = addressModelFromJson(jsonString);

import 'dart:convert';

AddressModel addressModelFromJson(String str) =>
    AddressModel.fromJson(json.decode(str));

String addressModelToJson(AddressModel data) => json.encode(data.toJson());

class AddressModel {
  AddressModel({
    required this.meta,
    required this.data,
  });

  final Meta meta;
  final Data data;

  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
        meta: Meta.fromJson(json["meta"]),
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "meta": meta.toJson(),
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.address,
  });

  final Address address;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        address: Address.fromJson(json["address"]),
      );

  Map<String, dynamic> toJson() => {
        "address": address.toJson(),
      };
}

class Address {
  Address({
    required this.currentPage,
    required this.data,
    required this.firstPageUrl,
    required this.from,
    required this.lastPage,
    required this.lastPageUrl,
    required this.links,
    required this.nextPageUrl,
    required this.path,
    required this.perPage,
    required this.prevPageUrl,
    required this.to,
    required this.total,
  });

  final int currentPage;
  final List<Datum> data;
  final String firstPageUrl;
  final int from;
  final int lastPage;
  final String lastPageUrl;
  final List<Link> links;
  final dynamic nextPageUrl;
  final String path;
  final int perPage;
  final dynamic prevPageUrl;
  final int to;
  final int total;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        currentPage: json["current_page"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
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
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "first_page_url": firstPageUrl,
        "from": from,
        "last_page": lastPage,
        "last_page_url": lastPageUrl,
        "links": List<dynamic>.from(links.map((x) => x.toJson())),
        "next_page_url": nextPageUrl,
        "path": path,
        "per_page": perPage,
        "prev_page_url": prevPageUrl,
        "to": to,
        "total": total,
      };
}

class Datum {
  Datum({
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
    required this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  final int id;
  final String userId;
  final String addressLabel;
  final String name;
  final String phoneNumber;
  final String address;
  final String completeAddress;
  final String addressDetail;
  final String choice;
  final String postcode;
  final String district;
  final String cityId;
  final String provinceId;
  final dynamic deletedAt;
  final DateTime createdAt;
  final DateTime updatedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        userId: json["user_id"].toString(),
        addressLabel: json["address_label"],
        name: json["name"],
        phoneNumber: json["phone_number"].toString(),
        address: json["address"],
        completeAddress: json["complete_address"],
        addressDetail: json["address_detail"],
        choice: json["choice"].toString(),
        postcode: json["postcode"].toString(),
        district: json["district"],
        cityId: json["city_id"].toString(),
        provinceId: json["province_id"].toString(),
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

class Link {
  Link({
    required this.url,
    required this.label,
    required this.active,
  });

  final String url;
  final String label;
  final bool active;

  factory Link.fromJson(Map<String, dynamic> json) => Link(
        url: json["url"].toString(),
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
    required this.code,
    required this.status,
    required this.message,
  });

  final int code;
  final String status;
  final String message;

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
