// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.id,
    this.name,
    this.email,
    this.bio,
    this.ttl,
    this.username,
    this.phoneNumber,
    this.roles,
    this.emailVerifiedAt,
    this.twoFactorConfirmedAt,
    this.currentTeamId,
    this.profilePhotoPath,
    this.createdAt,
    this.updatedAt,
    this.profilePhotoUrl,
  });

  int? id;
  String? name;
  String? email;
  String? bio;
  String? ttl;
  String? username;
  String? phoneNumber;
  String? roles;
  dynamic emailVerifiedAt;
  dynamic twoFactorConfirmedAt;
  dynamic currentTeamId;
  dynamic profilePhotoPath;
  String? createdAt;
  String? updatedAt;
  String? profilePhotoUrl;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        bio: json["bio"],
        ttl: json["ttl"],
        username: json["username"],
        phoneNumber: json["phone_number"],
        roles: json["roles"],
        emailVerifiedAt: json["email_verified_at"],
        twoFactorConfirmedAt: json["two_factor_confirmed_at"],
        currentTeamId: json["current_team_id"],
        profilePhotoPath: json["profile_photo_path"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        profilePhotoUrl: json["profile_photo_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "bio": bio,
        "ttl": ttl,
        "username": username,
        "phone_number": phoneNumber,
        "roles": roles,
        "email_verified_at": emailVerifiedAt,
        "two_factor_confirmed_at": twoFactorConfirmedAt,
        "current_team_id": currentTeamId,
        "profile_photo_path": profilePhotoPath,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "profile_photo_url": profilePhotoUrl,
      };
}
