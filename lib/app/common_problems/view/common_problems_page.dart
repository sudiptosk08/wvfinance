import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loan_app/app/app_openning/model/app_settings_model.dart';
import 'package:loan_app/app/common_problems/controller/common_problems_controller.dart';
import 'package:loan_app/app/widgets/custom_loading/custom_loading.dart';
import 'package:loan_app/utils/color/kcolors.dart';
import 'package:loan_app/utils/lang/app_lang.dart';
import 'package:loan_app/utils/sizes/k_sizes.dart';
import 'package:loan_app/utils/text_utils/text_utils.dart';

class CommonProblemsPage extends GetView<CommonProblemsController> {
  const CommonProblemsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Stack(
        children: [
          Scaffold(
            appBar: AppBar(
              title: Text(
                appLang.commonProblems,
                style: TextStyle(
                  fontSize: KFontSize.extraLarge,
                ),
              ),
            ),
            body: ListView.separated(
              padding: EdgeInsets.all(KSizes.vGapMedium),
              itemCount: controller.faqs.length,
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: KSizes.vGapMedium,
                );
              },
              itemBuilder: (context, index) {
                Faq data = controller.faqs[index];
                return Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        10.r,
                      ),
                      color: KColors.white),
                  child: ExpansionTile(
                    title: Text(
                      data.question,
                      style: TextStyle(
                        fontSize: KFontSize.medium,
                        fontWeight: KFontWeight.bold,
                        color: KColors.primary,
                      ),
                    ),
                    shape: const Border(),
                    iconColor: KColors.primary,
                    collapsedIconColor: KColors.primary,
                    childrenPadding: EdgeInsets.all(KSizes.hGapMedium),
                    children: [
                      const Divider(),
                      Text(
                        data.answer,
                        style: TextStyle(
                          fontSize: KFontSize.medium,
                          fontWeight: KFontWeight.bold,
                          color: KColors.gray223,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          if (controller.isLoading.value) const CustomLoading()
        ],
      ),
    );
  }
}
