import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loan_app/app/bank_account_validation/api/bank_account_verification_api.dart';
import 'package:loan_app/app/personal_info/model/personal_info_model.dart';

class BankAccountValidationController extends GetxController {
  @override
  void onInit() {
    initFunc();
    super.onInit();
  }

  void initFunc() {
    bankAccount = Get.arguments?["bank_account"];
    if (bankAccount != null) {
      nameController.text = bankAccount!.accHolderName;
      bankNameController.text = bankAccount!.bankName;
      accountNumController.text = bankAccount!.accNumber;
      branchNameController.text = bankAccount!.branchName;
    }
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController bankNameController = TextEditingController();
  TextEditingController accountNumController = TextEditingController();
  TextEditingController branchNameController = TextEditingController();
  RxBool isLoading = false.obs;
  BankAccount? bankAccount;
  Future<void> saveBankAccount() async {
    isLoading.value = true;
    Map<String, dynamic> body = {
      "acc_holder_name": nameController.text,
      "bank_name": bankNameController.text,
      "acc_number": accountNumController.text,
      "branch_name": branchNameController.text,
    };
    bool isSaved =
        await BankAccountVerificationApi.saveBankAccountInfoApi(body: body);

    if (isSaved) {
      Get.back<bool>(result: true);
    }
    isLoading.value = false;
  }

  Future<void> updateBankAccount() async {
    isLoading.value = true;
    Map<String, dynamic> body = {
      "acc_holder_name": nameController.text,
      "bank_name": bankNameController.text,
      "acc_number": accountNumController.text,
      "branch_name": branchNameController.text,
    };
    bool isUpdated =
        await BankAccountVerificationApi.updateBankAccountInfoApi(body: body);

    if (isUpdated) {
      Get.back<bool>(result: true);
    }
    isLoading.value = false;
  }
}
