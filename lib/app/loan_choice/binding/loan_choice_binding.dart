import 'package:get/get.dart';
import 'package:loan_app/app/loan_choice/controller/loan_choice_controller.dart';

class LoanChoiceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoanChoiceController());
  }
}
