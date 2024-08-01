// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:loan_app/app/auth/api/auth_api.dart';
// import 'package:loan_app/app/auth/model/auth_model.dart';
// import 'package:loan_app/app/auth/model/country_list_model.dart';
// import 'package:loan_app/backend/toast/toast_message.dart';
// import 'package:loan_app/local_storage/local_storage.dart';
// import 'package:loan_app/routes/routes.dart';

// class RegistrationController extends GetxController {
//   final formKey = GlobalKey<FormState>();

//   RxBool isLoading = false.obs;

//   Future<void> register() async {
//     if (passwordController.text != confirmPasswordController.text) {
//       ToastMessage.error('Please Check Your Password, Mismatched Password');
//       return;
//     }
//     isLoading.value = true;

//     Map<String, dynamic> body = {
//       "phone": phoneController.text,
//       "password": passwordController.text,
//       "country_id": 19,
//     };

//     AuthModel? response = await AuthApi.registrationApi(body: body);

//     if (response != null) {
//       LocalStorage.saveApiToken(token: response.data.token);
//       Get.offAllNamed(Routes.navigationPage);
//     }
//     isLoading.value = false;
//   }

//   Rx<Country> country = Country(
//     id: 19,
//     name: "Bangladesh",
//     countryCode: "BD",
//     phoneCode: "+880",
//   ).obs;
//   RxList<Country> countries = <Country>[].obs;

//   RxBool isObscurePass = true.obs;
//   RxBool isObscureConfirmPass = true.obs;

//   TextEditingController userNameController = TextEditingController();

//   TextEditingController passwordController = TextEditingController();
//   TextEditingController confirmPasswordController = TextEditingController();
//   TextEditingController phoneController = TextEditingController();
// }
