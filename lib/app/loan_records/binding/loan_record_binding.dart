import 'package:get/get.dart';
import 'package:loan_app/app/loan_records/controller/loan_records_controller.dart';

class LoanRecordsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => LoanRecordsController(),
    );
  }
}
