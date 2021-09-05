// To parse this JSON data, do
//
//     final imageModel = imageModelFromJson(jsonString);

import 'dart:convert';

ImageModel imageModelFromJson(String str) => ImageModel.fromJson(json.decode(str));

String imageModelToJson(ImageModel data) => json.encode(data.toJson());

class ImageModel {
  ImageModel({
    required this.sum,
    required this.documents,
  });

  int sum;
  List<Images> documents;

  factory ImageModel.fromJson(Map<String, dynamic> json) => ImageModel(
    sum: json["sum"],
    documents: List<Images>.from(json["documents"].map((x) => Images.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "sum": sum,
    "documents": List<dynamic>.from(documents.map((x) => x.toJson())),
  };
}

class Images {
  Images({
    required this.id,
    required this.collection,
    required this.permissions,
    required this.userId,
    required this.fileId,
    required this.fileUrl,
  });

  String id;
  String collection;
  Permissions permissions;
  String userId;
  String fileId;
  String fileUrl;

  factory Images.fromJson(Map<String, dynamic> json) => Images(
    id: json["\u0024id"],
    collection: json["\u0024collection"],
    permissions: Permissions.fromJson(json["\u0024permissions"]),
    userId: json["userId"],
    fileId: json["fileId"],
    fileUrl: json["fileUrl"],
  );

  Map<String, dynamic> toJson() => {
    "\u0024id": id,
    "\u0024collection": collection,
    "\u0024permissions": permissions.toJson(),
    "userId": userId,
    "fileId": fileId,
    "fileUrl": fileUrl,
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
