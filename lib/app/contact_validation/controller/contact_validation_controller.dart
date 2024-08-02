import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loan_app/app/contact_validation/api/contact_validation_api.dart';
import 'package:loan_app/app/personal_info/model/personal_info_model.dart';
import 'package:loan_app/local_storage/local_storage.dart';

class ContactValidationController extends GetxController {
  @override
  void onInit() {
    initFunc();
    super.onInit();
  }

  void initFunc() {
    phoneNumber = Get.arguments?["phone_number"];
    userNumController.text = LocalStorage.getUserNumber();
    if (phoneNumber != null) {
      userNumController.text = phoneNumber!.own;
      guardianNumController.text = phoneNumber!.guardian;
      friendNumController.text = phoneNumber!.friend;
    }
  }

  TextEditingController userNumController = TextEditingController();
  TextEditingController guardianNumController = TextEditingController();
  TextEditingController friendNumController = TextEditingController();

  RxBool isLoading = false.obs;
  PhoneNumber? phoneNumber;
  Future<void> saveContactInfo() async {
    isLoading.value = true;
    Map<String, dynamic> body = {
      "own": userNumController.text,
      "guardian": guardianNumController.text,
      "friend": friendNumController.text,
    };
    bool isSaved = await ContactVerificationApi.saveContactInfoApi(body: body);

    if (isSaved) {
      Get.back(result: true);
    }
    isLoading.value = false;
  }

  Future<void> updateContactInfo() async {
    isLoading.value = true;
    Map<String, dynamic> body = {
      "own": userNumController.text,
      "guardian": guardianNumController.text,
      "friend": friendNumController.text,
    };
    bool isUpdated =
        await ContactVerificationApi.updateContactInfoApi(body: body);

    if (isUpdated) {
      Get.back(result: true);
    }
    isLoading.value = false;
  }
}
