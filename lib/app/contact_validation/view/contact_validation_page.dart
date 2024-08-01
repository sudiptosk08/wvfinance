import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loan_app/app/contact_validation/controller/contact_validation_controller.dart';
import 'package:loan_app/app/widgets/custom_loading/custom_loading.dart';
import 'package:loan_app/utils/buttons/custom_button.dart';
import 'package:loan_app/utils/color/kcolors.dart';
import 'package:loan_app/utils/lang/app_lang.dart';
import 'package:loan_app/utils/sizes/k_sizes.dart';
import 'package:loan_app/utils/text_field_container/text_field_container.dart';
import 'package:loan_app/utils/text_utils/k_text_styles.dart';

class ContactValidationPage extends GetView<ContactValidationController> {
  const ContactValidationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Stack(
        children: [
          Scaffold(
            backgroundColor: KColors.white,
            appBar: AppBar(
              title: Text(appLang.phoneNumberValidation),
            ),
            body: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Container(
                    width: double.maxFinite,
                    color: KColors.white,
                    padding: EdgeInsets.all(KSizes.hGapMedium),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 4,
                              child: Text(
                                appLang.userNumber,
                                style: KTextStyles.textFieldLabel,
                              ),
                            ),
                            SizedBox(
                              width: KSizes.hGapSmall,
                            ),
                            Expanded(
                              flex: 7,
                              child: TextFieldContainer(
                                rtl: true,
                                height: 40.h,
                                keyboardType: TextInputType.number,
                                readOnly: true,
                                hint: appLang.writeYourContactNumber,
                                controller: controller.userNumController,
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
                              flex: 4,
                              child: Text(
                                appLang.guardiantNumber,
                                style: KTextStyles.textFieldLabel,
                              ),
                            ),
                            SizedBox(
                              width: KSizes.hGapSmall,
                            ),
                            Expanded(
                              flex: 7,
                              child: TextFieldContainer(
                                rtl: true,
                                height: 40.h,
                                readOnly: controller.phoneNumber != null,
                                keyboardType: TextInputType.number,
                                hint: appLang.writeGurdianContactNumber,
                                controller: controller.guardianNumController,
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
                              flex: 4,
                              child: Text(
                                appLang.friendNumber,
                                style: KTextStyles.textFieldLabel,
                              ),
                            ),
                            SizedBox(
                              width: KSizes.hGapSmall,
                            ),
                            Expanded(
                              flex: 7,
                              child: TextFieldContainer(
                                rtl: true,
                                height: 40.h,
                                readOnly: controller.phoneNumber != null,
                                keyboardType: TextInputType.number,
                                hint: appLang.writeYourFriendsContactNumber,
                                controller: controller.friendNumController,
                              ),
                            ),
                          ],
                        ),
                        const Divider(
                          color: KColors.borderColor,
                        ),
                      ],
                    ),
                  ),
                  // if (controller.phoneNumber == null ||
                  //     controller.phoneNumber?.verifiedAt == null)
                  if (controller.phoneNumber == null)
                    Padding(
                      padding: EdgeInsets.all(KSizes.hGapMedium),
                      child: CustomButton(
                        onTap: () {
                          // controller.phoneNumber == null
                          //     ? controller.saveContactInfo()
                          //     : controller.phoneNumber != null &&
                          //             controller.phoneNumber?.verifiedAt ==
                          //                 null
                          //         ? controller.updateContactInfo()
                          //         : null;
                          controller.saveContactInfo();
                        },
                        // name: controller.phoneNumber == null
                        //     ? "Submit"
                        //     : controller.phoneNumber != null &&
                        //             controller.phoneNumber?.verifiedAt == null
                        //         ? "Update"
                        //         : "",

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
