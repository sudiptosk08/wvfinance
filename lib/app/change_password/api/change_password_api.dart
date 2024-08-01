import 'package:loan_app/backend/api_method/api_method.dart';
import 'package:loan_app/backend/api_urls/api_urls.dart';
import 'package:loan_app/backend/error_message/error_message.dart';

class ChangePasswordApi {
  static Future<bool> changePasswordApi({
    required Map<String, dynamic> body,
  }) async {
    Map<String, dynamic>? response;
    try {
      response = await ApiMethod(isBasic: false).post(
        ApiUrls.changePassword,
        body: body,
        code: 200,
      );
      if (response != null) {
        return true;
      }
    } catch (e) {
      ErrorMessage.message(apiName: 'update password Info', error: e);
      return false;
    }
    return false;
  }
}
