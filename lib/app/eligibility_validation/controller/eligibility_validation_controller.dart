import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loan_app/app/eligibility_validation/api/eligibility_verification_api.dart';
import 'package:loan_app/app/personal_info/model/personal_info_model.dart';

class EligibilityValidationController extends GetxController {
  @override
  void onInit() {
    initFunc();
    super.onInit();
  }

  void initFunc() {
    eligibility = Get.arguments?["eligibility"];
    if (eligibility != null) {
      nameController.text = eligibility!.name;
      educationController.text = eligibility!.education;
      occupationController.text = eligibility!.occupation;
      loanPurposeController.text = eligibility!.loanPurpose;
      monthlyIncomeController.text = eligibility!.monthlyIncome;
      familyMemberController.text = eligibility!.familyMember;
      contactController.text = eligibility!.contactNumber;
      carSelection.value = eligibility!.hasCar.toString();
      houseSelection.value = eligibility!.ownsHouse.toString();
    }
  }

  RxBool isLoading = false.obs;
  RxString carSelection = "0".obs;
  RxString houseSelection = "0".obs;
  Eligibility? eligibility;
  TextEditingController nameController = TextEditingController();
  TextEditingController educationController = TextEditingController();
  TextEditingController occupationController = TextEditingController();
  TextEditingController loanPurposeController = TextEditingController();
  TextEditingController monthlyIncomeController = TextEditingController();
  TextEditingController familyMemberController = TextEditingController();
  TextEditingController contactController = TextEditingController();

  Future<void> saveEligibility() async {
    isLoading.value = true;
    bool isSaved = await EligibilityVerificationApi.saveEligibilityApi(body: {
      "name": nameController.text,
      "occupation": occupationController.text,
      "education": educationController.text,
      "loan_purpose": loanPurposeController.text,
      "monthly_income": monthlyIncomeController.text,
      "family_member": familyMemberController.text,
      "contact_number": contactController.text,
      "has_car": carSelection.value.toString(),
      "owns_house": houseSelection.value.toString()
    });
    if (isSaved) {
      Get.back<bool>(result: true);
    }
    isLoading.value = false;
  }

  Future<void> updateEligibility() async {
    isLoading.value = true;
    bool isUpdated =
        await EligibilityVerificationApi.updateEligibilityApi(body: {
      "name": nameController.text,
      "occupation": occupationController.text,
      "education": educationController.text,
      "loan_purpose": loanPurposeController.text,
      "monthly_income": monthlyIncomeController.text,
      "family_member": familyMemberController.text,
      "contact_number": contactController.text,
      "has_car": carSelection.value.toString(),
      "owns_house": houseSelection.value.toString()
    });
    if (isUpdated) {
      Get.back<bool>(result: true);
    }
    isLoading.value = false;
  }
}
