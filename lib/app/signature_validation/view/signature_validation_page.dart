import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loan_app/app/signature_validation/controller/signature_validation_controller.dart';
import 'package:loan_app/app/widgets/custom_loading/custom_loading.dart';

import 'package:loan_app/utils/buttons/custom_button.dart';
import 'package:loan_app/utils/color/kcolors.dart';
import 'package:loan_app/utils/lang/app_lang.dart';
import 'package:loan_app/utils/sizes/k_sizes.dart';
import 'package:loan_app/utils/text_utils/text_utils.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';

class SignatureValidationPage extends GetView<SignatureValidationController> {
  const SignatureValidationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Stack(
        children: [
          Scaffold(
            backgroundColor: KColors.white,
            appBar: AppBar(
              title: Text(appLang.signatureValidation),
            ),
            body: ListView(
              children: [
                Container(
                  width: double.maxFinite,
                  color: KColors.white,
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    children: [
                      const Divider(
                        color: KColors.borderColor,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              appLang.signature,
                              style: TextStyle(fontSize: KFontSize.medium, fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            width: KSizes.hGapSmall,
                          ),
                        ],
                      ),
                      const Divider(
                        color: KColors.borderColor,
                      ),
                      controller.signatureImage.isEmpty
                          ? SizedBox(
                              height: 300.h,
                              child: SfSignaturePad(
                                key: controller.signaturePadKey,
                                minimumStrokeWidth: 2,
                                maximumStrokeWidth: 3,
                                backgroundColor: KColors.borderColor,
                              ),
                            )
                          : SizedBox(
                              height: 300.h,
                              child: Image.network(controller.signatureImage.value),
                            ),
                      const Divider(
                        color: KColors.borderColor,
                      ),
                      controller.signature != null
                          ? Container()
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SizedBox(
                                  width: 100.w,
                                  child: CustomButton(
                                    name: appLang.clear,
                                    color: KColors.grey,
                                    textColor: KColors.black,
                                    onTap: () {
                                      controller.signatureImage.value.isNotEmpty ? controller.signatureImage.value = "" : controller.signaturePadKey.currentState!.clear();
                                    },
                                  ),
                                ),
                              ],
                            )
                    ],
                  ),
                ),
                // if (controller.signature == null ||
                //     controller.signature?.verifiedAt == null)
                if (controller.signature == null)
                  Padding(
                    padding: EdgeInsets.all(KSizes.hGapMedium),
                    child: CustomButton(
                      // name: controller.signature == null
                      //     ? "Submit"
                      //     : controller.signature != null &&
                      //             controller.signature?.verifiedAt == null
                      //         ? "Update"
                      //         : "",
                      name: appLang.submit,
                      onTap: () async {
                        // controller.signature == null
                        //     ? controller.saveSignature()
                        //     : controller.signature != null &&
                        //             controller.signature?.verifiedAt == null
                        //         ? controller.updateSignature()
                        //         : null;
                        controller.saveSignature();
                      },
                    ),
                  ),
              ],
            ),
          ),
          if (controller.isLoading.value) const CustomLoading()
        ],
      ),
    );
  }
}
