import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loan_app/app/recharge/api/recharge_options_api.dart';
import 'package:loan_app/app/recharge/model/recharge_bank_options_model.dart';
import 'package:loan_app/app/recharge/model/recharge_mobile_bank_options_model.dart';
import 'package:loan_app/utils/helpers/camera_helper.dart';

class RechargeController extends GetxController {
  @override
  void onInit() {
    getRechargeBankOptions();
    getRechargeMobileBankOptions();
    super.onInit();
  }

  RxBool isMobileBanking = true.obs;
  RxList<RechargeBankData> rechargeBankOption = <RechargeBankData>[].obs;
  RxList<RechargeMobileBankData> rechargeMobileBankOption =
      <RechargeMobileBankData>[].obs;
  RxString rechargeImage = "".obs;
  TextEditingController amountController = TextEditingController();

  RxBool isLoading = false.obs;

  Future<void> getRechargeBankOptions() async {
    isLoading.value = true;
    await RechargeOptionApi.getRechargeBankOptions().then((value) {
      if (value != null) {
        rechargeBankOption.value = value.data;
      }
    });
    isLoading.value = false;
  }

  Future<void> getRechargeMobileBankOptions() async {
    RechargeOptionApi.getRechargeMobileBankingOptions().then((value) {
      if (value != null) {
        rechargeMobileBankOption.value = value.data;
      }
    });
  }

  Future<void> recharge() async {
    isLoading.value = true;
    bool isUpdated = await RechargeOptionApi.rechargeApi(body: {
      "amount": amountController.text,
    }, multiKeyImagePathList: [
      {"key": "image", "value": rechargeImage.value},
    ]);
    if (isUpdated) {
      amountController.clear();
      rechargeImage.value = "";
    }
    isLoading.value = false;
  }

  void pickImage({required ImageSource source, required imageFor}) async {
    XFile? image = await CameraHelper.pickImage(
      source: source,
    );

    if (image != null) {
      rechargeImage.value = image.path;
    }
  }
}
