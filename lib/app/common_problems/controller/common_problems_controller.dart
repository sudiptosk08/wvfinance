import 'package:get/get.dart';
import 'package:loan_app/app/app_openning/model/app_settings_model.dart';
import 'package:loan_app/local_storage/local_storage.dart';

class CommonProblemsController extends GetxController {
  @override
  void onInit() {
    getCommonProblems();
    super.onInit();
  }

  RxBool isLoading = false.obs;
  RxList<Faq> faqs = <Faq>[].obs;

  Future<void> getCommonProblems() async {
    isLoading.value = true;
    AppSettingModel? localData = await LocalStorage.getAppSetting();

    if (localData != null) {
      faqs.value = localData.data.faqs;
    }
    isLoading.value = false;
  }
}
