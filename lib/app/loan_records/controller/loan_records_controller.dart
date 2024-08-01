import 'package:get/get.dart';
import 'package:loan_app/app/loan_records/api/loan_records_api.dart';
import 'package:loan_app/app/loan_records/model/loan_records_history_model.dart';

class LoanRecordsController extends GetxController {
  @override
  void onInit() {
    getLoanRecords();
    super.onInit();
  }

  RxBool isLoading = false.obs;
  RxList<LoanRecordData> loanRecords = <LoanRecordData>[].obs;
  RxList<InstallmentRecord> installmentRecords = <InstallmentRecord>[].obs;
  Future<void> getLoanRecords() async {
    isLoading.value = true;
    LoanRecordHistoryModel? localData =
        await LoanRecordHistoryApi.loanRecordHistoryApi();

    if (localData != null) {
      loanRecords.value = localData.data;
    }
    isLoading.value = false;
  }

  Future<void> payInstallment(id) async {
    isLoading.value = true;

    bool isSaved = await LoanRecordHistoryApi.payInstallmentApi(id: id);

    if (isSaved) {
      await getLoanRecords();
      installmentRecords.value =
          loanRecords[Get.arguments['index']].installmentRecords;
      // Get.back<bool>(result: true,);
    }
    isLoading.value = false;
  }
}
