import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loan_app/app/loan_choice/controller/loan_choice_controller.dart';
import 'package:loan_app/app/widgets/custom_loading/custom_loading.dart';
import 'package:loan_app/app/widgets/custom_row_widget.dart';
import 'package:loan_app/local_storage/local_storage.dart';
import 'package:loan_app/routes/routes.dart';
import 'package:loan_app/utils/color/kcolors.dart';
import 'package:loan_app/utils/lang/app_lang.dart';
import 'package:loan_app/utils/sizes/k_sizes.dart';
import 'package:loan_app/utils/text_utils/text_utils.dart';

class ProfilePage extends GetView<LoanChoiceController> {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Stack(
        children: [
          Scaffold(
            appBar: AppBar(
              toolbarHeight: 8.h,
            ),
            body: ListView(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: KSizes.hGapMedium,
                      ),
                      color: KColors.primary,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: KSizes.vGapExtraLarge,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    radius: 24.r,
                                    child: CircleAvatar(
                                      backgroundColor: KColors.secondary,
                                      radius: 22.r,
                                      backgroundImage: NetworkImage(controller.dashBoardData?.user.image ?? ""),
                                    ),
                                  ),
                                  SizedBox(
                                    width: KSizes.hGapMedium,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        " ${controller.dashBoardData?.user.phoneCode ?? ""} ${controller.dashBoardData?.user.phone ?? ""}",
                                        style: TextStyle(
                                          color: KColors.white,
                                          fontSize: KFontSize.medium,
                                          fontWeight: KFontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "UID: ${controller.dashBoardData?.user.userId ?? ""}",
                                        style: TextStyle(
                                          color: KColors.greyText,
                                          fontSize: KFontSize.small,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              IconButton(
                                onPressed: () {
                                  Get.toNamed(Routes.settingPage);
                                },
                                icon: Icon(
                                  Icons.arrow_forward_ios_outlined,
                                  color: KColors.white,
                                  size: 18.sp,
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: KSizes.vGapLarge,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${appLang.loaned} (${appLang.bdt})",
                                style: TextStyle(
                                  color: KColors.white,
                                  fontSize: KFontSize.medium,
                                ),
                              ),
                              SizedBox(
                                height: KSizes.vGapSmall,
                              ),
                              Text(
                                '${appLang.bdt} ${controller.dashBoardData?.user.loanBalance ?? ""}',
                                style: TextStyle(
                                  color: KColors.white,
                                  fontSize: 22.sp,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 60.h,
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 150.h,
                      child: Container(
                        width: KSizes.kScreenWidth - KSizes.hGapLarge * 2,
                        margin: EdgeInsets.symmetric(
                          horizontal: KSizes.hGapLarge,
                        ),
                        padding: EdgeInsets.all(KSizes.hGapLarge),
                        decoration: BoxDecoration(
                          color: KColors.white,
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.account_balance_wallet_outlined,
                                      color: KColors.primary,
                                      size: 18.sp,
                                    ),
                                    SizedBox(
                                      width: KSizes.vGapSmall,
                                    ),
                                    Text(
                                      appLang.walletBalance,
                                      style: TextStyle(
                                        color: KColors.primary,
                                        fontSize: KFontSize.medium,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: KSizes.vGapMedium,
                                ),
                                Text(
                                  "${appLang.bdt} ${controller.dashBoardData?.user.balance ?? ""}",
                                  style: TextStyle(
                                    color: KColors.primary,
                                    fontSize: 22.sp,
                                  ),
                                ),
                              ],
                            ),
                            IconButton(
                              onPressed: () {
                                controller.selectedIndex.value = 1;
                              },
                              icon: Icon(
                                Icons.arrow_forward_ios_outlined,
                                size: 18.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: KSizes.vGapLarge * 4,
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: KSizes.hGapLarge,
                  ),
                  padding: EdgeInsets.all(KSizes.hGapLarge),
                  decoration: BoxDecoration(
                    color: KColors.white,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Column(
                    children: [
                      CustomRowWidget(
                        iconData: Icons.person_2_outlined,
                        title: appLang.verifyPersonalInformation,
                        ontap: () {
                          Get.toNamed(
                            Routes.personalInfoPage,
                          );
                        },
                      ),
                      const Divider(),
                      // CustomRowWidget(
                      //   iconData: Icons.attach_money_outlined,
                      //   title: "My Debt",
                      //   ontap: () {
                      //     Get.toNamed(Routes.debtRecordsPage);
                      //   },
                      // ),
                      // const Divider(),
                      CustomRowWidget(
                        iconData: Icons.credit_card_outlined,
                        title: appLang.loanDetails,
                        ontap: () {
                          Get.toNamed(Routes.loanRecordsPage);
                        },
                      ),
                      const Divider(),
                      CustomRowWidget(
                        iconData: Icons.support_agent_outlined,
                        title: appLang.customerService,
                        ontap: () {
                          controller.selectedIndex.value = 2;
                        },
                      ),
                      const Divider(),
                      CustomRowWidget(
                        iconData: Icons.help_outline_outlined,
                        title: appLang.commonProblems,
                        ontap: () {
                          Get.toNamed(Routes.commonProblemsPage);
                        },
                      ),
                      const Divider(),
                      CustomRowWidget(
                        iconData: Icons.logout_outlined,
                        title: appLang.logOut,
                        ontap: () async {
                          await LocalStorage.logout();
                          Get.offAllNamed(Routes.registrationPage);
                        },
                      ),
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
