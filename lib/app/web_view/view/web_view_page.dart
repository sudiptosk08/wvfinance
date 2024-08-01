import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loan_app/app/loan_choice/controller/loan_choice_controller.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends GetView<LoanChoiceController> {
  const WebViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Loan Agreement"),
      ),
      body: WebViewWidget(controller: controller.webView()),
    );
  }
}
