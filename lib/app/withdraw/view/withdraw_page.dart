import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loan_app/app/widgets/custom_loading/custom_loading.dart';
import 'package:loan_app/app/widgets/custom_text_field.dart';
import 'package:loan_app/app/withdraw/controller/withdraw_controller.dart';
import 'package:loan_app/utils/buttons/custom_button.dart';
import 'package:loan_app/utils/color/kcolors.dart';
import 'package:loan_app/utils/lang/app_lang.dart';
import 'package:loan_app/utils/sizes/k_sizes.dart';
import 'package:loan_app/utils/text_utils/text_utils.dart';

class WithdrawPage extends GetView<WithdrawController> {
  const WithdrawPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Stack(
        children: [
          Scaffold(
            appBar: AppBar(
              title: Text(
                appLang.withdrawMoney,
                style: TextStyle(
                  fontSize: KFontSize.extraLarge,
                ),
              ),
            ),
            body: ListView(
              children: [
                SizedBox(
                  height: KSizes.vGapLarge,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: KSizes.hGapMedium),
                  padding: EdgeInsets.symmetric(horizontal: KSizes.hGapMedium),
                  height: 50.h,
                  decoration: BoxDecoration(
                    color: KColors.gray,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 40.w,
                        child: Text(
                          appLang.bdt,
                          style: TextStyle(
                            fontSize: KFontSize.extraLarge,
                            color: KColors.gray223,
                            fontWeight: KFontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: KSizes.hGapMedium,
                      ),
                      Expanded(
                        child: CustomTextField(
                          controller: controller.withdrawalAmountTextController,
                          hintText: appLang.enterWithdrawAmount,
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: KSizes.vGapLarge,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: KSizes.hGapMedium),
                  padding: EdgeInsets.symmetric(horizontal: KSizes.hGapMedium),
                  height: 50.h,
                  decoration: BoxDecoration(
                    color: KColors.gray,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 40.w,
                        child: Text(
                          "#",
                          style: TextStyle(
                            fontSize: KFontSize.extraLarge,
                            color: KColors.gray223,
                            fontWeight: KFontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: KSizes.hGapMedium,
                      ),
                      Expanded(
                        child: CustomTextField(
                          controller: controller.withdrawalCodeTextController,
                          hintText: appLang.enterWithdrawalCode,
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: KSizes.vGapMedium,
                ),
                Padding(
                  padding: EdgeInsets.all(KSizes.hGapMedium),
                  child: CustomButton(
                    name: appLang.submit,
                    onTap: () {
                      controller.withdraw();
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
