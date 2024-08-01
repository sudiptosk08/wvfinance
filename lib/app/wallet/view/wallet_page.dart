import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loan_app/app/loan_choice/controller/loan_choice_controller.dart';
import 'package:loan_app/app/widgets/custom_loading/custom_loading.dart';
import 'package:loan_app/routes/routes.dart';
import 'package:loan_app/utils/assets/images.dart';
import 'package:loan_app/utils/color/kcolors.dart';
import 'package:loan_app/utils/lang/app_lang.dart';
import 'package:loan_app/utils/sizes/k_sizes.dart';
import 'package:loan_app/utils/text_utils/text_utils.dart';

class WalletPage extends GetView<LoanChoiceController> {
  const WalletPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Stack(
          children: [
            Scaffold(
              appBar: AppBar(
                title: Text(
                  appLang.myWallet,
                  style: TextStyle(
                    fontSize: KFontSize.extraLarge,
                  ),
                ),
              ),
              body: RefreshIndicator(
                onRefresh: () {
                  return controller.initFunc();
                },
                child: ListView(
                  controller: controller.scrollController,
                  children: [
                    SizedBox(
                      height: KSizes.vGapLarge,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.shield_moon_outlined,
                          color: KColors.primary,
                        ),
                        SizedBox(
                          width: KSizes.hGapSmall,
                        ),
                        Text(
                          appLang.theBankProvidesSecurityForYourAccount,
                          style: TextStyle(
                            fontSize: KFontSize.small,
                            color: KColors.primary,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: KSizes.vGapLarge,
                    ),
                    Container(
                      // height: 180.h,
                      margin: EdgeInsets.symmetric(
                        horizontal: KSizes.hGapMedium,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        image: DecorationImage(
                            image: AssetImage(
                              KImages.cardBG,
                            ),
                            colorFilter: const ColorFilter.mode(KColors.primary, BlendMode.color),
                            filterQuality: FilterQuality.low,
                            fit: BoxFit.cover),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(KSizes.hGapExtraLarge),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              KImages.cardChip,
                              width: 25.w,
                            ),
                            SizedBox(
                              height: KSizes.vGapExtraLarge,
                            ),
                            Text(
                              "****  ****  ****  ${controller.dashBoardData?.user.cardNumber}",
                              style: TextStyle(
                                fontSize: KFontSize.extraLarge,
                                color: KColors.white,
                                fontWeight: KFontWeight.bold,
                                fontFamily: GoogleFonts.ptSerif().fontFamily,
                              ),
                            ),
                            SizedBox(
                              height: KSizes.vGapExtraLarge * 1.5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Validity",
                                      style: TextStyle(
                                        fontSize: KFontSize.medium,
                                        color: KColors.grey,
                                      ),
                                    ),
                                    Text(
                                      "${controller.dashBoardData?.user.cardExpiryDate}",
                                      style: TextStyle(
                                        fontSize: KFontSize.extraLarge,
                                        color: KColors.white,
                                        fontWeight: KFontWeight.medium,
                                        fontFamily: GoogleFonts.ptSerif().fontFamily,
                                      ),
                                    ),
                                  ],
                                ),
                                Image.asset(
                                  KImages.mastercardLogo,
                                  width: 40.w,
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: KSizes.vGapLarge,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: KSizes.hGapMedium),
                      decoration: BoxDecoration(
                        color: KColors.white,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(KSizes.hGapLarge),
                            decoration: BoxDecoration(
                              color: KColors.primary,
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${appLang.balance} (${appLang.bdt})",
                                      style: TextStyle(
                                        fontSize: KFontSize.large,
                                        color: KColors.white,
                                        fontWeight: KFontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: KSizes.vGapMedium,
                                    ),
                                    Text(
                                      "${controller.dashBoardData?.user.balance ?? 0}",
                                      style: TextStyle(
                                        fontSize: KFontSize.extraLarge,
                                        color: KColors.white,
                                        fontWeight: KFontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      "${appLang.loan} (${appLang.bdt})",
                                      style: TextStyle(
                                        fontSize: KFontSize.large,
                                        color: KColors.white,
                                        fontWeight: KFontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: KSizes.vGapMedium,
                                    ),
                                    Text(
                                      "${controller.dashBoardData?.user.loanBalance ?? 0}",
                                      style: TextStyle(
                                        fontSize: KFontSize.extraLarge,
                                        color: KColors.white,
                                        fontWeight: KFontWeight.bold,
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Get.toNamed(Routes.rechargePage)!.then((value) => controller.initFunc());
                                },
                                child: Text(
                                  appLang.recharge,
                                  style: const TextStyle(
                                    fontWeight: KFontWeight.bold,
                                    color: KColors.black,
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Get.toNamed(Routes.withdrawPage)!.then((value) => controller.initFunc());
                                },
                                child: Text(
                                  appLang.withdraw,
                                  style: const TextStyle(
                                    fontWeight: KFontWeight.bold,
                                    color: KColors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: KSizes.vGapMedium,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: KSizes.vGapMedium,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: KSizes.hGapMedium),
                      child: TextButton(
                        onPressed: () {
                          if (controller.dashBoardData!.agreement == null) {
                            return;
                          }else{
                            Get.toNamed(Routes.webViewPage)!
                                .then((value) => controller.initFunc());
                          }
                          
                          // KWidgets.defaultDialog(
                          //     context: context,
                          //     child: SizedBox(
                          //       width: double.infinity,
                          //       height: KSizes.kScreenHeight * .85,
                          //       child: WebViewWidget(
                          //           controller: controller.webView()),
                          //     ));
                        },
                        child: Text(
                          appLang.clickToReviewTheLoanAgreement,
                          style: const TextStyle(
                            // fontWeight: KFontWeight.bold,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: KSizes.vGapMedium,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: KSizes.hGapMedium),
                      padding: EdgeInsets.all(
                        KSizes.hGapLarge,
                      ),
                      decoration: BoxDecoration(
                        color: KColors.white,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Text(
                        appLang.details,
                        style: TextStyle(
                          fontSize: KFontSize.large,
                          fontWeight: KFontWeight.bold,
                        ),
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.withdrawRecord.length + 1,
                      itemBuilder: (context, index) {
                        if (index < controller.withdrawRecord.length) {
                          return card(
                            controller.withdrawRecord[index].amount.toString(),
                            controller.withdrawRecord[index].createdAt.toString(),
                            controller.withdrawRecord[index].amount.toString(),
                            controller.withdrawRecord[index].status,
                            controller.withdrawRecord[index].notes,
                          );
                        } else {
                          if (controller.nextUrl.isNotEmpty) {
                            return Center(
                              child: Padding(
                                padding: EdgeInsets.all(KSizes.hGapMedium),
                                child: const CircularProgressIndicator(),
                              ),
                            );
                          }
                        }
                        return null;
                      },
                    )
                    // ...List.generate(
                    //   controller.withdrawRecord.length,
                    //   (index) => card(
                    //     controller.withdrawRecord[index].amount.toString(),
                    //     controller.withdrawRecord[index].createdAt.toString(),
                    //     controller.withdrawRecord[index].amount.toString(),
                    //     controller.withdrawRecord[index].status,
                    //     controller.withdrawRecord[index].notes,
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
            if (controller.isLoading.value) const CustomLoading()
          ],
        ));
  }

  Widget card(
    String title,
    String time,
    String amount,
    String status,
    String? notes,
  ) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: KSizes.hGapLarge,
        vertical: KSizes.vGapMedium,
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: KColors.grey.withOpacity(0.3),
          ),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${appLang.bdt} $title",
                style: TextStyle(
                  fontFamily: KFontFamily.poppins,
                  fontSize: KFontSize.large,
                  fontWeight: KFontWeight.bold,
                ),
              ),
              Text(
                "$status  ",
                style: TextStyle(
                  fontFamily: KFontFamily.poppins,
                  fontSize: KFontSize.medium,
                  fontWeight: KFontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            time,
            style: TextStyle(
              fontFamily: KFontFamily.poppins,
              fontSize: KFontSize.small,
              fontWeight: KFontWeight.normal,
            ),
          ),
          if (notes != null)
            Padding(
              padding: EdgeInsets.only(top: KSizes.vGapSmall),
              child: Text(
                notes,
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontFamily: KFontFamily.poppins,
                  fontSize: KFontSize.small,
                  fontWeight: KFontWeight.normal,
                  color: KColors.red,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
