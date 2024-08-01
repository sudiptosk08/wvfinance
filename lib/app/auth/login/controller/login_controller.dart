// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:loan_app/app/auth/api/auth_api.dart';
// import 'package:loan_app/app/auth/model/auth_model.dart';
// import 'package:loan_app/app/auth/model/country_list_model.dart';
// import 'package:loan_app/local_storage/local_storage.dart';
// import 'package:loan_app/routes/routes.dart';

// class LoginController extends GetxController {
//   @override
//   void onInit() {
//     getCountries();
//     super.onInit();
//   }

//   final formKey = GlobalKey<FormState>();

//   RxBool isLoading = false.obs;

//   Future<void> login() async {
//     isLoading.value = true;

//     Map<String, dynamic> body = {
//       "phone_code": "+880",
//       "phone": phoneController.text,
//       "password": passwordController.text,
//     };

//     AuthModel? response = await AuthApi.loginApi(body: body);

//     if (response != null) {
//       LocalStorage.saveApiToken(token: response.data.token);
//       Get.offAllNamed(Routes.navigationPage);
//     }
//     isLoading.value = false;
//   }

//   RxList<Country> countries = <Country>[].obs;
//   RxString phoneCode = ''.obs;
//   RxInt countryID = 0.obs;

//   Rx<Country> country = Country(
//     id: 19,
//     name: "Bangladesh",
//     countryCode: "BD",
//     phoneCode: "+880",
//   ).obs;

//   Future<void> getCountries() async {
//     AuthApi.countryListApi().then((value) {
//       if (value != null) {
//         countries.value = value.data;
//       }
//     });
//   }

//   RxBool isObscure = true.obs;
//   TextEditingController phoneController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
// }
