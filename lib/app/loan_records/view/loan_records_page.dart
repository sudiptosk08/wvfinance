import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loan_app/app/loan_records/controller/loan_records_controller.dart';
import 'package:loan_app/app/loan_records/model/loan_records_history_model.dart';
import 'package:loan_app/app/widgets/custom_loading/custom_loading.dart';
import 'package:loan_app/routes/routes.dart';
import 'package:loan_app/utils/assets/images.dart';
import 'package:loan_app/utils/buttons/custom_button.dart';
import 'package:loan_app/utils/color/kcolors.dart';
import 'package:loan_app/utils/lang/app_lang.dart';
import 'package:loan_app/utils/sizes/k_sizes.dart';
import 'package:loan_app/utils/text_utils/text_utils.dart';

class LoanRecordsPage extends GetView<LoanRecordsController> {
  const LoanRecordsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          appBar: AppBar(
            title: Text(
              appLang.loanRecords,
              style: TextStyle(
                fontSize: KFontSize.extraLarge,
              ),
            ),
          ),
          body: controller.isLoading.value
              ? const CustomLoading()
              : controller.loanRecords.isEmpty
                  ? RefreshIndicator(
                      onRefresh: () {
                        return controller.getLoanRecords();
                      },
                      child: ListView(
                        padding: EdgeInsets.only(top: KSizes.kScreenHeight * 0.30),
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            KImages.loanCancel,
                            width: 64.w,
                            height: 64.w,
                          ),
                          SizedBox(
                            height: KSizes.vGapMedium,
                          ),
                          Center(
                            child: Text(
                              "You have not applied for loan yet",
                              style: TextStyle(
                                fontFamily: KFontFamily.poppins,
                                fontSize: KFontSize.medium,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : RefreshIndicator(
                      onRefresh: () {
                        return controller.getLoanRecords();
                      },
                      child: ListView.separated(
                        padding: EdgeInsets.all(KSizes.vGapMedium),
                        itemCount: controller.loanRecords.length,
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: KSizes.vGapMedium,
                          );
                        },
                        itemBuilder: (context, index) {
                          LoanRecordData data = controller.loanRecords[index];
                          return Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  10.r,
                                ),
                                color: KColors.white),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Due",
                                          style: TextStyle(
                                            fontSize: KFontSize.small,
                                            fontWeight: KFontWeight.normal,
                                            color: KColors.greyText,
                                          ),
                                        ),
                                        Text(
                                          data.payableAmount,
                                          style: TextStyle(
                                            fontSize: 24.sp,
                                            fontWeight: KFontWeight.medium,
                                            // color: KColors.primary,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          "Installmets",
                                          style: TextStyle(
                                            fontSize: KFontSize.small,
                                            fontWeight: KFontWeight.normal,
                                            color: KColors.greyText,
                                          ),
                                        ),
                                        Text(
                                          "${data.paidInstallments.toInt()}/${data.installments}",
                                          style: TextStyle(
                                            fontSize: 24.sp,
                                            fontWeight: KFontWeight.medium,
                                            // color: KColors.primary,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      data.status,
                                      style: TextStyle(
                                        fontSize: KFontSize.large,
                                        fontWeight: KFontWeight.medium,
                                        color: data.status == "approved" ? KColors.primary : KColors.red,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                const Divider(
                                  color: KColors.borderColor,
                                  thickness: 0.6,
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: 95.w,
                                              child: Text(
                                                "Total Amount",
                                                style: TextStyle(
                                                  fontSize: KFontSize.medium,
                                                  fontWeight: KFontWeight.normal,
                                                  color: KColors.greyText,
                                                ),
                                              ),
                                            ),
                                            Text(
                                              " : ${data.amount}",
                                              style: TextStyle(
                                                fontSize: KFontSize.medium,
                                                fontWeight: KFontWeight.normal,
                                                // color: KColors.primary,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: 95.w,
                                              child: Text(
                                                "Per Installment",
                                                style: TextStyle(
                                                  fontSize: KFontSize.medium,
                                                  fontWeight: KFontWeight.normal,
                                                  color: KColors.greyText,
                                                ),
                                              ),
                                            ),
                                            Text(
                                              " : ${data.installmentAmount}",
                                              style: TextStyle(
                                                fontSize: KFontSize.medium,
                                                fontWeight: KFontWeight.normal,
                                                // color: KColors.primary,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    if (data.status == "approved")
                                      CustomButton(
                                          height: 35.h,
                                          onTap: () async {
                                            controller.installmentRecords.value = data.installmentRecords;
                                            Get.toNamed(Routes.installmentRecordsPage, arguments: {"index": index});
                                          },
                                          name: "  Installments  ",
                                          color: KColors.primary),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: data.notes != null ? KSizes.vGapMedium : 0,
                                  ),
                                  child: Text(
                                    data.notes ?? "",
                                    style: TextStyle(
                                      fontSize: KFontSize.small,
                                      fontWeight: KFontWeight.normal,
                                      color: KColors.red,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
        ));
  }
}
