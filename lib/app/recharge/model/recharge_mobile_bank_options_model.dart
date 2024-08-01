// To parse this JSON data, do
//
//     final rechargeMobileBankOptionsModel = rechargeMobileBankOptionsModelFromJson(jsonString);

import 'dart:convert';

RechargeMobileBankOptionsModel rechargeMobileBankOptionsModelFromJson(
        String str) =>
    RechargeMobileBankOptionsModel.fromJson(json.decode(str));

String rechargeMobileBankOptionsModelToJson(
        RechargeMobileBankOptionsModel data) =>
    json.encode(data.toJson());

class RechargeMobileBankOptionsModel {
  final bool status;
  final String message;
  final List<RechargeMobileBankData> data;

  RechargeMobileBankOptionsModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory RechargeMobileBankOptionsModel.fromJson(Map<String, dynamic> json) =>
      RechargeMobileBankOptionsModel(
        status: json["status"],
        message: json["message"],
        data: List<RechargeMobileBankData>.from(
            json["data"].map((x) => RechargeMobileBankData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class RechargeMobileBankData {
  final int id;
  final String title;
  final String accNumber;
  final String accType;

  RechargeMobileBankData({
    required this.id,
    required this.title,
    required this.accNumber,
    required this.accType,
  });

  factory RechargeMobileBankData.fromJson(Map<String, dynamic> json) =>
      RechargeMobileBankData(
        id: json["id"],
        title: json["title"],
        accNumber: json["acc_number"],
        accType: json["acc_type"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "acc_number": accNumber,
        "acc_type": accType,
      };
}
