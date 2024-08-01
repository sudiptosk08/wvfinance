import 'package:get/get.dart';
import 'package:loan_app/app/common_problems/controller/common_problems_controller.dart';

class CommonProblemsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => CommonProblemsController(),
    );
  }
}
