// To parse this JSON data, do
//
//     final loanRecordHistoryModel = loanRecordHistoryModelFromJson(jsonString);

import 'dart:convert';

LoanRecordHistoryModel loanRecordHistoryModelFromJson(String str) =>
    LoanRecordHistoryModel.fromJson(json.decode(str));

String loanRecordHistoryModelToJson(LoanRecordHistoryModel data) =>
    json.encode(data.toJson());

class LoanRecordHistoryModel {
  final bool status;
  final List<LoanRecordData> data;

  LoanRecordHistoryModel({
    required this.status,
    required this.data,
  });

  factory LoanRecordHistoryModel.fromJson(Map<String, dynamic> json) =>
      LoanRecordHistoryModel(
        status: json["status"],
        data: List<LoanRecordData>.from(
            json["data"].map((x) => LoanRecordData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class LoanRecordData {
  final int id;
  final String amount;
  final String installmentAmount;
  final String payableAmount;
  final int installments;
  final int paidInstallments;
  final String interestRate;
  final String status;
  final String createdAt;
  final String? notes;
  final List<InstallmentRecord> installmentRecords;

  LoanRecordData({
    required this.id,
    required this.amount,
    required this.installmentAmount,
    required this.payableAmount,
    required this.installments,
    required this.paidInstallments,
    required this.interestRate,
    required this.status,
    required this.createdAt,
    required this.notes,
    required this.installmentRecords,
  });

  factory LoanRecordData.fromJson(Map<String, dynamic> json) => LoanRecordData(
        id: json["id"],
        amount: json["amount"],
        installmentAmount: json["installment_amount"],
        payableAmount: json["payable_amount"],
        installments: json["installments"],
        paidInstallments: json["paid_installments"],
        interestRate: json["interest_rate"],
        status: json["status"],
        createdAt: json["created_at"],
        installmentRecords: List<InstallmentRecord>.from(
            json["installment_records"]
                .map((x) => InstallmentRecord.fromJson(x))),
        notes: json["notes"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "amount": amount,
        "installment_amount": installmentAmount,
        "payable_amount": payableAmount,
        "installments": installments,
        "paid_installments": paidInstallments,
        "interest_rate": interestRate,
        "status": status,
        "created_at": createdAt,
        "installment_records":
            List<dynamic>.from(installmentRecords.map((x) => x.toJson())),
      };
}

class InstallmentRecord {
  final int id;
  final String billNo;
  final String amount;
  final int isPaid;
  final String lastDate;

  InstallmentRecord({
    required this.id,
    required this.billNo,
    required this.amount,
    required this.isPaid,
    required this.lastDate,
  });

  factory InstallmentRecord.fromJson(Map<String, dynamic> json) =>
      InstallmentRecord(
        id: json["id"],
        billNo: json["bill_no"],
        amount: json["amount"],
        isPaid: json["is_paid"],
        lastDate: json["last_date"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "bill_no": billNo,
        "amount": amount,
        "is_paid": isPaid,
        "last_date": lastDate,
      };
}
