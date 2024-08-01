import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loan_app/app/loan_choice/controller/loan_choice_controller.dart';
import 'package:loan_app/routes/routes.dart';

import 'package:loan_app/utils/buttons/custom_button.dart';
import 'package:loan_app/utils/color/kcolors.dart';
import 'package:loan_app/utils/lang/app_lang.dart';
import 'package:loan_app/utils/sizes/k_sizes.dart';
import 'package:loan_app/utils/text_utils/text_utils.dart';

class LoanChoicePage extends GetView<LoanChoiceController> {
  const LoanChoicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: Text(appLang.loanChoice),
        ),
        body: ListView(
          padding: EdgeInsets.only(
            bottom: 70.h,
            top: KSizes.vGapSmall,
          ),
          children: [
            SizedBox(
              height: 10.h,
            ),
            Text(
              "${appLang.theHighestCanApplyBdt} ${controller.dashBoardData?.loan.amounts.last}",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: KFontSize.extraLarge,
                fontWeight: FontWeight.bold,
                color: KColors.primary,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: KSizes.hGapLarge,
                vertical: KSizes.vGapSmall,
              ),
              child: Text(
                appLang
                    .pleaseSelectTheLoanAmountAndInstallmentMonthPassTheReviceAndWithdrawWithin6HoursAtTheFastest,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: KFontSize.medium, color: KColors.gray223),
              ),
            ),
            SizedBox(
              height: KSizes.vGapSmall,
            ),
            Container(
              width: 335.w,
              margin: EdgeInsets.symmetric(horizontal: KSizes.hGapMedium),
              decoration: BoxDecoration(
                color: KColors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: KColors.primary,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8),
                      ),
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: KSizes.vGapLarge,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              appLang.interest,
                              style: TextStyle(
                                color: KColors.navbarGrey,
                                fontSize: KFontSize.medium,
                              ),
                            ),
                            Text(
                              "${controller.dashBoardData?.loan.interestRate}%",
                              style: TextStyle(
                                color: KColors.white,
                                fontSize: KFontSize.extraLarge,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              appLang.monthlyInstallment,
                              style: TextStyle(
                                color: KColors.navbarGrey,
                                fontSize: KFontSize.medium,
                              ),
                            ),
                            Text(
                              "${controller.installment.value} ${appLang.bdt}",
                              style: TextStyle(
                                color: KColors.white,
                                fontSize: KFontSize.extraLarge,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              appLang.totalRepayment,
                              style: TextStyle(
                                color: KColors.navbarGrey,
                                fontSize: KFontSize.medium,
                              ),
                            ),
                            Text(
                              "${controller.total.value.toString()} ${appLang.bdt}",
                              style: TextStyle(
                                color: KColors.white,
                                fontSize: KFontSize.extraLarge,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: KSizes.vGapMedium,
                  ),
                  Padding(
                    padding: EdgeInsets.all(KSizes.hGapSmall),
                    child: Text(
                      "✔ ${appLang.loanAmount}",
                      style: TextStyle(fontSize: KFontSize.large),
                    ),
                  ),
                  Container(
                    width: 335.w,
                    height: 135.h,
                    padding: EdgeInsets.only(left: KSizes.hGapSmall),
                    child: GridView.builder(
                        padding: EdgeInsets.symmetric(
                          vertical: KSizes.vGapMedium,
                        ),
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 105.w,
                          mainAxisExtent: 50.h,
                          mainAxisSpacing: KSizes.hGapMedium,
                          crossAxisSpacing: KSizes.hGapMedium,
                        ),
                        itemCount:
                            controller.dashBoardData!.loan.amounts.length,
                        itemBuilder: (context, index) {
                          int data =
                              controller.dashBoardData!.loan.amounts[index];
                          return Obx(() => InkWell(
                                onTap: () {
                                  controller.selectedAmount.value = data;
                                  controller.calculate();
                                },
                                child: Container(
                                  width: 95.w,
                                  height: 50.h,
                                  alignment: Alignment.center,
                                  margin: const EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                      color: controller.selectedAmount.value ==
                                              data
                                          ? KColors.primary
                                          : KColors.grey200,
                                      borderRadius: BorderRadius.circular(4)),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 5,
                                    ),
                                    child: Text(
                                      "${controller.dashBoardData!.loan.amounts[index].toString()} ",
                                      style: TextStyle(
                                        color:
                                            controller.selectedAmount.value ==
                                                    data
                                                ? KColors.white
                                                : KColors.black,
                                        fontSize: KFontSize.medium,
                                      ),
                                    ),
                                  ),
                                ),
                              ));
                        }),
                  ),
                  const Divider(
                    color: KColors.gray,
                    thickness: 1,
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Padding(
                    padding: EdgeInsets.all(KSizes.hGapSmall),
                    child: Text(
                      "✔ ${appLang.loanDuration}",
                      style: TextStyle(fontSize: KFontSize.large),
                    ),
                  ),
                  Container(
                    width: 335.w,
                    height: 135.h,
                    padding: EdgeInsets.only(left: KSizes.hGapSmall),
                    child: GridView.builder(
                        padding: EdgeInsets.symmetric(
                          vertical: KSizes.vGapMedium,
                        ),
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 105.w,
                          mainAxisExtent: 50.h,
                          mainAxisSpacing: KSizes.hGapMedium,
                          crossAxisSpacing: KSizes.hGapMedium,
                        ),
                        itemCount:
                            controller.dashBoardData!.loan.installments.length,
                        itemBuilder: (context, ind) {
                          int duration =
                              controller.dashBoardData!.loan.installments[ind];
                          return InkWell(
                            onTap: () {
                              controller.selectedDuration.value = duration;
                              controller.calculate();
                            },
                            child: Container(
                              alignment: Alignment.center,
                              margin: const EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                  color: controller.selectedDuration.value ==
                                          duration
                                      ? KColors.primary
                                      : KColors.grey200,
                                  borderRadius: BorderRadius.circular(4)),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 5,
                                ),
                                child: Text(
                                  "${controller.dashBoardData!.loan.installments[ind]} Months",
                                  style: TextStyle(
                                    color: controller.selectedDuration.value ==
                                            duration
                                        ? KColors.white
                                        : KColors.black,
                                    fontSize: KFontSize.medium,
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                  const SizedBox(
                    height: 5,
                  )
                ],
              ),
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Padding(
          padding: EdgeInsets.all(KSizes.hGapMedium),
          child: CustomButton(
            name: appLang.submit,
            onTap: () {
              if (controller.dashBoardData!.user.loanEligibled == 1) {
                controller.loanchoiceApply();
              } else {
                Get.toNamed(Routes.personalInfoPage);
              }
            },
          ),
        ),
      ),
    );
  }
}
