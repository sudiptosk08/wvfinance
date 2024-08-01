import 'package:get/get.dart';
import 'package:loan_app/app/debt_records/controller/debt_records_controller.dart';

class DebtRecordsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => DebtRecordsController(),
    );
  }
}
