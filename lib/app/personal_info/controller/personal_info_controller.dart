import 'package:get/get.dart';
import 'package:loan_app/app/loan_choice/controller/loan_choice_controller.dart';
import 'package:loan_app/app/loan_choice/model/dashboard_model.dart';
import 'package:loan_app/app/personal_info/api/personal_info_api.dart';
import 'package:loan_app/app/personal_info/model/personal_info_model.dart';
import 'package:loan_app/routes/routes.dart';

class PersonalInfoController extends GetxController {
  @override
  void onInit() {
    getPersonalInfo();
    super.onInit();
  }

  RxBool isLoading = false.obs;

  NidCard? nidCard;
  Eligibility? eligibility;
  BankAccount? bankAccount;
  PhoneNumber? phoneNumber;
  Signature? signature;
  DashBoardData? dashBoardData;

  Future<void> getPersonalInfo() async {
    isLoading.value = true;

    PersonalInfoModel? response = await PersonalInfoApi.getPersonalInfo();

    if (response != null) {
      nidCard = response.data.nidCard;
      eligibility = response.data.eligibility;
      bankAccount = response.data.bankAccount;
      phoneNumber = response.data.phoneNumber;
      signature = response.data.signature;
      
    }
    isLoading.value = false;
  }

  Future<void> goToIdCardVerificationPage() async {
    bool? loadData =
        await Get.toNamed(Routes.idCardVerificationPage, arguments: {
      "nidCard": nidCard,
    }) as bool?;
    if (loadData ?? false) {
      getPersonalInfo();
    }
  }

  void goToEligibilityValidationPage() async {
    bool? loadData =
        await Get.toNamed(Routes.eligibilityValidationPage, arguments: {
      "eligibility": eligibility,
    }) as bool?;
    if (loadData ?? false) {
      getPersonalInfo();
    }
  }

  void goToBankAccountValidationPage() async {
    bool? loadData =
        await Get.toNamed(Routes.bankAccountValidationPage, arguments: {
      "bank_account": bankAccount,
    }) as bool?;
    if (loadData ?? false) {
      getPersonalInfo();
    }
  }

  void goToContactValidationPage() async {
    bool? loadData =
        await Get.toNamed(Routes.contactValidationPage, arguments: {
      "phone_number": phoneNumber,
    }) as bool?;
    if (loadData ?? false) {
      getPersonalInfo();
    }
  }

  void goToSignatureValidationPage() async {
    bool? loadData =
        await Get.toNamed(Routes.signatureValidationPage, arguments: {
      "signature": signature,
    }) as bool?;
    if (loadData ?? false) {
      getPersonalInfo();
    }
  }
}
