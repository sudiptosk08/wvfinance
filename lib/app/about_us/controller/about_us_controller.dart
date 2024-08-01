import 'package:get/get.dart';
import 'package:loan_app/app/app_openning/model/app_settings_model.dart';
import 'package:loan_app/local_storage/local_storage.dart';


class AboutUsController extends GetxController {
  @override
  void onInit() {
    getAbout();
    super.onInit();
  }

  RxBool isLoading = false.obs;
  RxString about = "".obs;

  Future<void> getAbout() async {
    isLoading.value = true;
    AppSettingModel? localData = await LocalStorage.getAppSetting();

    if (localData != null) {
      about.value = localData.data.about;
    }
    isLoading.value = false;
  }
}
