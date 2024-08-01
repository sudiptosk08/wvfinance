import 'package:get/get.dart';
import 'package:loan_app/app/id_card_verification/controller/id_card_verification_controller.dart';

class IdCardVerificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => IdCardVerificationController());
  }
}
