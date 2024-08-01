// To parse this JSON data, do
//
//     final dashBoardModel = dashBoardModelFromJson(jsonString);

import 'dart:convert';

DashBoardModel dashBoardModelFromJson(String str) =>
    DashBoardModel.fromJson(json.decode(str));

String dashBoardModelToJson(DashBoardModel data) => json.encode(data.toJson());

class DashBoardModel {
  final bool status;
  final DashBoardData data;

  DashBoardModel({
    required this.status,
    required this.data,
  });

  factory DashBoardModel.fromJson(Map<String, dynamic> json) => DashBoardModel(
        status: json["status"],
        data: DashBoardData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
      };
}

class DashBoardData {
  final User user;
  final Currency currency;
  final Loan loan;
  final String? agreement;

  DashBoardData({
    required this.user,
    required this.currency,
    required this.loan,
    required this.agreement,
  });

  factory DashBoardData.fromJson(Map<String, dynamic> json) => DashBoardData(
        user: User.fromJson(json["user"]),
        currency: Currency.fromJson(json["currency"]),
        loan: Loan.fromJson(json["loan"]),
        agreement: json["agreement"],
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "currency": currency.toJson(),
        "loan": loan.toJson(),
        "agreement": agreement,
      };
}

class Currency {
  final String name;
  final String symbol;

  Currency({
    required this.name,
    required this.symbol,
  });

  factory Currency.fromJson(Map<String, dynamic> json) => Currency(
        name: json["name"],
        symbol: json["symbol"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "symbol": symbol,
      };
}

class Loan {
  final String interestRate;
  final List<int> amounts;
  final List<int> installments;

  Loan({
    required this.interestRate,
    required this.amounts,
    required this.installments,
  });

  factory Loan.fromJson(Map<String, dynamic> json) => Loan(
        interestRate: json["interest_rate"],
        amounts: List<int>.from(json["amounts"].map((x) => x)),
        installments: List<int>.from(json["installments"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "interest_rate": interestRate,
        "amounts": List<dynamic>.from(amounts.map((x) => x)),
        "installments": List<dynamic>.from(installments.map((x) => x)),
      };
}

class User {
  final int id;
  final String userId;
  final String name;
  final String phoneCode;
  final String phone;
  final String fullPhone;
  final int loanEligibled;
  final int balance;
  final int loanBalance;
  final String image;
  final String cardNumber;
  final String cardExpiryDate;
  final int loanApplied;
  

  User({
    required this.id,
    required this.userId,
    required this.name,
    required this.phoneCode,
    required this.phone,
    required this.fullPhone,
    required this.loanEligibled,
    required this.balance,
    required this.loanBalance,
    required this.image,
    required this.cardNumber,
    required this.cardExpiryDate,
    required this.loanApplied,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        userId: json["user_id"],
        name: json["name"],
        phoneCode: json["phone_code"],
        phone: json["phone"],
        fullPhone: json["full_phone"],
        loanEligibled: json["loan_eligibled"],
        balance: json["balance"],
        loanBalance: json["loan_balance"],
        image: json["image"],
        cardNumber: json["card_number"],
        cardExpiryDate: json["card_expiry_date"],
        loanApplied: json["loan_applied"]
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "name": name,
        "phone_code": phoneCode,
        "phone": phone,
        "full_phone": fullPhone,
        "loan_eligibled": loanEligibled,
        "balance": balance,
        "loan_balance": loanBalance,
        "image": image,
        "card_number": cardNumber,
        "card_expiry_date": cardExpiryDate,
        "loan_applied": loanApplied
      };
}
