import 'package:get/get.dart';
import 'package:loan_app/app/signature_validation/controller/signature_validation_controller.dart';

class SignatureValidationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignatureValidationController());
  }
}
