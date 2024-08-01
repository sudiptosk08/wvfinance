import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loan_app/app/about_us/controller/about_us_controller.dart';
import 'package:loan_app/utils/lang/app_lang.dart';
import 'package:loan_app/utils/text_utils/text_utils.dart';

class AboutUsPage extends GetView<AboutUsController> {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          appBar: AppBar(
            title: Text(
              appLang.aboutUs,
              style: TextStyle(
                fontSize: KFontSize.extraLarge,
              ),
            ),
          ),
          body: SafeArea(
              child: ListView(children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                controller.about.toString(),
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: KFontSize.medium,
                  fontFamily: KFontFamily.poppins,
                ),
              ),
            ),
          ])),
        ));
  }
}
