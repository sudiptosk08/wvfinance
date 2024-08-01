import 'package:loan_app/backend/api_method/api_method.dart';
import 'package:loan_app/backend/api_urls/api_urls.dart';
import 'package:loan_app/backend/error_message/error_message.dart';

class ContactVerificationApi {
  static Future<bool> saveContactInfoApi({
    required Map<String, dynamic> body,
  }) async {
    Map<String, dynamic>? response;
    try {
      response = await ApiMethod(isBasic: false).post(
        ApiUrls.phoneStore,
        body: body,
        code: 201,
      );
      if (response != null) {
        return true;
      }
    } catch (e) {
      ErrorMessage.message(apiName: 'save Contact Info', error: e);
      return false;
    }
    return false;
  }
  static Future<bool> updateContactInfoApi({
    required Map<String, dynamic> body,
  }) async {
    Map<String, dynamic>? response;
    try {
      response = await ApiMethod(isBasic: false).post(
        ApiUrls.phoneUpdate,
        body: body,
        code: 201,
      );
      if (response != null) {
        return true;
      }
    } catch (e) {
      ErrorMessage.message(apiName: 'update Contact Info', error: e);
      return false;
    }
    return false;
  }
}
