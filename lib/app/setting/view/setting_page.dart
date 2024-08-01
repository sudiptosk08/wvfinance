import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loan_app/app/setting/controller/setting_controller.dart';
import 'package:loan_app/app/widgets/custom_row_widget.dart';

import 'package:loan_app/routes/routes.dart';
import 'package:loan_app/utils/color/kcolors.dart';
import 'package:loan_app/utils/lang/app_lang.dart';
import 'package:loan_app/utils/sizes/k_sizes.dart';
import 'package:loan_app/utils/text_utils/text_utils.dart';

class SettingPage extends GetView<SettingController> {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: Text(
            appLang.settings,
            style: TextStyle(
              fontSize: KFontSize.extraLarge,
            ),
          ),
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(
            horizontal: KSizes.hGapMedium,
            vertical: KSizes.vGapMedium,
          ),
          children: [
            CustomRowWidget(
              title: appLang.changeAccountPassword,
              ontap: () {
                Get.toNamed(Routes.changePasswordPage);
              },
            ),
            CustomRowWidget(
              title: appLang.aboutUs,
              ontap: () {
                Get.toNamed(Routes.aboutUsPage);
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: KSizes.hGapMedium,
                    ),
                    Text(
                      // appLang.appLanguage
                      "App Language",
                      style: TextStyle(
                        fontSize: KFontSize.medium,
                        fontWeight: KFontWeight.bold,
                        color: KColors.primary,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            controller.isEn.value = true;
                            controller.changeAppLang();
                          },
                          icon: Icon(
                            !controller.isEn.value ? Icons.radio_button_off : Icons.radio_button_checked,
                            size: 18.sp,
                          ),
                        ),
                        Text(
                          'English',
                          style: TextStyle(
                            color: !controller.isEn.value ? KColors.black : KColors.primary,
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: () {
                        controller.isEn.value = false;
                        controller.changeAppLang();
                      },
                      icon: Icon(
                        controller.isEn.value ? Icons.radio_button_off : Icons.radio_button_checked,
                        size: 18.sp,
                      ),
                    ),
                    Text(
                      'বাংলা',
                      style: TextStyle(
                        color: controller.isEn.value ? KColors.black : KColors.primary,
                      ),
                    ),
                  ],
                )
              ],
            ),
            Obx(
              () => CustomRowWidget(
                title: appLang.appVersion,
                ontap: () {},
                prefixWidget: Padding(
                  padding: EdgeInsets.all(12.w),
                  child: Text(
                    controller.appVersion.value,
                    style: TextStyle(
                      fontSize: KFontSize.medium,
                      color: KColors.gray223,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
