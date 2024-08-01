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

class LoginPage extends GetView<AuthController> {
  const LoginPage({super.key});

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
                        height:
                            200.h, // Set the desired height of your container
                        color: KColors
                            .primary, // Set the background color of your container
                        child: Column(
                          children: [
                            const Padding(
                                padding: EdgeInsets.only(
                                    left: 20.0,
                                    right: 20.0,
                                    bottom: 0,
                                    top: 40),
                                child: Text(
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
                                  fontFamily: KFontFamily.poppins),
                            ),
                          ],
                        )),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  Form(
                    key: controller.loginFormKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          margin: const EdgeInsets.all(12.0),
                          height: 40.h,
                          color: KColors.grey100,
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
                                        bottomLeft: Radius.circular(5),
                                      ),
                                    ),
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
                                  controller: controller.loginPhoneController,
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
                              controller.isObscureLoginPass.value =
                                  !controller.isObscureLoginPass.value;
                            },
                            icon: controller.isObscureLoginPass.value
                                ? const Icon(
                                    Icons.visibility_off_outlined,
                                    color: KColors.black,
                                  )
                                : const Icon(
                                    Icons.visibility_outlined,
                                    color: KColors.black,
                                  ),
                          ),
                          obscureText: controller.isObscureLoginPass.value,
                          controller: controller.loginPassController,
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            appLang.forgotPassword,
                            style: TextStyle(
                              color: KColors.black,
                              fontSize: KFontSize.medium,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: KSizes.hGapLarge),
                    child: CustomButton(
                      name: appLang.login,
                      onTap: () {
                        controller.login();
                      },
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
                          Get.toNamed(Routes.registrationPage);
                        },
                        child: Text(
                          appLang.createAnAccount,
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

  // forgotPasswordBottomSheet(
  //     BuildContext context, TextEditingController emailController) {
  //   KWidgets.bottomSheet(
  //     context: context,
  //     children: [
  //       Padding(
  //         padding: const EdgeInsets.all(20),
  //         child: Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             const SizedBox(
  //               height: 50,
  //             ),
  //             const Text(
  //               'Forgot password',
  //               // style: TextStyles.mediumPoppins24Black24,
  //             ),
  //             const SizedBox(
  //               height: 5,
  //             ),
  //             const Text(
  //               'Enter your email for the verification proccesss, we will send 4 digits code to your email.',
  //               // style: TextStyles.regularRubik14Gray94,
  //             ),
  //             const SizedBox(
  //               height: 35,
  //             ),
  //             TextFieldContainer(
  //               rtl: false,
  //               hint: 'Email',
  //               label: 'example@example.com',
  //               padding: 0,
  //               controller: emailController,
  //             ),
  //             const SizedBox(
  //               height: 35,
  //             ),
  //             Center(
  //               child: CustomButton(
  //                 onTap: () {
  //                   Get.back();
  //                   verificationBottomSheet(context);
  //                 },
  //                 name: 'Continue',
  //                 color: KColors.secondary,
  //                 textColor: KColors.white,
  //               ),
  //             ),
  //           ],
  //         ),
  //       )
  //     ],
  //   );
  // }

  // verificationBottomSheet(BuildContext context) {
  //   KWidgets.bottomSheet(
  //     context: context,
  //     children: [
  //       Padding(
  //         padding: const EdgeInsets.all(20),
  //         child: Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             const SizedBox(
  //               height: 50,
  //             ),
  //             const Text(
  //               'Enter 4 Digits Code',
  //               // style: TextStyles.mediumPoppins24Black24,
  //             ),
  //             const SizedBox(
  //               height: 5,
  //             ),
  //             const Text(
  //               'Enter the 4 digits code that you received on your email.',
  //               // style: TextStyles.regularRubik14Gray94,
  //             ),
  //             const SizedBox(
  //               height: 35,
  //             ),
  //             //Pin code,
  //             PinCodeTextField(
  //               appContext: context,
  //               length: 4,
  //               onChanged: (value) {},
  //               onCompleted: (value) {
  //                 Get.back();
  //               },
  //               obscureText: false,
  //               animationType: AnimationType.fade,
  //               // textStyle: TextStyles.boldPTSans26Green7F,
  //               pinTheme: PinTheme(
  //                 shape: PinCodeFieldShape.box,
  //                 borderRadius: BorderRadius.circular(8),
  //                 fieldHeight: 65,
  //                 fieldWidth: 65,
  //                 activeFillColor: KColors.primary,
  //                 inactiveColor: KColors.black,
  //                 selectedColor: KColors.black,
  //               ),
  //             ),
  //             const SizedBox(
  //               height: 35,
  //             ),
  //             Center(
  //               child: CustomButton(
  //                 onTap: () {
  //                   Get.back();
  //                   resetPasswordBottomSheet(context);
  //                 },
  //                 name: 'Continue',
  //                 color: KColors.secondary,
  //                 textColor: KColors.white,
  //               ),
  //             ),
  //           ],
  //         ),
  //       )
  //     ],
  //   );
  // }

  // resetPasswordBottomSheet(BuildContext context) {
  //   RxBool isObscure = false.obs;
  //   KWidgets.bottomSheet(
  //     context: context,
  //     children: [
  //       Obx(
  //         () => Padding(
  //           padding: const EdgeInsets.all(20),
  //           child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               const SizedBox(
  //                 height: 50,
  //               ),
  //               const Text(
  //                 'Reset password',
  //                 // style: TextStyles.mediumPoppins24Black24,
  //               ),
  //               const SizedBox(
  //                 height: 5,
  //               ),
  //               const Text(
  //                 'Set the new password for your account so you can login and access all the features.',
  //                 // style: TextStyles.regularRubik14Gray94,
  //               ),
  //               const SizedBox(
  //                 height: 35,
  //               ),
  //               TextFieldContainer(
  //                 hint: 'New password',
  //                 rtl: false,
  //                 label: 'New password',
  //                 suffixIcon: IconButton(
  //                     onPressed: () {
  //                       isObscure.value = isObscure.value;
  //                     },
  //                     icon: isObscure.value
  //                         ? const Icon(Icons.visibility_off_outlined)
  //                         : const Icon(Icons.visibility_outlined)),
  //                 obscureText: isObscure.value,
  //                 controller: TextEditingController(),
  //                 padding: 0,
  //               ),
  //               const SizedBox(
  //                 height: 35,
  //               ),
  //               TextFieldContainer(
  //                 rtl: false,
  //                 hint: 'Re-enter password',
  //                 label: 'Re-enter password',
  //                 suffixIcon: IconButton(
  //                   onPressed: () {},
  //                   icon: Icon(
  //                     isObscure.value
  //                         ? Icons.visibility_off_outlined
  //                         : Icons.visibility_outlined,
  //                   ),
  //                 ),
  //                 obscureText: isObscure.value,
  //                 padding: 0,
  //                 controller: TextEditingController(),
  //               ),
  //               const SizedBox(
  //                 height: 35,
  //               ),
  //               Center(
  //                 child: CustomButton(
  //                   onTap: () {
  //                     Get.back();
  //                   },
  //                   name: 'Update Password',
  //                   color: KColors.secondary,
  //                   textColor: KColors.white,
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //       )
  //     ],
  //   );
  // }
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
