import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loan_app/app/app_openning/controller/app_opening_controller.dart';
import 'package:loan_app/utils/color/kcolors.dart';

class AppOpenningPage extends GetView<AppOpeningController> {
  const AppOpenningPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColors.background,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Center(
                  child: Text(
                "WORLD VISION BD",
                style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: KColors.primary),
              )),
              SizedBox(
                height: 8.h,
              ),
              Obx(
                () => Text(
                  controller.appName.value,
                  style: TextStyle(
                    color: KColors.primary,
                    fontSize: 14.sp,
                  ),
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Obx(
                () => Text(
                  'Version ${controller.installedVersion.value}',
                  style: TextStyle(
                    color: KColors.primary,
                    fontSize: 16.sp,
                  ),
                ),
              ),
              SizedBox(
                height: 25.h,
              )
            ],
          )
        ],
      ),
    );
  }
}
