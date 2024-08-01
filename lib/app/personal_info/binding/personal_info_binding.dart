import 'package:get/get.dart';
import 'package:loan_app/app/personal_info/controller/personal_info_controller.dart';

class PersonalInfoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PersonalInfoController());
  }
}
