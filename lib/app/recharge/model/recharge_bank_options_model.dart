// To parse this JSON data, do
//
//     final rechargeOptionsModel = rechargeOptionsModelFromJson(jsonString);

import 'dart:convert';

RechargeBankOptionsModel rechargeOptionsModelFromJson(String str) =>
    RechargeBankOptionsModel.fromJson(json.decode(str));

String rechargeOptionsModelToJson(RechargeBankOptionsModel data) =>
    json.encode(data.toJson());

class RechargeBankOptionsModel {
  final bool status;
  final String message;
  final List<RechargeBankData> data;

  RechargeBankOptionsModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory RechargeBankOptionsModel.fromJson(Map<String, dynamic> json) =>
      RechargeBankOptionsModel(
        status: json["status"],
        message: json["message"],
        data: List<RechargeBankData>.from(
            json["data"].map((x) => RechargeBankData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class RechargeBankData {
  final int id;
  final String title;
  final String accNumber;
  final String description;

  RechargeBankData({
    required this.id,
    required this.title,
    required this.accNumber,
    required this.description,
  });

  factory RechargeBankData.fromJson(Map<String, dynamic> json) =>
      RechargeBankData(
        id: json["id"],
        title: json["title"],
        accNumber: json["acc_number"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "acc_number": accNumber,
        "description": description,
      };
}
