import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loan_app/app/auth/controller/auth_controller.dart';
import 'package:loan_app/app/widgets/custom_loading/custom_loading.dart';
import 'package:loan_app/routes/routes.dart';
import 'package:loan_app/utils/buttons/custom_button.dart';
import 'package:loan_app/utils/color/kcolors.dart';
import 'package:loan_app/utils/lang/app_lang.dart';
import 'package:loan_app/utils/sizes/k_sizes.dart';
import 'package:loan_app/utils/text_field_container/text_field_container.dart';
import 'package:loan_app/utils/text_utils/text_utils.dart';

class RegistrationPage extends GetView<AuthController> {
  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Stack(
        children: [
          Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
              child: ListView(
                children: [
                  ClipPath(
                    clipper: MyClipper(),
                    child: Container(
                      height: 200.h, // Set the desired height of your container
                      color: KColors
                          .primary, // Set the background color of your container
                      child: Column(
                        children: [
                          Padding(
                              padding: EdgeInsets.only(
                                left: 20.w,
                                right: 20.w,
                                bottom: 0,
                                top: 35.h,
                              ),
                              child: const Text(
                                "WORLD VISION BD",
                                style: TextStyle(
                                    fontSize: 35,
                                    fontWeight: FontWeight.bold,
                                    color: KColors.white),
                              )),
                          Text(
                            "Loan Made Easy",
                            style: TextStyle(
                              fontSize: KFontSize.large,
                              color: KColors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Form(
                    key: controller.regFormKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          height: 40.h,
                          color: KColors.grey100,
                          margin: const EdgeInsets.all(12.0),
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  Get.bottomSheet(
                                    Column(
                                      children: [
                                        SizedBox(
                                          height: 15.h,
                                        ),
                                        Container(
                                          width: 120,
                                          height: 5,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10.r),
                                            color: Colors.grey,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 15.h,
                                        ),
                                        Expanded(
                                            child: Obx(
                                          () => ListView.separated(
                                            itemCount:
                                                controller.countries.length,
                                            separatorBuilder: (context, index) {
                                              return const Divider();
                                            },
                                            itemBuilder: (context, index) {
                                              return ListTile(
                                                onTap: () {
                                                  controller.country.value =
                                                      controller
                                                          .countries[index];
                                                  Get.back();
                                                },
                                                title: Text(
                                                  controller
                                                      .countries[index].name,
                                                  style: const TextStyle(
                                                      color: KColors.black),
                                                ),
                                                trailing: Text(
                                                  controller.countries[index]
                                                      .phoneCode,
                                                  style: TextStyle(
                                                    fontSize: KFontSize.medium,
                                                    color: KColors.black,
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        )),
                                      ],
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(15.r),
                                      ),
                                    ),
                                    backgroundColor: Colors.white,
                                  );
                                },
                                child: Obx(
                                  () => Container(
                                    width: 65.w,
                                    height: 40.h,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                          color: KColors.borderColor,
                                          width: 1.0,
                                        ),
                                        borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(5),
                                            bottomLeft: Radius.circular(5))),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text(
                                            controller.country.value.phoneCode,
                                            style: const TextStyle(
                                                color: Colors.black),
                                          ),
                                          Icon(
                                            Icons.expand_more,
                                            size: 18.sp,
                                          ),
                                        ]),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: TextFieldContainer(
                                  padding: 0,
                                  height: 40.h,
                                  phoneField: true,
                                  rtl: false,
                                  controller: controller.regPhoneController,
                                  label: appLang.phoneNumber,
                                  keyboardType: TextInputType.phone,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: KSizes.hGapMedium,
                        ),
                        TextFieldContainer(
                          rtl: false,
                          label: appLang.password,
                          suffixIcon: IconButton(
                              onPressed: () {
                                controller.isObscureRegPass.value =
                                    !controller.isObscureRegPass.value;
                              },
                              icon: controller.isObscureRegPass.value
                                  ? const Icon(
                                      Icons.visibility_off_outlined,
                                      color: KColors.black,
                                    )
                                  : const Icon(
                                      Icons.visibility_outlined,
                                      color: KColors.black,
                                    )),
                          obscureText: controller.isObscureRegPass.value,
                          controller: controller.regPassController,
                        ),
                        SizedBox(
                          height: KSizes.hGapMedium,
                        ),
                        TextFieldContainer(
                          rtl: false,
                          label: appLang.confirmPassword,
                          suffixIcon: IconButton(
                              onPressed: () {
                                controller.isObscureRegConfirmPass.value =
                                    !controller.isObscureRegConfirmPass.value;
                              },
                              icon: controller.isObscureRegConfirmPass.value
                                  ? const Icon(
                                      Icons.visibility_off_outlined,
                                      color: KColors.black,
                                    )
                                  : const Icon(
                                      Icons.visibility_outlined,
                                      color: KColors.black,
                                    )),
                          obscureText: controller.isObscureRegConfirmPass.value,
                          controller: controller.regConfirmPassController,
                        ),
                        SizedBox(
                          height: KSizes.hGapMedium,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: KSizes.hGapLarge),
                    child: CustomButton(
                      textColor: KColors.white,
                      name: appLang.registration,
                      onTap: () {
                        controller.register();
                      },
                      color: KColors.primary,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        appLang.donTHaveAnAccount,
                        style: TextStyle(
                          fontSize: KFontSize.medium,
                          color: KColors.black,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.toNamed(Routes.loginPage);
                        },
                        child: Text(
                          appLang.login,
                          style: TextStyle(
                            fontSize: KFontSize.medium,
                            color: KColors.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          if (controller.isLoading.value) const CustomLoading()
        ],
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height); // Move to the bottom-left corner
    path.quadraticBezierTo(
        size.width * 0.5, size.height - 70, size.width, size.height);

    path.lineTo(size.width, 0); // Line to the top-right corner
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
