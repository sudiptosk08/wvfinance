import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loan_app/app/id_card_verification/controller/id_card_verification_controller.dart';
import 'package:loan_app/app/widgets/custom_loading/custom_loading.dart';
import 'package:loan_app/app/widgets/image_container.dart';
import 'package:loan_app/utils/assets/images.dart';

import 'package:loan_app/utils/buttons/custom_button.dart';
import 'package:loan_app/utils/color/kcolors.dart';
import 'package:loan_app/utils/lang/app_lang.dart';
import 'package:loan_app/utils/sizes/k_sizes.dart';
import 'package:loan_app/utils/text_field_container/text_field_container.dart';
import 'package:loan_app/utils/text_utils/k_text_styles.dart';
import 'package:loan_app/utils/text_utils/text_utils.dart';

class IDCardVerificationPage extends GetView<IdCardVerificationController> {
  const IDCardVerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Stack(
        children: [
          Scaffold(
            appBar: AppBar(
              title: Text(appLang.idCardValidation),
            ),
            body: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Container(
                    color: KColors.white,
                    padding: EdgeInsets.all(KSizes.hGapMedium),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 3,
                              child: Text(
                                appLang.name,
                                style: KTextStyles.textFieldLabel,
                              ),
                            ),
                            Expanded(
                              flex: 7,
                              child: TextFieldContainer(
                                height: 40.h,
                                readOnly: controller.nidCard != null,
                                hint: appLang.writeYourName,
                                controller: controller.nameController,
                                keyboardType: TextInputType.name,
                              ),
                            ),
                          ],
                        ),
                        const Divider(
                          color: KColors.borderColor,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 3,
                              child: Text(
                                appLang.idNumber,
                                style: KTextStyles.textFieldLabel,
                              ),
                            ),
                            Expanded(
                              flex: 7,
                              child: TextFieldContainer(
                                height: 40.h,
                                keyboardType: TextInputType.number,
                                readOnly: controller.nidCard != null,
                                hint: appLang.writeYourValidIdNumber,
                                controller: controller.idNumberController,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Obx(
                    () => Container(
                      width: double.maxFinite,
                      color: KColors.white,
                      padding: const EdgeInsets.all(12),
                      margin: const EdgeInsets.only(top: 10),
                      child: Column(
                        children: [
                          ImageContainerWidget(
                            controller: controller,
                            image: controller.idFront.value,
                            defaultImage: KImages.idFront,
                            imageFor: "idFront",
                            removeImage: () {
                              controller.idFront.value = "";
                            },
                            // isPendding:
                            //     controller.nidCard?.verifiedAt == null &&
                            //             controller.nidCard != null
                            //         ? true
                            //         : false,
                            // isCompleted: controller.nidCard?.verifiedAt != null
                            //     ? true
                            //     : false,
                            isCompleted: controller.nidCard != null ? true : false,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              appLang.uploadTheFrontSidePhotoOfYourIdCard,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: KFontFamily.poppins,
                                fontSize: KFontSize.medium,
                              ),
                            ),
                          ),
                          ImageContainerWidget(
                            controller: controller,
                            image: controller.idBack.value,
                            defaultImage: KImages.idBack,
                            imageFor: "idBack",
                            removeImage: () {
                              controller.idBack.value = "";
                            },
                            // isPendding:
                            //     controller.nidCard?.verifiedAt == null &&
                            //             controller.nidCard != null
                            //         ? true
                            //         : false,
                            isCompleted: controller.nidCard != null ? true : false,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              appLang.uploadTheBackSidePhotoOfYourIdCard,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: KFontFamily.poppins,
                                fontSize: KFontSize.medium,
                              ),
                            ),
                          ),
                          ImageContainerWidget(
                            controller: controller,
                            image: controller.selfie.value,
                            defaultImage: KImages.defaultImage,
                            imageFor: "selfie",
                            removeImage: () {
                              controller.selfie.value = "";
                            },
                            // isPendding:
                            //     controller.nidCard?.verifiedAt == null &&
                            //             controller.nidCard != null
                            //         ? true
                            //         : false,
                            // isCompleted: controller.nidCard?.verifiedAt != null
                            //     ? true
                            //     : false,
                            isCompleted: controller.nidCard != null ? true : false,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              appLang.uploadSelfieToEnsureYourIdentification,
                              textAlign: TextAlign.center,
                              style: TextStyle(fontFamily: KFontFamily.poppins, fontSize: KFontSize.medium),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // if (controller.nidCard == null ||
                  //     controller.nidCard?.verifiedAt == null)
                  if (controller.nidCard == null)
                    Padding(
                      padding: EdgeInsets.all(KSizes.hGapMedium),
                      child: CustomButton(
                        onTap: () {
                          // controller.nidCard == null
                          //     ? controller.saveIDCard()
                          //     : controller.nidCard != null &&
                          //             controller.nidCard?.verifiedAt == null
                          //         ? controller.updateIDCard()
                          //         : null;
                          controller.saveIDCard();
                        },
                        // name: controller.nidCard?.verifiedAt != null
                        //     ? "Submit"
                        //     : "Update",
                        name: appLang.submit,
                      ),
                    ),
                ],
              ),
            ),
          ),
          if (controller.isLoading.value) const CustomLoading()
        ],
      ),
    );
  }
}
