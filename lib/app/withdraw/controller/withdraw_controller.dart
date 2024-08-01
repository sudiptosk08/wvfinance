import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loan_app/app/withdraw/api/withdraw_api.dart';

class WithdrawController extends GetxController {
  RxBool isLoading = false.obs;

  TextEditingController withdrawalAmountTextController =
      TextEditingController();
  TextEditingController withdrawalCodeTextController = TextEditingController();

  Future<void> withdraw() async {
    isLoading.value = true;
    Map<String, dynamic> body = {
      "amount": withdrawalAmountTextController.text,
      "withdraw_code": withdrawalCodeTextController.text,
    };
    bool isSaved = await WithdrawApi.withdrawApi(body: body);

    if (isSaved) {
      withdrawalAmountTextController.clear();
      withdrawalCodeTextController.clear();
    }
    isLoading.value = false;
  }
}
