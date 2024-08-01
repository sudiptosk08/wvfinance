import 'package:get/get.dart';
import 'package:loan_app/app/app_openning/controller/app_opening_controller.dart';

class AppOpenningBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AppOpeningController());
  }
}
