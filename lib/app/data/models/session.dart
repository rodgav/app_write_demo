// To parse this JSON data, do
//
//     final sessionModel = sessionModelFromJson(jsonString);

import 'dart:convert';

SessionModel sessionModelFromJson(String str) => SessionModel.fromJson(json.decode(str));

String sessionModelToJson(SessionModel data) => json.encode(data.toJson());

class SessionModel {
  SessionModel({
    required this.id,
    required this.userId,
    required this.expire,
    required this.provider,
    required this.providerUid,
    required this.providerToken,
    required this.ip,
    required this.osCode,
    required this.osName,
    required this.osVersion,
    required this.clientType,
    required this.clientCode,
    required this.clientName,
    required this.clientVersion,
    required this.clientEngine,
    required this.clientEngineVersion,
    required this.deviceName,
    required this.deviceBrand,
    required this.deviceModel,
    required this.countryCode,
    required this.countryName,
    required this.current,
  });

  String id;
  String userId;
  int expire;
  String provider;
  String providerUid;
  String providerToken;
  String ip;
  String osCode;
  String osName;
  String osVersion;
  String clientType;
  String clientCode;
  String clientName;
  String clientVersion;
  String clientEngine;
  String clientEngineVersion;
  String deviceName;
  String deviceBrand;
  String deviceModel;
  String countryCode;
  String countryName;
  bool current;

  factory SessionModel.fromJson(Map<String, dynamic> json) => SessionModel(
    id: json["\u0024id"],
    userId: json["userId"],
    expire: json["expire"],
    provider: json["provider"],
    providerUid: json["providerUid"],
    providerToken: json["providerToken"],
    ip: json["ip"],
    osCode: json["osCode"],
    osName: json["osName"],
    osVersion: json["osVersion"],
    clientType: json["clientType"],
    clientCode: json["clientCode"],
    clientName: json["clientName"],
    clientVersion: json["clientVersion"],
    clientEngine: json["clientEngine"],
    clientEngineVersion: json["clientEngineVersion"],
    deviceName: json["deviceName"],
    deviceBrand: json["deviceBrand"],
    deviceModel: json["deviceModel"],
    countryCode: json["countryCode"],
    countryName: json["countryName"],
    current: json["current"],
  );

  Map<String, dynamic> toJson() => {
    "\u0024id": id,
    "userId": userId,
    "expire": expire,
    "provider": provider,
    "providerUid": providerUid,
    "providerToken": providerToken,
    "ip": ip,
    "osCode": osCode,
    "osName": osName,
    "osVersion": osVersion,
    "clientType": clientType,
    "clientCode": clientCode,
    "clientName": clientName,
    "clientVersion": clientVersion,
    "clientEngine": clientEngine,
    "clientEngineVersion": clientEngineVersion,
    "deviceName": deviceName,
    "deviceBrand": deviceBrand,
    "deviceModel": deviceModel,
    "countryCode": countryCode,
    "countryName": countryName,
    "current": current,
  };
}
