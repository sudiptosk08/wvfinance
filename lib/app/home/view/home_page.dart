import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loan_app/app/home/component/card.dart';
import 'package:loan_app/app/loan_choice/controller/loan_choice_controller.dart';
import 'package:loan_app/app/widgets/custom_loading/custom_loading.dart';
import 'package:loan_app/utils/color/kcolors.dart';
import 'package:loan_app/utils/lang/app_lang.dart';
import 'package:loan_app/utils/sizes/k_sizes.dart';
import 'package:loan_app/utils/text_utils/text_utils.dart';

class HomePage extends GetView<LoanChoiceController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Stack(
          children: [
            Scaffold(
              backgroundColor: KColors.background,
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(55.h),
                child: AppBar(
                  title: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        // Image.asset(
                        //   "asset/loan_logo.png",
                        //   width: 140.w,
                        //   height: 36.h,
                        //   fit: BoxFit.fitWidth,
                        //   color: KColors.white,
                        // ),
                        const Text(
                          "WORLD VISION BD",
                          style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                              color: KColors.white),
                        ),
                        Text(
                          "Loan Made Easy",
                          style: TextStyle(fontSize: KFontSize.small),
                        ),
                      ]),
                ),
              ),
              body: SafeArea(
                child: RefreshIndicator(
                  onRefresh: () {
                    return controller.initFunc();
                  },
                  child: ListView(
                    children: [
                      SizedBox(
                        height: KSizes.vGapMedium,
                      ),
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: KSizes.hGapMedium),
                        decoration: BoxDecoration(
                          color: KColors.white,
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: KSizes.hGapMedium,
                                vertical: KSizes.hGapExtraLarge * 1.0,
                              ),
                              // height: 160.h,
                              decoration: BoxDecoration(
                                color: KColors.primary,
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${appLang.maximumBorrowableAmount} (${appLang.bdt})",
                                    style: TextStyle(
                                      color: KColors.navbarGrey,
                                      fontSize: KFontSize.medium,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Text(
                                    "${appLang.bdt}  ${controller.dashBoardData?.loan.amounts.last ?? '----'}",
                                    style: const TextStyle(
                                      color: KColors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30.h,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              const Icon(
                                                Icons.check_circle,
                                                color: KColors.navbarGrey,
                                                size: 18,
                                              ),
                                              Text(
                                                appLang.interest,
                                                style: TextStyle(
                                                  color: KColors.navbarGrey,
                                                  fontSize: KFontSize.large,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            "${controller.dashBoardData?.loan.interestRate ?? '--'} %",
                                            style: TextStyle(
                                                color: KColors.navbarGrey,
                                                fontSize: KFontSize.large,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              const Icon(
                                                Icons.check_circle,
                                                color: KColors.navbarGrey,
                                                size: 18,
                                              ),
                                              Text(
                                                appLang.cycle,
                                                style: TextStyle(
                                                  color: KColors.navbarGrey,
                                                  fontSize: KFontSize.large,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            "${controller.dashBoardData?.loan.installments.last ?? '--'} MONTH",
                                            style: TextStyle(
                                                color: KColors.navbarGrey,
                                                fontSize: KFontSize.large,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              const Icon(
                                                Icons.check_circle,
                                                color: KColors.navbarGrey,
                                                size: 18,
                                              ),
                                              Text(
                                                appLang.interestType,
                                                style: TextStyle(
                                                  color: KColors.navbarGrey,
                                                  fontSize: KFontSize.large,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            appLang.lowInterest,
                                            style: TextStyle(
                                                color: KColors.navbarGrey,
                                                fontSize: KFontSize.large,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            // SizedBox(
                            //   height: KSizes.vGapExtraLarge * 2,
                            // ),
                            // KButton(
                            //   height: 50.h,
                            //   color: KColors.secondary,
                            //   title: "Apply For Loan",
                            //   onPressedCallback: () {
                            //      Get.toNamed(Routes.loanChoicePage);
                            //   },
                            // ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: KSizes.vGapLarge,
                      ),
                      Padding(
                        padding: EdgeInsets.all(KSizes.hGapMedium),
                        child: Row(
                          children: [
                            Expanded(
                              child: HomeCard(
                                icon: Icons.attach_money_outlined,
                                boolIcon: false,
                                title: appLang.request,
                                subTitle: appLang.forALoan,
                                bold: true,
                                onTap: () {
                                  controller.requestLoanRoute();
                                },
                              ),
                            ),
                            SizedBox(
                              width: KSizes.hGapLarge,
                            ),
                            Expanded(
                                child: HomeCard(
                              boolIcon: true,
                              bold: true,
                              icon: Icons.wallet_outlined,
                              title: appLang.visit,
                              subTitle: appLang.yourWallet,
                              onTap: () {
                                controller.selectedIndex.value = 1;
                              },
                            )),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: KSizes.hGapMedium),
                        child: Row(
                          children: [
                            Expanded(
                                child: HomeCard(
                              boolIcon: true,
                              icon: Icons.call_outlined,
                              bold: true,
                              title: appLang.contact,
                              subTitle: appLang.forAnyKindOfInformation,
                              onTap: () {
                                controller.selectedIndex.value = 2;
                              },
                            )),
                            SizedBox(
                              width: KSizes.hGapLarge,
                            ),
                            Expanded(
                                child: HomeCard(
                              bold: true,
                              boolIcon: true,
                              icon: Icons.favorite_border_outlined,
                              title: appLang.profile,
                              subTitle: appLang.seeYourInformation,
                              onTap: () {
                                controller.selectedIndex.value = 3;
                              },
                            )),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            if (controller.isLoading.value) const CustomLoading(),
          ],
        ));
  }
}
