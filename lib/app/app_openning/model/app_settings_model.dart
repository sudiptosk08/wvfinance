// To parse this JSON data, do
//
//     final appSettingModel = appSettingModelFromJson(jsonString);

import 'dart:convert';

AppSettingModel appSettingModelFromJson(String str) =>
    AppSettingModel.fromJson(json.decode(str));

String appSettingModelToJson(AppSettingModel data) =>
    json.encode(data.toJson());

class AppSettingModel {
  final bool status;
  final String message;
  final Data data;

  AppSettingModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory AppSettingModel.fromJson(Map<String, dynamic> json) =>
      AppSettingModel(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
      };
}

class Data {
  final String appName;
  final String appIcon;
  final String appVersion;
  final String whatsapp;
  final String telegram;
  final String interestRate;
  final String about;
  final List<Faq> faqs;
  final Language language;

  Data({
    required this.appName,
    required this.appIcon,
    required this.appVersion,
    required this.whatsapp,
    required this.telegram,
    required this.interestRate,
    required this.about,
    required this.faqs,
    required this.language,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        appName: json["app_name"],
        appIcon: json["app_icon"],
        appVersion: json["app_version"],
        whatsapp: json["whatsapp"],
        telegram: json["telegram"],
        interestRate: json["interest_rate"],
        about: json["about"],
        faqs: List<Faq>.from(json["faqs"].map((x) => Faq.fromJson(x))),
        language: Language.fromJson(json["language"]),
      );

  Map<String, dynamic> toJson() => {
        "app_name": appName,
        "app_icon": appIcon,
        "app_version": appVersion,
        "whatsapp": whatsapp,
        "telegram": telegram,
        "interest_rate": interestRate,
        "about": about,
        "faqs": List<dynamic>.from(faqs.map((x) => x.toJson())),
        "language": language.toJson(),
      };
}

class Faq {
  final int id;
  final String question;
  final String answer;

  Faq({
    required this.id,
    required this.question,
    required this.answer,
  });

  factory Faq.fromJson(Map<String, dynamic> json) => Faq(
        id: json["id"],
        question: json["question"],
        answer: json["answer"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "question": question,
        "answer": answer,
      };
}

class Language {
  final Lang en;
  final Lang bn;

  Language({
    required this.en,
    required this.bn,
  });

  factory Language.fromJson(Map<String, dynamic> json) => Language(
        en: Lang.fromJson(json["en"]),
        bn: Lang.fromJson(json["bn"]),
      );

  Map<String, dynamic> toJson() => {
        "en": en.toJson(),
        "bn": bn.toJson(),
      };
}

class Lang {
  final String the24HoursOnline;
  final String aboutUs;
  final String accountNumber;
  final String anyFamilyMemberName;
  final String appVersion;
  final String balance;
  final String bankAccountValidation;
  final String bankAccountVerification;
  final String bankName;
  final String bdt;
  final String branchName;
  final String changeAccountPassword;
  final String clear;
  final String clickToReviewTheLoanAgreement;
  final String commonProblems;
  final String confirmNewPassword;
  final String confirmPassword;
  final String contact;
  final String createAnAccount;
  final String customerCare;
  final String customerService;
  final String cycle;
  final String dataValidation;
  final String details;
  final String doYouOwnACar;
  final String doYouOwnAHouse;
  final String donTHaveAnAccount;
  final String alreadyHaveAnAccount;
  final String duration;
  final String education;
  final String eligibilityValidation;
  final String enterNewPassword;
  final String enterRechargeAmount;
  final String enterWithdrawAmount;
  final String enterWithdrawalCode;
  final String enterYourOldPassword;
  final String estimatedLoan;
  final String familyMember;
  final String forALoan;
  final String forgotPassword;
  final String friendNumber;
  final String guardiantNumber;
  final String help;
  final String home;
  final String idCardValidation;
  final String idCardVerification;
  final String idNumber;
  final String interestType;
  final String interest;
  final String loanAmount;
  final String loanChoice;
  final String loanDetails;
  final String loanDuration;
  final String loanPurpose;
  final String loanRecords;
  final String loan;
  final String loaned;
  final String logOut;
  final String login;
  final String maximumBorrowableAmount;
  final String mobileBanking;
  final String monthlyIncome;
  final String myDebts;
  final String myWallet;
  final String name;
  final String newPassword;
  final String noHistoryAvailable;
  final String no;
  final String occupation;
  final String oldPassword;
  final String onlineBanking;
  final String onlineRecharge;
  final String password;
  final String personalInfo;
  final String phoneNumberValidation;
  final String phoneNumber;
  final String pickImageFromGallary;
  final String
      pleaseSelectTheLoanAmountAndInstallmentMonthPassTheReviceAndWithdrawWithin6HoursAtTheFastest;
  final String profile;
  final String rechageAmount;
  final String recharge;
  final String registration;
  final String request;
  final String required;
  final String seeYourInformation;
  final String selectOnlineBank;
  final String settings;
  final String signatureValidation;
  final String signature;
  final String submit;
  final String takePhotoFromCamera;
  final String theBankProvidesSecurityForYourAccount;
  final String theHighestCanApplyBdt;
  final String
      toReceiveOurInformationPleaseFillTheFollowingInformationTruthfully;
  final String uploadImage;
  final String uploadSelfieToEnsureYourIdentification;
  final String uploadTheBackSidePhotoOfYourIdCard;
  final String uploadTheFrontSidePhotoOfYourIdCard;
  final String userName;
  final String userNumber;
  final String verificationOfEligibility;
  final String verifyPersonalInformation;
  final String visit;
  final String walletBalance;
  final String wallet;
  final String withdrawAmount;
  final String withdrawMoney;
  final String withdraw;
  final String withdrawalCode;
  final String writeBankAccountBranchName;
  final String writeBankAccountHolderName;
  final String writeBankAccountNumber;
  final String writeBankName;
  final String writeContactNumber;
  final String writeGurdianContactNumber;
  final String writePurposeOfTheLoan;
  final String writeYourContactNumber;
  final String writeYourEducation;
  final String writeYourFriendsContactNumber;
  final String writeYourMonthlyIncome;
  final String writeYourName;
  final String writeYourOccupation;
  final String writeYourValidIdNumber;
  final String yes;
  final String yourWallet;
  final String validity;
  final String months;
  final String lowInterest;
  final String forAnyKindOfInformation;
  final String rechargeOption;
  final String verified;
  final String monthlyInstallment;
  final String totalRepayment;

  Lang({
    required this.the24HoursOnline,
    required this.aboutUs,
    required this.accountNumber,
    required this.anyFamilyMemberName,
    required this.appVersion,
    required this.balance,
    required this.bankAccountValidation,
    required this.bankAccountVerification,
    required this.bankName,
    required this.bdt,
    required this.branchName,
    required this.changeAccountPassword,
    required this.clear,
    required this.clickToReviewTheLoanAgreement,
    required this.commonProblems,
    required this.confirmNewPassword,
    required this.confirmPassword,
    required this.contact,
    required this.createAnAccount,
    required this.customerCare,
    required this.customerService,
    required this.cycle,
    required this.dataValidation,
    required this.details,
    required this.doYouOwnACar,
    required this.doYouOwnAHouse,
    required this.donTHaveAnAccount,
    required this.alreadyHaveAnAccount,
    required this.duration,
    required this.education,
    required this.eligibilityValidation,
    required this.enterNewPassword,
    required this.enterRechargeAmount,
    required this.enterWithdrawAmount,
    required this.enterWithdrawalCode,
    required this.enterYourOldPassword,
    required this.estimatedLoan,
    required this.familyMember,
    required this.forALoan,
    required this.forgotPassword,
    required this.friendNumber,
    required this.guardiantNumber,
    required this.help,
    required this.home,
    required this.idCardValidation,
    required this.idCardVerification,
    required this.idNumber,
    required this.interestType,
    required this.interest,
    required this.loanAmount,
    required this.loanChoice,
    required this.loanDetails,
    required this.loanDuration,
    required this.loanPurpose,
    required this.loanRecords,
    required this.loan,
    required this.loaned,
    required this.logOut,
    required this.login,
    required this.maximumBorrowableAmount,
    required this.mobileBanking,
    required this.monthlyIncome,
    required this.myDebts,
    required this.myWallet,
    required this.name,
    required this.newPassword,
    required this.noHistoryAvailable,
    required this.no,
    required this.occupation,
    required this.oldPassword,
    required this.onlineBanking,
    required this.onlineRecharge,
    required this.password,
    required this.personalInfo,
    required this.phoneNumberValidation,
    required this.phoneNumber,
    required this.pickImageFromGallary,
    required this.pleaseSelectTheLoanAmountAndInstallmentMonthPassTheReviceAndWithdrawWithin6HoursAtTheFastest,
    required this.profile,
    required this.rechageAmount,
    required this.recharge,
    required this.registration,
    required this.request,
    required this.required,
    required this.seeYourInformation,
    required this.selectOnlineBank,
    required this.settings,
    required this.signatureValidation,
    required this.signature,
    required this.submit,
    required this.takePhotoFromCamera,
    required this.theBankProvidesSecurityForYourAccount,
    required this.theHighestCanApplyBdt,
    required this.toReceiveOurInformationPleaseFillTheFollowingInformationTruthfully,
    required this.uploadImage,
    required this.uploadSelfieToEnsureYourIdentification,
    required this.uploadTheBackSidePhotoOfYourIdCard,
    required this.uploadTheFrontSidePhotoOfYourIdCard,
    required this.userName,
    required this.userNumber,
    required this.verificationOfEligibility,
    required this.verifyPersonalInformation,
    required this.visit,
    required this.walletBalance,
    required this.wallet,
    required this.withdrawAmount,
    required this.withdrawMoney,
    required this.withdraw,
    required this.withdrawalCode,
    required this.writeBankAccountBranchName,
    required this.writeBankAccountHolderName,
    required this.writeBankAccountNumber,
    required this.writeBankName,
    required this.writeContactNumber,
    required this.writeGurdianContactNumber,
    required this.writePurposeOfTheLoan,
    required this.writeYourContactNumber,
    required this.writeYourEducation,
    required this.writeYourFriendsContactNumber,
    required this.writeYourMonthlyIncome,
    required this.writeYourName,
    required this.writeYourOccupation,
    required this.writeYourValidIdNumber,
    required this.yes,
    required this.yourWallet,
    required this.validity,
    required this.months,
    required this.lowInterest,
    required this.forAnyKindOfInformation,
    required this.rechargeOption,
    required this.verified,
    required this.monthlyInstallment,
    required this.totalRepayment,
  });

  factory Lang.fromJson(Map<String, dynamic> json) => Lang(
        the24HoursOnline: json["24HoursOnline"],
        aboutUs: json["aboutUs"],
        accountNumber: json["accountNumber"],
        anyFamilyMemberName: json["anyFamilyMemberName"],
        appVersion: json["appVersion"],
        balance: json["balance"],
        bankAccountValidation: json["bankAccountValidation"],
        bankAccountVerification: json["bankAccountVerification"],
        bankName: json["bankName"],
        bdt: json["bdt"],
        branchName: json["branchName"],
        changeAccountPassword: json["changeAccountPassword"],
        clear: json["clear"],
        clickToReviewTheLoanAgreement: json["clickToReviewTheLoanAgreement"],
        commonProblems: json["commonProblems"],
        confirmNewPassword: json["confirmNewPassword"],
        confirmPassword: json["confirmPassword"],
        contact: json["contact"],
        createAnAccount: json["createAnAccount"],
        customerCare: json["customerCare"],
        customerService: json["customerService"],
        cycle: json["cycle"],
        dataValidation: json["dataValidation"],
        details: json["details"],
        doYouOwnACar: json["doYouOwnACar"],
        doYouOwnAHouse: json["doYouOwnAHouse"],
        donTHaveAnAccount: json["don'tHaveAnAccount?"],
        alreadyHaveAnAccount: json["alreadyHaveAnAccount"],
        duration: json["duration"],
        education: json["education"],
        eligibilityValidation: json["eligibilityValidation"],
        enterNewPassword: json["enterNewPassword"],
        enterRechargeAmount: json["enterRechargeAmount"],
        enterWithdrawAmount: json["enterWithdrawAmount"],
        enterWithdrawalCode: json["enterWithdrawalCode"],
        enterYourOldPassword: json["enterYourOldPassword"],
        estimatedLoan: json["estimatedLoan"],
        familyMember: json["familyMember"],
        forALoan: json["forALoan"],
        forgotPassword: json["forgotPassword"],
        friendNumber: json["friendNumber"],
        guardiantNumber: json["guardiantNumber"],
        help: json["help"],
        home: json["home"],
        idCardValidation: json["idCardValidation"],
        idCardVerification: json["idCardVerification"],
        idNumber: json["idNumber"],
        interestType: json["interestType"],
        interest: json["interest"],
        loanAmount: json["loanAmount"],
        loanChoice: json["loanChoice"],
        loanDetails: json["loanDetails"],
        loanDuration: json["loanDuration"],
        loanPurpose: json["loanPurpose"],
        loanRecords: json["loanRecords"],
        loan: json["loan"],
        loaned: json["loaned"],
        logOut: json["logOut"],
        login: json["login"],
        maximumBorrowableAmount: json["maximumBorrowableAmount"],
        mobileBanking: json["mobileBanking"],
        monthlyIncome: json["monthlyIncome"],
        myDebts: json["myDebts"],
        myWallet: json["myWallet"],
        name: json["name"],
        newPassword: json["newPassword"],
        noHistoryAvailable: json["noHistoryAvailable"],
        no: json["no"],
        occupation: json["occupation"],
        oldPassword: json["oldPassword"],
        onlineBanking: json["onlineBanking"],
        onlineRecharge: json["onlineRecharge"],
        password: json["password"],
        personalInfo: json["personalInfo"],
        phoneNumberValidation: json["phoneNumberValidation"],
        phoneNumber: json["phoneNumber"],
        pickImageFromGallary: json["pickImageFromGallary"],
        pleaseSelectTheLoanAmountAndInstallmentMonthPassTheReviceAndWithdrawWithin6HoursAtTheFastest:
            json[
                "pleaseSelectTheLoanAmountAndInstallmentMonthPassTheReviceAndWithdrawWithin6HoursAtTheFastest."],
        profile: json["profile"],
        rechageAmount: json["rechageAmount"],
        recharge: json["recharge"],
        registration: json["registration"],
        request: json["request"],
        required: json["required"],
        seeYourInformation: json["seeYourInformation"],
        selectOnlineBank: json["selectOnlineBank"],
        settings: json["settings"],
        signatureValidation: json["signatureValidation"],
        signature: json["signature"],
        submit: json["submit"],
        takePhotoFromCamera: json["takePhotoFromCamera"],
        theBankProvidesSecurityForYourAccount:
            json["theBankProvidesSecurityForYourAccount"],
        theHighestCanApplyBdt: json["theHighestCanApplyBDT"],
        toReceiveOurInformationPleaseFillTheFollowingInformationTruthfully: json[
            "toReceiveOurInformationPleaseFillTheFollowingInformationTruthfully"],
        uploadImage: json["uploadImage"],
        uploadSelfieToEnsureYourIdentification:
            json["uploadSelfieToEnsureYourIdentification"],
        uploadTheBackSidePhotoOfYourIdCard:
            json["uploadTheBackSidePhotoOfYourIDCard"],
        uploadTheFrontSidePhotoOfYourIdCard:
            json["uploadTheFrontSidePhotoOfYourIDCard"],
        userName: json["userName"],
        userNumber: json["userNumber"],
        verificationOfEligibility: json["verificationOfEligibility"],
        verifyPersonalInformation: json["verifyPersonalInformation"],
        visit: json["visit"],
        walletBalance: json["walletBalance"],
        wallet: json["wallet"],
        withdrawAmount: json["withdrawAmount"],
        withdrawMoney: json["withdrawMoney"],
        withdraw: json["withdraw"],
        withdrawalCode: json["withdrawalCode"],
        writeBankAccountBranchName: json["writeBankAccountBranchName"],
        writeBankAccountHolderName: json["writeBankAccountHolderName"],
        writeBankAccountNumber: json["writeBankAccountNumber"],
        writeBankName: json["writeBankName"],
        writeContactNumber: json["writeContactNumber"],
        writeGurdianContactNumber: json["writeGurdianContactNumber"],
        writePurposeOfTheLoan: json["writePurposeOfTheLoan"],
        writeYourContactNumber: json["writeYourContactNumber"],
        writeYourEducation: json["writeYourEducation"],
        writeYourFriendsContactNumber: json["writeYourFriendsContactNumber"],
        writeYourMonthlyIncome: json["writeYourMonthlyIncome"],
        writeYourName: json["writeYourName"],
        writeYourOccupation: json["writeYourOccupation"],
        writeYourValidIdNumber: json["writeYourValidIDNumber"],
        yes: json["yes"],
        yourWallet: json["yourWallet"],
        validity: json["validity"],
        months: json["months"],
        lowInterest: json["lowInterest"],
        forAnyKindOfInformation: json["forAnyKindOfInformation"],
        rechargeOption: json["rechargeOption"],
        verified: json["verified"],
        monthlyInstallment: json["monthlyInstallment"],
        totalRepayment: json["totalRepayment"],
      );

  Map<String, dynamic> toJson() => {
        "24HoursOnline": the24HoursOnline,
        "aboutUs": aboutUs,
        "accountNumber": accountNumber,
        "anyFamilyMemberName": anyFamilyMemberName,
        "appVersion": appVersion,
        "balance": balance,
        "bankAccountValidation": bankAccountValidation,
        "bankAccountVerification": bankAccountVerification,
        "bankName": bankName,
        "bdt": bdt,
        "branchName": branchName,
        "changeAccountPassword": changeAccountPassword,
        "clear": clear,
        "clickToReviewTheLoanAgreement": clickToReviewTheLoanAgreement,
        "commonProblems": commonProblems,
        "confirmNewPassword": confirmNewPassword,
        "confirmPassword": confirmPassword,
        "contact": contact,
        "createAnAccount": createAnAccount,
        "customerCare": customerCare,
        "customerService": customerService,
        "cycle": cycle,
        "dataValidation": dataValidation,
        "details": details,
        "doYouOwnACar": doYouOwnACar,
        "doYouOwnAHouse": doYouOwnAHouse,
        "don'tHaveAnAccount?": donTHaveAnAccount,
        "alreadyHaveAnAccount": alreadyHaveAnAccount,
        "duration": duration,
        "education": education,
        "eligibilityValidation": eligibilityValidation,
        "enterNewPassword": enterNewPassword,
        "enterRechargeAmount": enterRechargeAmount,
        "enterWithdrawAmount": enterWithdrawAmount,
        "enterWithdrawalCode": enterWithdrawalCode,
        "enterYourOldPassword": enterYourOldPassword,
        "estimatedLoan": estimatedLoan,
        "familyMember": familyMember,
        "forALoan": forALoan,
        "forgotPassword": forgotPassword,
        "friendNumber": friendNumber,
        "guardiantNumber": guardiantNumber,
        "help": help,
        "home": home,
        "idCardValidation": idCardValidation,
        "idCardVerification": idCardVerification,
        "idNumber": idNumber,
        "interestType": interestType,
        "interest": interest,
        "loanAmount": loanAmount,
        "loanChoice": loanChoice,
        "loanDetails": loanDetails,
        "loanDuration": loanDuration,
        "loanPurpose": loanPurpose,
        "loanRecords": loanRecords,
        "loan": loan,
        "loaned": loaned,
        "logOut": logOut,
        "login": login,
        "maximumBorrowableAmount": maximumBorrowableAmount,
        "mobileBanking": mobileBanking,
        "monthlyIncome": monthlyIncome,
        "myDebts": myDebts,
        "myWallet": myWallet,
        "name": name,
        "newPassword": newPassword,
        "noHistoryAvailable": noHistoryAvailable,
        "no": no,
        "occupation": occupation,
        "oldPassword": oldPassword,
        "onlineBanking": onlineBanking,
        "onlineRecharge": onlineRecharge,
        "password": password,
        "personalInfo": personalInfo,
        "phoneNumberValidation": phoneNumberValidation,
        "phoneNumber": phoneNumber,
        "pickImageFromGallary": pickImageFromGallary,
        "pleaseSelectTheLoanAmountAndInstallmentMonthPassTheReviceAndWithdrawWithin6HoursAtTheFastest.":
            pleaseSelectTheLoanAmountAndInstallmentMonthPassTheReviceAndWithdrawWithin6HoursAtTheFastest,
        "profile": profile,
        "rechageAmount": rechageAmount,
        "recharge": recharge,
        "registration": registration,
        "request": request,
        "required": required,
        "seeYourInformation": seeYourInformation,
        "selectOnlineBank": selectOnlineBank,
        "settings": settings,
        "signatureValidation": signatureValidation,
        "signature": signature,
        "submit": submit,
        "takePhotoFromCamera": takePhotoFromCamera,
        "theBankProvidesSecurityForYourAccount":
            theBankProvidesSecurityForYourAccount,
        "theHighestCanApplyBDT": theHighestCanApplyBdt,
        "toReceiveOurInformationPleaseFillTheFollowingInformationTruthfully":
            toReceiveOurInformationPleaseFillTheFollowingInformationTruthfully,
        "uploadImage": uploadImage,
        "uploadSelfieToEnsureYourIdentification":
            uploadSelfieToEnsureYourIdentification,
        "uploadTheBackSidePhotoOfYourIDCard":
            uploadTheBackSidePhotoOfYourIdCard,
        "uploadTheFrontSidePhotoOfYourIDCard":
            uploadTheFrontSidePhotoOfYourIdCard,
        "userName": userName,
        "userNumber": userNumber,
        "verificationOfEligibility": verificationOfEligibility,
        "verifyPersonalInformation": verifyPersonalInformation,
        "visit": visit,
        "walletBalance": walletBalance,
        "wallet": wallet,
        "withdrawAmount": withdrawAmount,
        "withdrawMoney": withdrawMoney,
        "withdraw": withdraw,
        "withdrawalCode": withdrawalCode,
        "writeBankAccountBranchName": writeBankAccountBranchName,
        "writeBankAccountHolderName": writeBankAccountHolderName,
        "writeBankAccountNumber": writeBankAccountNumber,
        "writeBankName": writeBankName,
        "writeContactNumber": writeContactNumber,
        "writeGurdianContactNumber": writeGurdianContactNumber,
        "writePurposeOfTheLoan": writePurposeOfTheLoan,
        "writeYourContactNumber": writeYourContactNumber,
        "writeYourEducation": writeYourEducation,
        "writeYourFriendsContactNumber": writeYourFriendsContactNumber,
        "writeYourMonthlyIncome": writeYourMonthlyIncome,
        "writeYourName": writeYourName,
        "writeYourOccupation": writeYourOccupation,
        "writeYourValidIDNumber": writeYourValidIdNumber,
        "yes": yes,
        "yourWallet": yourWallet,
        "validity": validity,
        "months": months,
        "lowInterest": lowInterest,
        "forAnyKindOfInformation": forAnyKindOfInformation,
        "rechargeOption": rechargeOption,
        "verified": verified,
        "monthlyInstallment": monthlyInstallment,
        "totalRepayment": totalRepayment,
      };
}
