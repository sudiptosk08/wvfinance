import 'package:get/get.dart';
import 'package:loan_app/app/eligibility_validation/controller/eligibility_validation_controller.dart';

class EligibilityValidationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EligibilityValidationController());
  }
}
