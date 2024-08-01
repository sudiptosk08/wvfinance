import 'package:loan_app/backend/api_method/api_method.dart';
import 'package:loan_app/backend/api_urls/api_urls.dart';
import 'package:loan_app/backend/error_message/error_message.dart';

class EligibilityVerificationApi {
  static Future<bool> saveEligibilityApi({
    required Map<String, dynamic> body,
  }) async {
    Map<String, dynamic>? response;
    try {
      response = await ApiMethod(isBasic: false).post(
        ApiUrls.eligibilityStore,
        body: body,
        code: 201,
      );
      if (response != null) {
        return true;
      }
    } catch (e) {
      ErrorMessage.message(apiName: 'save Eligibility Info', error: e);
      return false;
    }
    return false;
  }

  static Future<bool> updateEligibilityApi({
    required Map<String, dynamic> body,
  }) async {
    Map<String, dynamic>? response;
    try {
      response = await ApiMethod(isBasic: false).post(
        ApiUrls.eligibilityUpdate,
        body: body,
        code: 201,
      );
      if (response != null) {
        return true;
      }
    } catch (e) {
      ErrorMessage.message(apiName: 'Update Eligibility Info', error: e);
      return false;
    }
    return false;
  }
}
