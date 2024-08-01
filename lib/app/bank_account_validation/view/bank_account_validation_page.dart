import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loan_app/app/bank_account_validation/controller/bank_account_validation_controller.dart';
import 'package:loan_app/app/widgets/custom_loading/custom_loading.dart';

import 'package:loan_app/utils/buttons/custom_button.dart';
import 'package:loan_app/utils/color/kcolors.dart';
import 'package:loan_app/utils/lang/app_lang.dart';
import 'package:loan_app/utils/sizes/k_sizes.dart';
import 'package:loan_app/utils/text_field_container/text_field_container.dart';
import 'package:loan_app/utils/text_utils/k_text_styles.dart';

class BankAccountValidationPage extends GetView<BankAccountValidationController> {
  const BankAccountValidationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Stack(
        children: [
          Scaffold(
            backgroundColor: KColors.white,
            appBar: AppBar(
              title: Text(appLang.bankAccountValidation),
            ),
            body: ListView(
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
                              appLang.userName,
                              style: KTextStyles.textFieldLabel,
                            ),
                          ),
                          SizedBox(
                            width: KSizes.hGapSmall,
                          ),
                          Expanded(
                            flex: 5,
                            child: TextFieldContainer(
                              readOnly: controller.bankAccount != null,
                              rtl: true,
                              height: 40.h,
                              hint: appLang.writeBankAccountHolderName,
                              controller: controller.nameController,
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
                              appLang.bankName,
                              style: KTextStyles.textFieldLabel,
                            ),
                          ),
                          SizedBox(
                            width: KSizes.hGapSmall,
                          ),
                          Expanded(
                            flex: 5,
                            child: TextFieldContainer(
                              readOnly: controller.bankAccount != null,
                              rtl: true,
                              height: 40.h,
                              keyboardType: TextInputType.text,
                              hint: appLang.writeBankName,
                              controller: controller.bankNameController,
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
                              appLang.accountNumber,
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
                              readOnly: controller.bankAccount != null,
                              height: 40.h,
                              keyboardType: TextInputType.number,
                              hint: appLang.writeBankAccountNumber,
                              controller: controller.accountNumController,
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
                              appLang.branchName,
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
                              readOnly: controller.bankAccount != null,
                              height: 40.h,
                              keyboardType: TextInputType.text,
                              hint: appLang.writeBankAccountBranchName,
                              controller: controller.branchNameController,
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
                if (controller.bankAccount == null)
                  // || controller.bankAccount?.verifiedAt == null)
                  Padding(
                    padding: EdgeInsets.all(KSizes.hGapMedium),
                    child: CustomButton(
                        onTap: () {
                          // controller.bankAccount == null
                          //     ? controller.saveBankAccount()
                          //     : controller.bankAccount != null &&
                          //             controller.bankAccount?.verifiedAt == null
                          //         ? controller.updateBankAccount()
                          //         : null;
                          controller.saveBankAccount();
                        },
                        // name: controller.bankAccount == null
                        //     ? "Submit"
                        //     :controller.bankAccount != null &&
                        //               controller.bankAccount?.verifiedAt == null
                        //           ? "Update" : "",
                        name: appLang.submit),
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
