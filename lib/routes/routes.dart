import 'package:get/get.dart';
import 'package:loan_app/app/about_us/binding/about_us_binding.dart';
import 'package:loan_app/app/about_us/view/about_us_page.dart';
import 'package:loan_app/app/app_openning/binding/app_oppening_binding.dart';
import 'package:loan_app/app/app_openning/view/app_oppening_page.dart';
import 'package:loan_app/app/auth/binding/auth_binding.dart';
// import 'package:loan_app/app/auth/login/binding/login_binding.dart';
import 'package:loan_app/app/auth/login/view/login_page.dart';
// import 'package:loan_app/app/auth/registration/binding/registration_binding.dart';
import 'package:loan_app/app/auth/registration/view/registration_page.dart';
import 'package:loan_app/app/bank_account_validation/binding/bank_account_validation_binding.dart';
import 'package:loan_app/app/bank_account_validation/view/bank_account_validation_page.dart';
import 'package:loan_app/app/change_password/binding/change_password_binding.dart';
import 'package:loan_app/app/change_password/view/change_password_page.dart';
import 'package:loan_app/app/common_problems/binding/common_problems_binding.dart';
import 'package:loan_app/app/common_problems/view/common_problems_page.dart';
import 'package:loan_app/app/contact_validation/binding/contact_validation_binding.dart';
import 'package:loan_app/app/contact_validation/view/contact_validation_page.dart';
import 'package:loan_app/app/eligibility_validation/binding/eligibility_validation_binding.dart';
import 'package:loan_app/app/eligibility_validation/view/eligibility_validation_page.dart';
import 'package:loan_app/app/debt_records/binding/debt_record_binding.dart';
import 'package:loan_app/app/debt_records/view/debt_records_page.dart';
import 'package:loan_app/app/help/binding/help_binding.dart';
import 'package:loan_app/app/help/view/help_page.dart';
import 'package:loan_app/app/home/binding/home_binding.dart';
import 'package:loan_app/app/home/view/home_page.dart';
import 'package:loan_app/app/id_card_verification/binding/id_card_verification_binding.dart';
import 'package:loan_app/app/id_card_verification/view/id_card_verification_page.dart';
import 'package:loan_app/app/loan_choice/binding/loan_choice_binding.dart';
import 'package:loan_app/app/loan_choice/view/loan_choice_page.dart';
import 'package:loan_app/app/loan_records/binding/installment_record_binding.dart';
import 'package:loan_app/app/loan_records/binding/loan_record_binding.dart';
import 'package:loan_app/app/loan_records/page/installments_record_page.dart';
import 'package:loan_app/app/loan_records/view/loan_records_page.dart';
import 'package:loan_app/app/navigation/view/naviagation_page.dart';
import 'package:loan_app/app/personal_info/binding/personal_info_binding.dart';
import 'package:loan_app/app/personal_info/view/personal_info_page.dart';
import 'package:loan_app/app/profile/binding/profile_binding.dart';
import 'package:loan_app/app/profile/view/profile_page.dart';
import 'package:loan_app/app/recharge/binding/recharge_binding.dart';
import 'package:loan_app/app/recharge/view/recharge_page.dart';
import 'package:loan_app/app/setting/binding/setting_binding.dart';
import 'package:loan_app/app/setting/view/setting_page.dart';
import 'package:loan_app/app/signature_validation/binding/signature_validation_binding.dart';
import 'package:loan_app/app/signature_validation/view/signature_validation_page.dart';
import 'package:loan_app/app/wallet/binding/wallet_binding.dart';
import 'package:loan_app/app/wallet/view/wallet_page.dart';
import 'package:loan_app/app/web_view/view/web_view_page.dart';
import 'package:loan_app/app/withdraw/binding/withdraw_binding.dart';
import 'package:loan_app/app/withdraw/view/withdraw_page.dart';

class Routes {
  static const helpPage = '/helpPage';
  static const homePage = '/homePage';
  static const navigationPage = '/navigationPage';
  static const profilePage = '/profilePage';
  static const walletPage = '/walletPage';
  static const rechargePage = '/rechargePage';
  static const settingPage = '/settingPage';
  static const withdrawPage = '/withdrawPage';
  static const loanRecordsPage = '/loanRecordsPage';
  static const installmentRecordsPage = '/installmentRecordsPage';
  static const debtRecordsPage = '/debtRecordsPage';
  static const registrationPage = '/registrationPage';
  static const loginPage = '/loginPage';
  static const appOppeningPage = '/appOppeningPage';

  static const commonProblemsPage = '/commonProblemsPage';

  static const loanChoicePage = '/loanChoicePage';
  static const personalInfoPage = '/personalInfoPage';
  static const idCardVerificationPage = '/idCardVerificationPage';
  static const eligibilityValidationPage = '/eligibilityValidationPage';
  static const bankAccountValidationPage = '/bankAccountValidationPage';
  static const contactValidationPage = '/contactValidationPage';
  static const signatureValidationPage = '/signatureValidationPage';
  static const changePasswordPage = '/changePasswordPage';
  static const aboutUsPage = '/aboutUsPage';
  static const webViewPage = '/webViewPage';
  static var list = [
    GetPage(
      name: appOppeningPage,
      page: () => const AppOpenningPage(),
      binding: AppOpenningBinding(),
    ),
    GetPage(
      name: commonProblemsPage,
      page: () => const CommonProblemsPage(),
      binding: CommonProblemsBinding(),
    ),
    GetPage(
      name: aboutUsPage,
      page: () => const AboutUsPage(),
      binding: AboutUsBinding(),
    ),
    GetPage(
      name: loginPage,
      page: () => const LoginPage(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: registrationPage,
      page: () => const RegistrationPage(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: debtRecordsPage,
      page: () => const DebtRecordsPage(),
      binding: DebtRecordsBinding(),
    ),
    GetPage(
      name: loanRecordsPage,
      page: () => const LoanRecordsPage(),
      binding: LoanRecordsBinding(),
    ),
    GetPage(name: installmentRecordsPage, page: () => const InstallmentRecordsPage(), binding: InstallmentRecordsBinding(), arguments: "index"),
    GetPage(
      name: withdrawPage,
      page: () => const WithdrawPage(),
      binding: WithdrawBinding(),
    ),
    GetPage(
      name: signatureValidationPage,
      page: () => const SignatureValidationPage(),
      binding: SignatureValidationBinding(),
    ),
    GetPage(
      name: changePasswordPage,
      page: () => const ChangePasswordPage(),
      binding: ChangePasswordBinding(),
    ),
    GetPage(
      name: settingPage,
      page: () => const SettingPage(),
      binding: SettingBinding(),
    ),
    GetPage(
      name: rechargePage,
      page: () => const RechargePage(),
      binding: RechargeBinding(),
    ),
    GetPage(
      name: walletPage,
      page: () => const WalletPage(),
      binding: WalletBinding(),
    ),
    GetPage(
      name: webViewPage,
      page: () => const WebViewPage(),
      binding: WalletBinding(),
    ),
    GetPage(
      name: loanChoicePage,
      page: () => const LoanChoicePage(),
      binding: LoanChoiceBinding(),
    ),
    GetPage(
      name: personalInfoPage,
      page: () => const PersonalInfoPage(),
      binding: PersonalInfoBinding(),
    ),
    GetPage(
      name: idCardVerificationPage,
      page: () => const IDCardVerificationPage(),
      binding: IdCardVerificationBinding(),
    ),
    GetPage(
      name: eligibilityValidationPage,
      page: () => const EligibilityValidationPage(),
      binding: EligibilityValidationBinding(),
    ),
    GetPage(
      name: bankAccountValidationPage,
      page: () => const BankAccountValidationPage(),
      binding: BankAccountValidationBinding(),
    ),
    GetPage(
      name: contactValidationPage,
      page: () => const ContactValidationPage(),
      binding: ContactValidationBinding(),
    ),
    GetPage(
      name: helpPage,
      page: () => const HelpPage(),
      binding: HelpBinding(),
    ),
    GetPage(
      name: navigationPage,
      page: () => const NavigationPage(),
      binding: LoanChoiceBinding(),
    ),
    GetPage(
      name: profilePage,
      page: () => const ProfilePage(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: homePage,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
  ];
}
