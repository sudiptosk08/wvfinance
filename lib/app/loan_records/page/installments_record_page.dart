import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loan_app/app/loan_records/controller/loan_records_controller.dart';
import 'package:loan_app/app/loan_records/model/loan_records_history_model.dart';
import 'package:loan_app/app/widgets/custom_loading/custom_loading.dart';
import 'package:loan_app/app/widgets/show_sheet.dart';
import 'package:loan_app/utils/buttons/custom_button.dart';
import 'package:loan_app/utils/color/kcolors.dart';
import 'package:loan_app/utils/sizes/k_sizes.dart';
import 'package:loan_app/utils/text_utils/text_utils.dart';

class InstallmentRecordsPage extends GetView<LoanRecordsController> {
  const InstallmentRecordsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Stack(
          children: [
            Scaffold(
              appBar: AppBar(
                title: Text(
                  "Installment Records",
                  style: TextStyle(
                    fontSize: KFontSize.extraLarge,
                  ),
                ),
              ),
              body: ListView.separated(
                padding: EdgeInsets.all(KSizes.vGapMedium),
                itemCount: controller.installmentRecords.length,
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: KSizes.vGapMedium,
                  );
                },
                itemBuilder: (context, index) {
                  InstallmentRecord data = controller.installmentRecords[index];
                  return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            10.r,
                          ),
                          color: data.isPaid == 0 ? KColors.white : KColors.borderColor),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 60.w,
                                    child: Text(
                                      "Bill No",
                                      style: TextStyle(
                                        fontSize: KFontSize.medium,
                                        fontWeight: KFontWeight.normal,
                                        color: KColors.greyText,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    " : ${data.billNo}",
                                    style: TextStyle(
                                      fontSize: KFontSize.medium,
                                      fontWeight: KFontWeight.medium,
                                      // color: KColors.primary,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 60.w,
                                    child: Text(
                                      "Amount",
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
                                      fontWeight: KFontWeight.medium,
                                      // color: KColors.primary,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 60.w,
                                    child: Text(
                                      "Last Date",
                                      style: TextStyle(
                                        fontSize: KFontSize.medium,
                                        fontWeight: KFontWeight.normal,
                                        color: KColors.greyText,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    " : ${data.lastDate}",
                                    style: TextStyle(
                                      fontSize: KFontSize.medium,
                                      fontWeight: KFontWeight.medium,
                                      // color: KColors.primary,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          data.isPaid == 0
                              ? CustomButton(
                                  height: 35.h,
                                  width: 60.w,
                                  onTap: () {
                                    KWidgets.defaultDialog(
                                        insetPadding: 35,
                                        context: context,
                                        child: Column(
                                          children: [
                                            Text(
                                              "Are you sure want to pay this installment?",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(fontFamily: KFontFamily.poppins, fontSize: KFontSize.large),
                                            ),
                                            SizedBox(
                                              height: KSizes.hGapExtraLarge,
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                                              children: [
                                                Expanded(
                                                  child: CustomButton(
                                                    name: "Confirm",
                                                    height: 35.h,
                                                    color: KColors.primary,
                                                    onTap: () {
                                                      controller.payInstallment(data.id.toString());
                                                      Get.back();
                                                    },
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: KSizes.hGapSmall,
                                                ),
                                                Expanded(
                                                  child: CustomButton(
                                                    height: 35.h,
                                                    name: "Cancel",
                                                    color: KColors.red,
                                                    onTap: () {
                                                      Get.back();
                                                    },
                                                  ),
                                                )
                                              ],
                                            )
                                          ],
                                        ));
                                  },
                                  name: "  Pay  ",
                                  color: KColors.primary)
                              : Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                  child: Text(
                                    "Paid",
                                    style: TextStyle(
                                      fontSize: KFontSize.large,
                                      fontFamily: KFontFamily.poppins,
                                    ),
                                  ),
                                )
                        ],
                      ));
                },
              ),
            ),
            if (controller.isLoading.value) const CustomLoading()
          ],
        ));
  }
}
