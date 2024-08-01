import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loan_app/app/id_card_verification/api/id_card_verification_api.dart';
import 'package:loan_app/app/personal_info/model/personal_info_model.dart';
import 'package:loan_app/utils/helpers/camera_helper.dart';

class IdCardVerificationController extends GetxController {
  @override
  void onInit() {
    initFunc();
    super.onInit();
  }

  void initFunc() {
    nidCard = Get.arguments?["nidCard"];
    if (nidCard != null) {
      nameController.text = nidCard!.name;
      idNumberController.text = nidCard!.nidNumber;
      idFront.value = nidCard!.frontImage;
      idBack.value = nidCard!.backImage;
      selfie.value = nidCard!.selfieImage;
    }
  }

  RxBool isLoading = false.obs;
  NidCard? nidCard;
  TextEditingController nameController = TextEditingController();
  TextEditingController idNumberController = TextEditingController();

  Future<void> saveIDCard() async {
    isLoading.value = true;
    bool isSaved = await IdCardVerificationApi.saveIDCardInfoApi(body: {
      "name": nameController.text,
      "nid_number": idNumberController.text,
    }, multiKeyImagePathList: [
      {"key": "front_image", "value": idFront.value},
      {"key": "back_image", "value": idBack.value},
      {"key": "selfie_image", "value": selfie.value},
    ]);
    if (isSaved) {
      Get.back<bool>(result: true);
    }
    isLoading.value = false;
  }

  Future<void> updateIDCard() async {
    isLoading.value = true;
    bool isUpdated = await IdCardVerificationApi.updateIDCardInfoApi(body: {
      "name": nameController.text,
      "nid_number": idNumberController.text,
    }, multiKeyImagePathList: [
      {"key": "front_image", "value": idFront.value},
      {"key": "back_image", "value": idBack.value},
      {"key": "selfie_image", "value": selfie.value},
    ]);
    if (isUpdated) {
      Get.back<bool>(result: true);
    }
    isLoading.value = false;
  }

  RxString idFront = "".obs;
  RxString idBack = "".obs;
  RxString selfie = "".obs;

  void pickImage({required ImageSource source, required imageFor}) async {
    XFile? image = await CameraHelper.pickImage(
      source: source,
    );

    if (image != null) {
      if (imageFor == "idFront") {
        idFront.value = image.path;
      } else if (imageFor == "idBack") {
        idBack.value = image.path;
      } else if (imageFor == "selfie") {
        selfie.value = image.path;
      }
    }
  }
}
