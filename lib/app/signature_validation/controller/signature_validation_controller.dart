import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loan_app/app/personal_info/model/personal_info_model.dart';
import 'package:loan_app/app/signature_validation/api/signature_validation_api.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:ui' as ui;

class SignatureValidationController extends GetxController {
  @override
  void onInit() {
    initFunc();
    super.onInit();
  }

  void initFunc() {
    signature = Get.arguments?["signature"];
    if (signature != null) {
      signatureImage.value = signature!.image;
    }
  }

  RxBool isLoading = false.obs;
  RxString signatureImage = "".obs;
  Signature? signature;

  Future<void> saveSignature() async {
    isLoading.value = true;
    await getSignature();

    bool isSaved = await SignatureVerificationApi.saveSignatureApi(
      filePath: signatureImage.value,
    );

    if (isSaved) {
      Get.back(result: true);
      
    }
    isLoading.value = false;
  }
  Future<void> updateSignature() async {
    isLoading.value = true;
    await getSignature();

    bool isSaved = await SignatureVerificationApi.updateSignatureApi(
      filePath: signatureImage.value,
    );

    if (isSaved) {
      Get.back(result: true);
    }
    isLoading.value = false;
  }

  GlobalKey<SfSignaturePadState> signaturePadKey = GlobalKey();

  Future<void> getSignature() async {
    final ui.Image data =
        await signaturePadKey.currentState!.toImage(pixelRatio: 3.0);
    final bytes = await data.toByteData(format: ui.ImageByteFormat.png);
    if (bytes != null) {
      final Directory tempDir = await getTemporaryDirectory();
      final String tempPath = tempDir.path;
      final File imageFile = File('$tempPath/signature.png');
      await imageFile.writeAsBytes(bytes.buffer.asUint8List());
      signatureImage.value = imageFile.path;
    }
  }
}
