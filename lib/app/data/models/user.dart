// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    required this.id,
    required this.name,
    required this.registration,
    required this.status,
    required this.passwordUpdate,
    required this.email,
    required this.emailVerification,
    required this.prefs,
  });

  String id;
  String name;
  int registration;
  int status;
  int passwordUpdate;
  String email;
  bool emailVerification;
  Prefs prefs;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json["\u0024id"],
    name: json["name"],
    registration: json["registration"],
    status: json["status"],
    passwordUpdate: json["passwordUpdate"],
    email: json["email"],
    emailVerification: json["emailVerification"],
    prefs: Prefs.fromJson(json["prefs"]),
  );

  Map<String, dynamic> toJson() => {
    "\u0024id": id,
    "name": name,
    "registration": registration,
    "status": status,
    "passwordUpdate": passwordUpdate,
    "email": email,
    "emailVerification": emailVerification,
    "prefs": prefs.toJson(),
  };
}

class Prefs {
  Prefs();

  factory Prefs.fromJson(Map<String, dynamic> json) => Prefs(
  );

  Map<String, dynamic> toJson() => {
  };
}
