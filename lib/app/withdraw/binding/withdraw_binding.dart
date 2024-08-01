import 'package:get/get.dart';
import 'package:loan_app/app/withdraw/controller/withdraw_controller.dart';

class WithdrawBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WithdrawController());
  }
}
