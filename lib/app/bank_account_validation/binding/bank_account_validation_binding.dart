import 'package:get/get.dart';
import 'package:loan_app/app/bank_account_validation/controller/bank_account_validation_controller.dart';

class BankAccountValidationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BankAccountValidationController());
  }
}
