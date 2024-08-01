import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loan_app/app/help/view/help_page.dart';
import 'package:loan_app/app/home/view/home_page.dart';
import 'package:loan_app/app/loan_choice/controller/loan_choice_controller.dart';
import 'package:loan_app/app/profile/view/profile_page.dart';
import 'package:loan_app/app/wallet/view/wallet_page.dart';
import 'package:loan_app/app/widgets/show_sheet.dart';
import 'package:loan_app/utils/buttons/custom_button.dart';
import 'package:loan_app/utils/color/kcolors.dart';
import 'package:loan_app/utils/lang/app_lang.dart';
import 'package:loan_app/utils/sizes/k_sizes.dart';
import 'package:loan_app/utils/text_utils/text_utils.dart';

class NavigationPage extends GetView<LoanChoiceController> {
  const NavigationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        if (didPop) return;
        KWidgets.defaultDialog(
            insetPadding: 40,
            context: context,
            child: Column(
              children: [
                Text(
                  // appLang.
                  "Do you want to exit ?",
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
                          SystemNavigator.pop();
                        },
                      ),
                    ),
                    SizedBox(
                      width: KSizes.hGapSmall,
                    ),
                    Expanded(
                      child: CustomButton(
                        name: "No",
                        color: KColors.red,
                        height: 35.h,
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
      // onWillPop: () async {
      //   KWidgets.defaultDialog(
      //       insetPadding: 40,
      //       context: context,
      //       child: Column(
      //         children: [
      //           Text(
      //             "Do you want to exit ?",
      //             style: TextStyle(
      //                 fontFamily: KFontFamily.poppins,
      //                 fontSize: KFontSize.large),
      //           ),
      //           SizedBox(
      //             height: KSizes.hGapExtraLarge,
      //           ),
      //           Row(
      //             mainAxisAlignment: MainAxisAlignment.spaceAround,
      //             children: [
      //               Expanded(
      //                 child: CustomButton(
      //                   name: "Confirm",
      //                   height: 35.h,
      //                   color: KColors.primary,
      //                   onTap: () {
      //                     SystemNavigator.pop();
      //                   },
      //                 ),
      //               ),
      //               SizedBox(
      //                 width: KSizes.hGapSmall,
      //               ),
      //               Expanded(
      //                 child: CustomButton(
      //                   name: "No",
      //                   color: KColors.red,
      //                   height: 35.h,
      //                   onTap: () {
      //                     Get.back();
      //                   },
      //                 ),
      //               )
      //             ],
      //           )
      //         ],
      //       ));
      //   return false;
      // },
      child: Obx(
        () => Scaffold(
          backgroundColor: KColors.background,
          bottomNavigationBar: BottomNavigationBar(
            iconSize: 20.sp,
            items: [
              BottomNavigationBarItem(
                icon: const Icon(Icons.home_outlined),
                label: appLang.home,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.wallet_outlined),
                label: appLang.wallet,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.message_outlined),
                label: appLang.help,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.person_2_outlined),
                label: appLang.profile,
              ),
            ],
            type: BottomNavigationBarType.shifting,
            currentIndex: controller.selectedIndex.value,
            selectedItemColor: KColors.primary,
            showUnselectedLabels: true,
            unselectedItemColor: KColors.gray,
            selectedLabelStyle: TextStyle(
              fontSize: KFontSize.medium,
              fontWeight: KFontWeight.bold,
            ),
            unselectedLabelStyle: TextStyle(
              fontSize: KFontSize.small,
              fontWeight: KFontWeight.normal,
            ),
            onTap: (int index) {
              controller.selectedIndex.value = index;
              if (controller.selectedIndex.value == 1) {
                controller.initFunc();
              }
            },
            elevation: 0,
          ),
          body: IndexedStack(
            index: controller.selectedIndex.value,
            children: const [
              HomePage(),
              WalletPage(),
              HelpPage(),
              ProfilePage(),
            ],
          ),
        ),
      ),
    );
  }
}
