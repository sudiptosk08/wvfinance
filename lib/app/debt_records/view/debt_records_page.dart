import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loan_app/app/debt_records/controller/debt_records_controller.dart';
import 'package:loan_app/utils/color/kcolors.dart';
import 'package:loan_app/utils/lang/app_lang.dart';
import 'package:loan_app/utils/text_utils/text_utils.dart';

class DebtRecordsPage extends GetView<DebtRecordsController> {
  const DebtRecordsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          appLang.myDebts,
          style: TextStyle(
            fontSize: KFontSize.extraLarge,
          ),
        ),
      ),
      body: Center(
        child: Text(
          appLang.noHistoryAvailable,
          style: TextStyle(
            fontSize: KFontSize.medium,
            color: KColors.grey,
          ),
        ),
      ),
    );
  }
}
