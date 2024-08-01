import 'package:get/get.dart';
import 'package:loan_app/app/app_openning/model/app_settings_model.dart';
import 'package:loan_app/local_storage/local_storage.dart';
import 'package:loan_app/routes/routes.dart';
import 'package:package_info_plus/package_info_plus.dart';

class SettingController extends GetxController {
  @override
  void onInit() {
    getAppVersion();
    getAppLang();
    super.onInit();
  }

  RxBool isEn = false.obs;

  RxString appVersion = '0.0.0'.obs;
  RxBool isMobileBanking = true.obs;

  Future<void> getAppLang() async {
    isEn.value = await LocalStorage.getAppLanguage() == 'en';
  }

  Future<void> changeAppLang() async {
    AppSettingModel? value = await LocalStorage.getAppSetting();
    if (isEn.value) {
      await LocalStorage.saveAppLanguage(lang: 'en');
      await LocalStorage.saveAppLanglist(lang: value!.data.language.en);
      Get.offAllNamed(Routes.appOppeningPage);
    } else {
      await LocalStorage.saveAppLanguage(lang: 'bn');
      await LocalStorage.saveAppLanglist(lang: value!.data.language.bn);
      Get.offAllNamed(Routes.appOppeningPage);
    }
  }

  Future<void> getAppVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    appVersion.value = packageInfo.version;
  }
}
