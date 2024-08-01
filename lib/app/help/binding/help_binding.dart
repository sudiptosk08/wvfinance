import 'package:get/get.dart';
import 'package:loan_app/app/help/controller/help_controller.dart';

class HelpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HelpController());
  }
}
