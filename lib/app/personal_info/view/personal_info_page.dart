import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loan_app/app/personal_info/controller/personal_info_controller.dart';
import 'package:loan_app/app/widgets/custom_loading/custom_loading.dart';
import 'package:loan_app/routes/routes.dart';
import 'package:loan_app/utils/color/kcolors.dart';
import 'package:loan_app/utils/lang/app_lang.dart';
import 'package:loan_app/utils/text_utils/k_text_styles.dart';
import 'package:loan_app/utils/text_utils/text_utils.dart';

class PersonalInfoPage extends GetView<PersonalInfoController> {
  const PersonalInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Stack(
        children: [
          Scaffold(
            appBar: AppBar(
              title: Text(appLang.personalInfo),
              leading: IconButton(
                  onPressed: () {
                    Get.offAllNamed(Routes.navigationPage);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: KColors.white,
                  )),
              leadingWidth: 50,
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 85.h,
                  decoration: BoxDecoration(
                    color: KColors.primary,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(
                        Icons.error_outline,
                        color: KColors.white,
                        size: 35.sp,
                      ),
                      SizedBox(
                        width: 10.h,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              appLang.dataValidation,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: KFontSize.large,
                                fontWeight: FontWeight.bold,
                                color: KColors.white,
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              appLang
                                  .toReceiveOurInformationPleaseFillTheFollowingInformationTruthfully,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: KFontSize.medium,
                                color: KColors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          controller.goToIdCardVerificationPage();
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      appLang.idCardValidation,
                                      style:
                                          KTextStyles.textFieldLabel.copyWith(
                                        color: controller.nidCard != null
                                            ? KColors.green
                                            : KColors.black,
                                        fontSize: KFontSize.extraLarge,
                                        height: 1.2,
                                      ),
                                    ),
                                    controller.nidCard?.notes != null
                                        ? Text(
                                            controller.nidCard!.notes
                                                .toString(),
                                            maxLines: 2,
                                            style: TextStyle(
                                              fontSize: KFontSize.small,
                                              color: KColors.red,
                                            ),
                                          )
                                        : Container(),
                                  ],
                                ),
                              ),
                              // controller.nidCard != null &&
                              //         controller.nidCard!.verifiedAt != null
                              //     ? Container() :
                              Container(
                                padding: const EdgeInsets.only(
                                    left: 12, right: 12, top: 6, bottom: 6),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: controller.nidCard == null
                                      ? KColors.red
                                      : KColors.green,
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      // controller.nidCard == null &&
                                      //         controller.nidCard
                                      //                 ?.verifiedAt ==
                                      //             null
                                      //     ? "Submit"
                                      //     : "Pending",
                                      controller.nidCard == null
                                          ? appLang.submit
                                          : "${appLang.verified} ✓",
                                      style: TextStyle(
                                        color: KColors.white,
                                        fontSize: KFontSize.medium,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Divider(),
                      GestureDetector(
                        onTap: () {
                          controller.goToEligibilityValidationPage();
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      appLang.verificationOfEligibility,
                                      style:
                                          KTextStyles.textFieldLabel.copyWith(
                                        color: controller.eligibility != null
                                            ? KColors.green
                                            : KColors.black,
                                        fontSize: KFontSize.extraLarge,
                                        height: 1.2,
                                      ),
                                    ),
                                    // controller.eligibility?.notes != null
                                    //     ? Text(
                                    //         controller.eligibility!.notes
                                    //             .toString(),
                                    //         maxLines: 2,
                                    //         style: TextStyle(
                                    //             fontSize: KFontSize.small,
                                    //             color: KColors.red),
                                    //       )
                                    //     : Container(),
                                  ],
                                ),
                              ),
                              // controller.eligibility != null &&
                              //         controller.eligibility!.verifiedAt != null
                              //     ? Container()
                              //     :
                              Container(
                                padding: const EdgeInsets.only(
                                    left: 12, right: 12, top: 6, bottom: 6),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: controller.eligibility == null
                                      ? KColors.red
                                      : KColors.green,
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      // controller.eligibility == null &&
                                      //         controller.eligibility
                                      //                 ?.verifiedAt ==
                                      //             null
                                      //     ? "Submit"
                                      //     : "Pending",
                                      controller.eligibility == null
                                          ? appLang.submit
                                          : "${appLang.verified} ✓",
                                      style: TextStyle(
                                          color: KColors.white,
                                          fontSize: KFontSize.medium),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Divider(),
                      GestureDetector(
                        onTap: () {
                          controller.goToBankAccountValidationPage();
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      appLang.bankAccountVerification,
                                      style:
                                          KTextStyles.textFieldLabel.copyWith(
                                        color: controller.bankAccount != null
                                            ? KColors.green
                                            : KColors.black,
                                        fontSize: KFontSize.extraLarge,
                                        height: 1.2,
                                      ),
                                    ),
                                    // controller.bankAccount?.notes != null
                                    //     ? Text(
                                    //         controller.bankAccount!.notes
                                    //             .toString(),
                                    //         maxLines: 2,
                                    //         style: TextStyle(
                                    //             fontSize: KFontSize.small,
                                    //             color: KColors.red),
                                    //       )
                                    //     : Container(),
                                  ],
                                ),
                              ),
                              // controller.bankAccount != null &&
                              //         controller.bankAccount!.verifiedAt != null
                              //     ? Container():
                              Container(
                                padding: const EdgeInsets.only(
                                    left: 12, right: 12, top: 6, bottom: 6),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: controller.bankAccount == null
                                      ? KColors.red
                                      : KColors.green,
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      // controller.bankAccount == null &&
                                      //         controller.bankAccount
                                      //                 ?.verifiedAt ==
                                      //             null
                                      //     ? "Submit"
                                      //     : "Pending",
                                      controller.bankAccount == null
                                          ? appLang.submit
                                          : "${appLang.verified} ✓",
                                      style: TextStyle(
                                          color: KColors.white,
                                          fontSize: KFontSize.medium),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Divider(),
                      GestureDetector(
                        onTap: () {
                          controller.goToContactValidationPage();
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      appLang.phoneNumber,
                                      style:
                                          KTextStyles.textFieldLabel.copyWith(
                                        color: controller.phoneNumber != null
                                            ? KColors.green
                                            : KColors.black,
                                        fontSize: KFontSize.extraLarge,
                                        height: 1.2,
                                      ),
                                    ),
                                    // controller.phoneNumber?.notes != null
                                    //     ? Text(
                                    //         controller.phoneNumber!.notes
                                    //             .toString(),
                                    //         maxLines: 2,
                                    //         style: TextStyle(
                                    //             fontSize: KFontSize.small,
                                    //             color: KColors.red),
                                    //       )
                                    //     : Container(),
                                  ],
                                ),
                              ),
                              //  controller.phoneNumber != null &&
                              //         controller.phoneNumber!.verifiedAt != null
                              //     ? Container()
                              //     :
                              Container(
                                padding: const EdgeInsets.only(
                                    left: 12, right: 12, top: 6, bottom: 6),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: controller.phoneNumber == null
                                      ? KColors.red
                                      : KColors.green,
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      // controller.phoneNumber == null &&
                                      //         controller.phoneNumber
                                      //                 ?.verifiedAt ==
                                      //             null
                                      //     ? "Submit"
                                      //     : "Pending",
                                      controller.phoneNumber == null
                                          ? appLang.submit
                                          : "${appLang.verified} ✓",
                                      style: TextStyle(
                                          color: KColors.white,
                                          fontSize: KFontSize.medium),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Divider(),
                      GestureDetector(
                        onTap: () {
                          controller.goToSignatureValidationPage();
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      appLang.signature,
                                      style:
                                          KTextStyles.textFieldLabel.copyWith(
                                        color: controller.signature != null
                                            ? KColors.green
                                            : KColors.black,
                                        fontSize: KFontSize.extraLarge,
                                        height: 1.2,
                                      ),
                                    ),
                                    // controller.signature?.notes != null
                                    //     ? Text(
                                    //         controller.signature!.notes
                                    //             .toString(),
                                    //         maxLines: 2,
                                    //         style: TextStyle(
                                    //             fontSize: KFontSize.small,
                                    //             color: KColors.red),
                                    //       )
                                    //  : Container(),
                                  ],
                                ),
                              ),
                              //  controller.signature != null &&
                              //         controller.signature!.verifiedAt != null
                              //     ? Container()
                              //     :
                              Container(
                                padding: const EdgeInsets.only(
                                    left: 12, right: 12, top: 6, bottom: 6),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: controller.signature == null
                                      ? KColors.red
                                      : KColors.green,
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      // controller.signature == null &&
                                      //         controller.signature
                                      //                 ?.verifiedAt ==
                                      //             null
                                      //     ? "Submit"
                                      //     : "Pending",
                                      controller.signature == null
                                          ? appLang.submit
                                          : "${appLang.verified} ✓",
                                      style: TextStyle(
                                          color: KColors.white,
                                          fontSize: KFontSize.medium),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Divider(),
                    ],
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
