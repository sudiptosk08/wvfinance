import 'package:loan_app/backend/api_method/api_method.dart';
import 'package:loan_app/backend/api_urls/api_urls.dart';
import 'package:loan_app/backend/error_message/error_message.dart';

class BankAccountVerificationApi {
  static Future<bool> saveBankAccountInfoApi({
    required Map<String, dynamic> body,
  }) async {
    Map<String, dynamic>? response;
    try {
      response = await ApiMethod(isBasic: false).post(
        ApiUrls.bankStore,
        body: body,
        code: 201,
      );
      if (response != null) {
        return true;
      }
    } catch (e) {
      ErrorMessage.message(apiName: 'save Bank Account Info', error: e);
      return false;
    }
    return false;
  }

  static Future<bool> updateBankAccountInfoApi({
    required Map<String, dynamic> body,
  }) async {
    Map<String, dynamic>? response;
    try {
      response = await ApiMethod(isBasic: false).post(
        ApiUrls.bankUpdate,
        body: body,
        code: 201,
      );
      if (response != null) {
        return true;
      }
    } catch (e) {
      ErrorMessage.message(apiName: 'update Bank Account Info', error: e);
      return false;
    }
    return false;
  }
}
