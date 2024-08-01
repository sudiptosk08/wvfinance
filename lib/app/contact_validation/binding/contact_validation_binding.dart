import 'package:get/get.dart';
import 'package:loan_app/app/contact_validation/controller/contact_validation_controller.dart';

class ContactValidationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ContactValidationController());
  }
}
