import 'package:get/get.dart';
import 'package:loan_app/app/recharge/controller/recharge_controller.dart';

class RechargeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RechargeController());
  }
}
