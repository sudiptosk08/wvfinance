import 'dart:convert';

PersonalInfoModel personalInfoModelFromJson(String str) =>
    PersonalInfoModel.fromJson(json.decode(str));

String personalInfoModelToJson(PersonalInfoModel data) =>
    json.encode(data.toJson());

class PersonalInfoModel {
  final bool status;
  final PersonalInfo data;

  PersonalInfoModel({
    required this.status,
    required this.data,
  });

  factory PersonalInfoModel.fromJson(Map<String, dynamic> json) =>
      PersonalInfoModel(
        status: json["status"],
        data: PersonalInfo.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
      };
}

class PersonalInfo {
  final NidCard? nidCard;
  final Eligibility? eligibility;
  final BankAccount? bankAccount;
  final PhoneNumber? phoneNumber;
  final Signature? signature;

  PersonalInfo({
    required this.nidCard,
    required this.eligibility,
    required this.bankAccount,
    required this.phoneNumber,
    required this.signature,
  });

  factory PersonalInfo.fromJson(Map<String, dynamic> json) => PersonalInfo(
        nidCard: json["nid_card"] == null
            ? null
            : NidCard.fromJson(json["nid_card"]),
        eligibility: json["eligibility"] == null
            ? null
            : Eligibility.fromJson(json["eligibility"]),
        bankAccount: json["bank_account"] == null
            ? null
            : BankAccount.fromJson(json["bank_account"]),
        phoneNumber: json["phone_number"] == null
            ? null
            : PhoneNumber.fromJson(json["phone_number"]),
        signature: json["signature"] == null
            ? null
            : Signature.fromJson(json["signature"]),
      );

  Map<String, dynamic> toJson() => {
        "nid_card": nidCard!.toJson(),
        "eligibility": eligibility!.toJson(),
        "bank_account": bankAccount!.toJson(),
        "phone_number": phoneNumber!.toJson(),
        "signature": signature!.toJson(),
      };
}

class BankAccount {
  String accHolderName;
  String bankName;
  String accNumber;
  String branchName;
  dynamic verifiedAt;
  dynamic notes;

  BankAccount({
    required this.accHolderName,
    required this.bankName,
    required this.accNumber,
    required this.branchName,
    required this.verifiedAt,
    required this.notes,
  });

  factory BankAccount.fromJson(Map<String, dynamic> json) => BankAccount(
        accHolderName: json["acc_holder_name"],
        bankName: json["bank_name"],
        accNumber: json["acc_number"],
        branchName: json["branch_name"],
        verifiedAt: json["verified_at"],
        notes: json["notes"],
      );

  Map<String, dynamic> toJson() => {
        "acc_holder_name": accHolderName,
        "bank_name": bankName,
        "acc_number": accNumber,
        "branch_name": branchName,
        "verified_at": verifiedAt,
        "notes": notes,
      };
}

class Eligibility {
  String name;
  String education;
  String occupation;
  String loanPurpose;
  String monthlyIncome;
  String familyMember;
  String contactNumber;
  dynamic hasCar;
  dynamic ownsHouse;
  dynamic verifiedAt;
  dynamic notes;

  Eligibility({
    required this.name,
    required this.education,
    required this.occupation,
    required this.loanPurpose,
    required this.monthlyIncome,
    required this.familyMember,
    required this.contactNumber,
    required this.hasCar,
    required this.ownsHouse,
    required this.verifiedAt,
    required this.notes,
  });

  factory Eligibility.fromJson(Map<String, dynamic> json) => Eligibility(
        name: json["name"],
        education: json["education"],
        occupation: json["occupation"],
        loanPurpose: json["loan_purpose"],
        monthlyIncome: json["monthly_income"],
        familyMember: json["family_member"],
        contactNumber: json["contact_number"],
        hasCar: json["has_car"],
        ownsHouse: json["owns_house"],
        verifiedAt: json["verified_at"],
        notes: json["notes"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "education": education,
        "occupation": occupation,
        "loan_purpose": loanPurpose,
        "monthly_income": monthlyIncome,
        "family_member": familyMember,
        "contact_number": contactNumber,
        "has_car": hasCar,
        "owns_house": ownsHouse,
        "verified_at": verifiedAt,
        "notes": notes,
      };
}

class NidCard {
  final String name;
  final String nidNumber;
  final String frontImage;
  final String backImage;
  final String selfieImage;
  final String? verifiedAt;
  final String? notes;

  NidCard({
    required this.name,
    required this.nidNumber,
    required this.frontImage,
    required this.backImage,
    required this.selfieImage,
    required this.verifiedAt,
    required this.notes,
  });

  factory NidCard.fromJson(Map<String, dynamic> json) => NidCard(
        name: json["name"],
        nidNumber: json["nid_number"],
        frontImage: json["front_image"],
        backImage: json["back_image"],
        selfieImage: json["selfie_image"],
        verifiedAt: json["verified_at"],
        notes: json["notes"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "nid_number": nidNumber,
        "front_image": frontImage,
        "back_image": backImage,
        "selfie_image": selfieImage,
        "verified_at": verifiedAt,
        "notes": notes,
      };
}

class PhoneNumber {
  String own;
  String guardian;
  String friend;
  dynamic verifiedAt;
  dynamic notes;

  PhoneNumber({
    required this.own,
    required this.guardian,
    required this.friend,
    required this.verifiedAt,
    required this.notes,
  });

  factory PhoneNumber.fromJson(Map<String, dynamic> json) => PhoneNumber(
        own: json["own"],
        guardian: json["guardian"],
        friend: json["friend"],
        verifiedAt: json["verified_at"],
        notes: json["notes"],
      );

  Map<String, dynamic> toJson() => {
        "own": own,
        "guardian": guardian,
        "friend": friend,
        "verified_at": verifiedAt,
        "notes": notes,
      };
}

class Signature {
  String image;
  dynamic verifiedAt;
  dynamic notes;

  Signature({
    required this.image,
    required this.verifiedAt,
    required this.notes,
  });

  factory Signature.fromJson(Map<String, dynamic> json) => Signature(
        image: json["image"],
        verifiedAt: json["verified_at"],
        notes: json["notes"],
      );

  Map<String, dynamic> toJson() => {
        "image": image,
        "verified_at": verifiedAt,
        "notes": notes,
      };
}
