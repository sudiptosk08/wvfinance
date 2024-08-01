import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loan_app/app/app_openning/api/app_settings_api.dart';
import 'package:loan_app/local_storage/local_storage.dart';
import 'package:loan_app/routes/routes.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AppOpeningController extends GetxController {
  @override
  void onInit() {
    getAppInfo();
    super.onInit();
  }

  RxString appName = ''.obs;
  RxString packageName = ''.obs;
  RxString installedVersion = ''.obs;
  RxString runningVersion = ''.obs;
  RxString buildNumber = ''.obs;
  RxString updateUrl = ''.obs;

  Future getAppInfo() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    appName.value = packageInfo.appName;
    packageName.value = packageInfo.packageName;
    installedVersion.value = packageInfo.version;
    buildNumber.value = packageInfo.buildNumber;
    await AppSettingApi.getAppSetting().then((value) async {
      if (value != null) {
        runningVersion.value = value.data.appVersion;
        await LocalStorage.saveAppSetting(data: value);
        String? appLang = await LocalStorage.getAppLanguage();
        if (appLang == 'bn') {
          await LocalStorage.saveAppLanglist(lang: value.data.language.bn);
        } else {
          await LocalStorage.saveAppLanglist(lang: value.data.language.en);
        }
        // updateUrl.value = value.data.downloadLink;
      }
    });

    debugPrint(appName.value);
    debugPrint(packageName.value);
    debugPrint(installedVersion.value);
    debugPrint("Is old version: ${runningVersion.value != installedVersion.value}");

    debugPrint(buildNumber.value);

    // if (runningVersion.value != installedVersion.value) {
    //   Get.defaultDialog(
    //     title: '',
    //     barrierDismissible: false,
    //     radius: 5,
    //     titlePadding: const EdgeInsets.all(0),
    //     backgroundColor: Colors.white,
    //     contentPadding: EdgeInsets.symmetric(horizontal: 15.w),
    //     content: Column(
    //       children: [
    //         Text(
    //           'Update App',
    //           style: TextStyle(
    //             fontSize: 20.sp,
    //             fontWeight: FontWeight.bold,
    //             color: KColors.background,
    //           ),
    //         ),
    //         SizedBox(
    //           height: 20.h,
    //         ),
    //         Text(
    //           'You are using an old version of the App. Please visit our website and download the latest App',
    //           style: TextStyle(
    //             fontSize: 14.sp,
    //             color: KColors.background,
    //           ),
    //         ),
    //         SizedBox(
    //           height: 25.h,
    //         ),
    //         Row(
    //           children: [
    //             const Expanded(
    //               child: CustomButton(
    //                 name: 'Download',
    //                 color: KColors.background,
    //                 // onTap: () async {
    //                 //   bool canLaunch =
    //                 //       await canLaunchUrl(Uri.parse(updateUrl.value));

    //                 //   if (canLaunch) {
    //                 //     await launchUrl(
    //                 //       Uri.parse(updateUrl.value),
    //                 //       mode: LaunchMode.externalApplication,
    //                 //     );
    //                 //   } else {
    //                 //     ToastMessage.error(
    //                 //       "Can't launch now, Please visit our website to download the latest App",
    //                 //     );
    //                 //   }
    //                 // },
    //               ),
    //             ),
    //             SizedBox(
    //               width: 5.w,
    //             ),
    //           ],
    //         ),
    //       ],
    //     ),
    //   );
    //   return;
    // }
    goToMainApp();
  }

  Future<void> goToMainApp() async {
    Future.delayed(
      const Duration(seconds: 1),
      () => Get.offAllNamed(
        LocalStorage.getApiToken() != null ? Routes.navigationPage : Routes.registrationPage,
      ),
    );
  }
}
