import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loan_app/app/change_password/api/change_password_api.dart';

class ChangePasswordController extends GetxController {
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswrodController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  RxBool isLoading = false.obs;
  Future<void> changePassword() async {
    isLoading.value = true;
    Map<String, dynamic> body = {
      "old_password": oldPasswordController.text,
      "password": newPasswrodController.text,
      "password_confirmation": confirmPasswordController.text,
    };
    bool isSaved = await ChangePasswordApi.changePasswordApi(body: body);

    if (isSaved) {
      Get.back(result: true);
    }
    isLoading.value = false;
  }
}
