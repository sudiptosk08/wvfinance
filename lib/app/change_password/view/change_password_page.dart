import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loan_app/app/change_password/controller/change_password_controller.dart';
import 'package:loan_app/utils/buttons/custom_button.dart';
import 'package:loan_app/utils/color/kcolors.dart';
import 'package:loan_app/utils/lang/app_lang.dart';
import 'package:loan_app/utils/sizes/k_sizes.dart';
import 'package:loan_app/utils/text_field_container/text_field_container.dart';
import 'package:loan_app/utils/text_utils/k_text_styles.dart';

class ChangePasswordPage extends GetView<ChangePasswordController> {
  const ChangePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColors.white,
      appBar: AppBar(
        title: Text(appLang.changeAccountPassword),
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
                        flex: 3,
                        child: Text(
                          appLang.oldPassword,
                          style: KTextStyles.textFieldLabel,
                        ),
                      ),
                      SizedBox(
                        width: KSizes.hGapSmall,
                      ),
                      Expanded(
                        flex: 5,
                        child: TextFieldContainer(
                          rtl: true,
                          height: 40.h,
                          hint: appLang.enterYourOldPassword,
                          controller: controller.oldPasswordController,
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
                          appLang.newPassword,
                          style: KTextStyles.textFieldLabel,
                        ),
                      ),
                      SizedBox(
                        width: KSizes.hGapSmall,
                      ),
                      Expanded(
                        flex: 5,
                        child: TextFieldContainer(
                          rtl: true,
                          height: 40.h,
                          hint: appLang.enterNewPassword,
                          controller: controller.newPasswrodController,
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
                          appLang.confirmNewPassword,
                          style: KTextStyles.textFieldLabel,
                        ),
                      ),
                      SizedBox(
                        width: KSizes.hGapSmall,
                      ),
                      Expanded(
                        flex: 5,
                        child: TextFieldContainer(
                          rtl: true,
                          height: 40.h,
                          keyboardType: TextInputType.text,
                          hint: appLang.confirmNewPassword,
                          controller: controller.confirmPasswordController,
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
            Padding(
              padding: EdgeInsets.all(KSizes.hGapLarge),
              child: CustomButton(
                name: appLang.submit,
                onTap: () {
                  controller.changePassword();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
