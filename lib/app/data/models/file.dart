// To parse this JSON data, do
//
//     final fileModel = fileModelFromJson(jsonString);

import 'dart:convert';

FileModel fileModelFromJson(String str) => FileModel.fromJson(json.decode(str));

String fileModelToJson(FileModel data) => json.encode(data.toJson());

class FileModel {
  FileModel({
    required this.id,
    required this.permissions,
    required this.name,
    required this.dateCreated,
    required this.signature,
    required this.mimeType,
    required this.sizeOriginal,
  });

  String id;
  Permissions permissions;
  String name;
  int dateCreated;
  String signature;
  String mimeType;
  int sizeOriginal;

  factory FileModel.fromJson(Map<String, dynamic> json) => FileModel(
    id: json["\u0024id"],
    permissions: Permissions.fromJson(json["\u0024permissions"]),
    name: json["name"],
    dateCreated: json["dateCreated"],
    signature: json["signature"],
    mimeType: json["mimeType"],
    sizeOriginal: json["sizeOriginal"],
  );

  Map<String, dynamic> toJson() => {
    "\u0024id": id,
    "\u0024permissions": permissions.toJson(),
    "name": name,
    "dateCreated": dateCreated,
    "signature": signature,
    "mimeType": mimeType,
    "sizeOriginal": sizeOriginal,
  };
}

class Permissions {
  Permissions({
    required this.read,
    required this.write,
  });

  List<String> read;
  List<String> write;

  factory Permissions.fromJson(Map<String, dynamic> json) => Permissions(
    read: List<String>.from(json["read"].map((x) => x)),
    write: List<String>.from(json["write"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "read": List<dynamic>.from(read.map((x) => x)),
    "write": List<dynamic>.from(write.map((x) => x)),
  };
}
