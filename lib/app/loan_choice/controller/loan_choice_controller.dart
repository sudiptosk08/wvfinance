import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:loan_app/app/app_openning/model/app_settings_model.dart';
import 'package:loan_app/app/loan_choice/api/loan_choice_api.dart';
import 'package:loan_app/app/loan_choice/model/dashboard_model.dart';
import 'package:loan_app/app/personal_info/api/personal_info_api.dart';
import 'package:loan_app/app/personal_info/model/personal_info_model.dart';
import 'package:loan_app/app/withdraw/api/withdraw_api.dart';
import 'package:loan_app/app/withdraw/model/withdraw_histroy_model.dart';
import 'package:loan_app/backend/api_urls/api_urls.dart';
import 'package:loan_app/backend/toast/toast_message.dart';
import 'package:loan_app/local_storage/local_storage.dart';
import 'package:loan_app/routes/routes.dart';
import 'package:loan_app/utils/color/kcolors.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class LoanChoiceController extends GetxController {
  RxInt selectedIndex = 0.obs;

  @override
  void onInit() {
    initFunc();
    getSocialMediaData();
    getPersonalInfo();
    scrollListener();
    super.onInit();
  }

  Future<void> initFunc() async {
    isLoading.value = true;
    withdrawRecord.clear();
    nextUrl.value = "";
    await getDashBoardInfo();
    await getWithdrawHistory();

    isLoading.value = false;
  }

  NidCard? nidCard;
  Eligibility? eligibility;
  BankAccount? bankAccount;
  PhoneNumber? phoneNumber;
  Signature? signature;

  Future<void> getPersonalInfo() async {
    isLoading.value = true;

    PersonalInfoModel? response = await PersonalInfoApi.getPersonalInfo();

    if (response != null) {
      nidCard = response.data.nidCard;
      eligibility = response.data.eligibility;
      bankAccount = response.data.bankAccount;
      phoneNumber = response.data.phoneNumber;
      signature = response.data.signature;
    }
    isLoading.value = false;
  }

  ScrollController scrollController = ScrollController();

  RxInt selectedAmount = 0.obs;
  RxInt selectedDuration = 0.obs;
  RxBool isLoading = false.obs;
  RxString nextUrl = "".obs;

  RxList<WithdrawData> withdrawRecord = <WithdrawData>[].obs;

  void scrollListener() {
    scrollController.addListener(() async {
      if (scrollController.position.maxScrollExtent ==
          scrollController.offset) {
        if (nextUrl.isNotEmpty) {
          await getWithdrawHistory(url: nextUrl.value);
        }
      }
    });
  }

  Future<void> getWithdrawHistory({String? url}) async {
    WithdrawHistoryModel? withdrawData = await WithdrawApi.getWithdrawalHistory(
      url: url ?? ApiUrls.withdrawsHistory,
    );

    if (withdrawData != null) {
      nextUrl.value = withdrawData.links.next ?? "";
      withdrawRecord.addAll(withdrawData.data);
      // withdrawRecord.value = withdrawData.data;
    }
  }

  Future<void> loanchoiceApply() async {
    isLoading.value = true;
    Map<String, dynamic> body = {
      "amount": selectedAmount.value,
      "installments": selectedDuration.value,
    };
    bool isSaved = await LoanChoiceApi.loanChoiceApi(body: body);

    if (isSaved) {
      Get.offAllNamed(Routes.navigationPage);
    }
    isLoading.value = false;
  }

  DashBoardData? dashBoardData;
  RxString agreement = "".obs;

  Future<void> getSocialMediaData() async {
    AppSettingModel? data = await LocalStorage.getAppSetting();

    if (data != null) {
      whatsapp.value = data.data.whatsapp;
      telegram.value = data.data.telegram;
    }
  }

  Future<void> launchExternalApp(String url) async {
    bool canLaunch = await canLaunchUrl(Uri.parse(url));

    if (canLaunch) {
      await launchUrl(
        Uri.parse(url),
        mode: LaunchMode.externalApplication,
      );
    } else {
      ToastMessage.error("Application not installed");
    }
  }

  RxString whatsapp = "".obs;
  RxString telegram = "".obs;
  Map<String, dynamic>? installments;
  RxInt installment = 0.obs;
  RxInt total = 0.obs;
  calculate() {
    if (selectedAmount.value != 0 && selectedDuration.value != 0) {
      print(installments![selectedAmount.toString()]
          [selectedDuration.toString()]["installment"]);
      dynamic data =
          installments![selectedAmount.toString()][selectedDuration.toString()];
      installment.value = data["installment"];
      total.value = data["total"];
    }
  }

  Future<void> getDashBoardInfo() async {
    isLoading.value = true;
    Map<String, dynamic>? res = await LoanChoiceApi.getDashBoardInfo();
    if (res != null) {
      DashBoardModel? response = DashBoardModel.fromJson(res);
      installments = res["data"]["installments"];
      dashBoardData = response.data;
      agreement.value = response.data.agreement!;
      print("Agreement ${agreement.value}");
      LocalStorage.saveUserNumber(
          userNumber: dashBoardData!.user.fullPhone.replaceFirst('+', ''));
      LocalStorage.saveUserID(userID: dashBoardData!.user.userId);
      LocalStorage.saveUserImage(userImage: dashBoardData!.user.image);
      isLoading.value = false;
    }
  }

  webView() {
    return WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(KColors.white)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://worldvisionbd.co/agreement?user_id=240608764&loan_id=39')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse('https://worldvisionbd.co/agreement?user_id=240608764&loan_id=39'));
  }

  Future<void> requestLoanRoute() async {
    bool isInfoNull = nidCard == null ||
        eligibility == null ||
        bankAccount == null ||
        phoneNumber == null ||
        signature == null;
    bool isLoanApplied = dashBoardData!.user.loanApplied == 0;
    isLoanApplied
        ? isInfoNull
            ? Get.toNamed(Routes.personalInfoPage)!
                .then((value) => getPersonalInfo())
            : Get.toNamed(Routes.loanChoicePage)
        : Get.toNamed(Routes.loanRecordsPage);
  }
}
