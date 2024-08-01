import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loan_app/app/loan_choice/controller/loan_choice_controller.dart';
import 'package:loan_app/utils/assets/images.dart';
import 'package:loan_app/utils/color/kcolors.dart';
import 'package:loan_app/utils/lang/app_lang.dart';
import 'package:loan_app/utils/sizes/k_sizes.dart';
import 'package:loan_app/utils/text_utils/k_text_styles.dart';
import 'package:loan_app/utils/text_utils/text_utils.dart';

class HelpPage extends GetView<LoanChoiceController> {
  const HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          appLang.customerCare,
          style: TextStyle(
            fontSize: KFontSize.extraLarge,
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(
              height: KSizes.kScreenHeight * 0.2,
            ),
            Stack(
              fit: StackFit.passthrough,
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: double.infinity,
                  height: 200.h,
                  margin: EdgeInsets.symmetric(horizontal: KSizes.hGapMedium),
                  decoration: BoxDecoration(
                    color: KColors.white,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 65.h,
                      ),
                      Text(
                        appLang.the24HoursOnline,
                        style: TextStyle(
                          fontSize: KFontSize.large,
                          color: KColors.black,
                          fontWeight: KFontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: KSizes.vGapLarge,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: KSizes.hGapExtraLarge * 2.5,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  controller.launchExternalApp(
                                      controller.whatsapp.value);
                                },
                                child: Container(
                                  height: 80.h,
                                  decoration: BoxDecoration(
                                    color: KColors.background,
                                    borderRadius: BorderRadius.circular(10.r),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        KImages.whatsapp,
                                        width: 30.w,
                                      ),
                                      SizedBox(
                                        height: KSizes.vGapSmall,
                                      ),
                                      Text(
                                        'Whatsapp',
                                        style: TextStyle(
                                          fontSize: KFontSize.medium,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: KSizes.hGapLarge,
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  controller.launchExternalApp(
                                      controller.telegram.value);
                                },
                                child: Container(
                                  height: 80.h,
                                  decoration: BoxDecoration(
                                    color: KColors.background,
                                    borderRadius: BorderRadius.circular(
                                      10.r,
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        KImages.telegram,
                                        width: 30.w,
                                      ),
                                      SizedBox(
                                        height: KSizes.vGapSmall,
                                      ),
                                      Text(
                                        'Telegram',
                                        style: TextStyle(
                                          fontSize: KFontSize.medium,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  top: -85,
                  child: SizedBox(
                    width: 150.w,
                    height: 150.w,
                    child: Image.asset(
                      KImages.customerCare,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
