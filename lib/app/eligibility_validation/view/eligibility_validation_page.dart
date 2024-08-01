import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loan_app/app/eligibility_validation/controller/eligibility_validation_controller.dart';

import 'package:loan_app/utils/buttons/custom_button.dart';
import 'package:loan_app/utils/color/kcolors.dart';
import 'package:loan_app/utils/lang/app_lang.dart';
import 'package:loan_app/utils/sizes/k_sizes.dart';
import 'package:loan_app/utils/text_field_container/text_field_container.dart';
import 'package:loan_app/utils/text_utils/k_text_styles.dart';
import 'package:loan_app/utils/text_utils/text_utils.dart';

class EligibilityValidationPage extends GetView<EligibilityValidationController> {
  const EligibilityValidationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          backgroundColor: KColors.white,
          appBar: AppBar(
            title: Text(appLang.eligibilityValidation),
          ),
          body: ListView(
            padding: EdgeInsets.symmetric(
              horizontal: KSizes.hGapMedium,
              vertical: KSizes.vGapLarge,
            ),
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
                      readOnly: controller.eligibility != null,
                      hint: appLang.writeYourName,
                      rtl: true,
                      controller: controller.nameController,
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
                      appLang.education,
                      style: KTextStyles.textFieldLabel,
                    ),
                  ),
                  Expanded(
                    flex: 7,
                    child: TextFieldContainer(
                      readOnly: controller.eligibility != null,
                      rtl: true,
                      hint: appLang.writeYourEducation,
                      controller: controller.educationController,
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
                      appLang.occupation,
                      style: KTextStyles.textFieldLabel,
                    ),
                  ),
                  Expanded(
                    flex: 7,
                    child: TextFieldContainer(
                      readOnly: controller.eligibility != null,
                      rtl: true,
                      hint: appLang.writeYourOccupation,
                      controller: controller.occupationController,
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
                      appLang.loanPurpose,
                      style: KTextStyles.textFieldLabel,
                    ),
                  ),
                  Expanded(
                    flex: 7,
                    child: TextFieldContainer(
                      readOnly: controller.eligibility != null,
                      rtl: true,
                      hint: appLang.writePurposeOfTheLoan,
                      controller: controller.loanPurposeController,
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
                      appLang.monthlyIncome,
                      style: KTextStyles.textFieldLabel,
                    ),
                  ),
                  Expanded(
                    flex: 7,
                    child: TextFieldContainer(
                      rtl: true,
                      keyboardType: TextInputType.number,
                      readOnly: controller.eligibility != null,
                      hint: appLang.writeYourMonthlyIncome,
                      controller: controller.monthlyIncomeController,
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
                      appLang.familyMember,
                      style: KTextStyles.textFieldLabel,
                    ),
                  ),
                  Expanded(
                    flex: 7,
                    child: TextFieldContainer(
                      readOnly: controller.eligibility != null,
                      rtl: true,
                      hint: appLang.familyMember,
                      controller: controller.familyMemberController,
                      keyboardType: TextInputType.number,
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
                      appLang.contact,
                      style: KTextStyles.textFieldLabel,
                    ),
                  ),
                  Expanded(
                    flex: 7,
                    child: TextFieldContainer(
                      rtl: true,
                      readOnly: controller.eligibility != null,
                      keyboardType: TextInputType.phone,
                      hint: appLang.writeYourContactNumber,
                      controller: controller.contactController,
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
                  Text(
                    "${appLang.doYouOwnACar} ? ",
                    style: KTextStyles.textFieldLabel,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Radio(
                            value: "1",
                            groupValue: controller.carSelection.value,
                            onChanged: (val) {
                              if (controller.eligibility != null) {
                                return;
                              }
                              controller.carSelection.value = val.toString();
                            },
                          ),
                          Text(
                            appLang.yes,
                            style: TextStyle(fontFamily: KFontFamily.poppins, fontSize: KFontSize.medium),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                            value: "0",
                            groupValue: controller.carSelection.value,
                            onChanged: (val) {
                              if (controller.eligibility != null) {
                                return;
                              }
                              controller.carSelection.value = val.toString();
                            },
                          ),
                          Text(
                            appLang.no,
                            style: TextStyle(fontFamily: KFontFamily.poppins, fontSize: KFontSize.medium),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 16.h,
                      ),
                    ],
                  )
                ],
              ),
              const Divider(
                color: KColors.borderColor,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${appLang.doYouOwnAHouse} ? ",
                    style: KTextStyles.textFieldLabel,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Radio(
                            value: "1",
                            groupValue: controller.houseSelection.value,
                            onChanged: (val) {
                              if (controller.eligibility != null) {
                                return;
                              }
                              controller.houseSelection.value = val.toString();
                            },
                          ),
                          Text(
                            appLang.yes,
                            style: TextStyle(fontFamily: KFontFamily.poppins, fontSize: KFontSize.medium),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                            value: "0",
                            groupValue: controller.houseSelection.value,
                            onChanged: (valu) {
                              if (controller.eligibility != null) {
                                return;
                              }
                              controller.houseSelection.value = valu.toString();
                            },
                          ),
                          Text(
                            appLang.no,
                            style: TextStyle(fontFamily: KFontFamily.poppins, fontSize: KFontSize.medium),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 16.h,
                      ),
                    ],
                  )
                ],
              ),
              const Divider(
                color: KColors.borderColor,
              ),
              // if (controller.eligibility == null ||
              //     controller.eligibility == null)
              if (controller.eligibility == null)
                Padding(
                  padding: EdgeInsets.all(KSizes.hGapMedium),
                  child: CustomButton(
                    onTap: () {
                      // controller.eligibility == null
                      //     ? controller.saveEligibility()
                      //     : controller.eligibility != null &&
                      //             controller.eligibility == null
                      //         ? controller.updateEligibility()
                      //         : null;
                      controller.saveEligibility();
                    },
                    // name: controller.eligibility == null
                    //     ? "Submit"
                    //     : controller.eligibility != null &&
                    //             controller.eligibility == null
                    //         ? "Update"
                    //         : "",
                    name: "Submit",
                  ),
                ),
            ],
          ),
        ));
  }
}
