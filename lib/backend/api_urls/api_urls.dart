import 'package:loan_app/backend/api_config/api_config.dart';

class ApiUrls {
  static const String signup = "${ApiConfig.baseUrl}/signup";
  static const String login = "${ApiConfig.baseUrl}/login";
  static const String countries = "${ApiConfig.baseUrl}/countries";
  static const String personalInfo = "${ApiConfig.baseUrl}/personal-info";
  static const String appSetting = "${ApiConfig.baseUrl}/app-settings";

  static const String dashboardInfo = "${ApiConfig.baseUrl}/dashboard";
  static const String withdrawsHistory = "${ApiConfig.baseUrl}/withdraws";
  static const String rechargeBankOption =
      "${ApiConfig.baseUrl}/payment-options?type=bank";
  static const String rechargeMobileBankingOption =
      "${ApiConfig.baseUrl}/payment-options?type=mobile";
  static const String recharge = "${ApiConfig.baseUrl}/recharges";
  static const String nidStore = "${ApiConfig.baseUrl}/nid/store";
  static const String nidUpdate = "${ApiConfig.baseUrl}/nid/update";

  static const String bankStore = "${ApiConfig.baseUrl}/bank/store";
  static const String bankUpdate = "${ApiConfig.baseUrl}/bank/update";
  static const String phoneStore = "${ApiConfig.baseUrl}/phone-numbers/store";
  static const String changePassword = "${ApiConfig.baseUrl}/update-password";
  static const String withdraws = "${ApiConfig.baseUrl}/withdraws";
  static const String loanApply = "${ApiConfig.baseUrl}/loans/apply";
  static const String loanRecordHistory = "${ApiConfig.baseUrl}/loans";
  static String payInstallment({String? id}) =>
      "${ApiConfig.baseUrl}/loans/installments/$id/pay";
  static const String phoneUpdate = "${ApiConfig.baseUrl}/phone-numbers/update";
  static const String eligibilityStore =
      "${ApiConfig.baseUrl}/eligibility/store";
  static const String eligibilityUpdate =
      "${ApiConfig.baseUrl}/eligibility/update";
  static const String signatureStore = "${ApiConfig.baseUrl}/signature/store";
  static const String signatureUpdate = "${ApiConfig.baseUrl}/signature/update";
}
