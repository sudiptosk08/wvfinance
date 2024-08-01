import 'package:loan_app/backend/api_method/api_method.dart';
import 'package:loan_app/backend/api_urls/api_urls.dart';
import 'package:loan_app/backend/error_message/error_message.dart';

class IdCardVerificationApi {
  static Future<bool> saveIDCardInfoApi({
    required Map<String, String> body,
    required List<Map<String, dynamic>> multiKeyImagePathList,
  }) async {
    Map<String, dynamic>? response;
    try {
      response = await ApiMethod(isBasic: false).multipart(
        url: ApiUrls.nidStore,
        body: body,
        multiKeyImagePathList: multiKeyImagePathList,
        code: 201,
      );
      if (response != null) {
        return true;
      }
    } catch (e) {
      ErrorMessage.message(apiName: 'save ID Card Info', error: e);
      return false;
    }
    return false;
  }

  static Future<bool> updateIDCardInfoApi({
    required Map<String, String> body,
    required List<Map<String, dynamic>> multiKeyImagePathList,
  }) async {
    Map<String, dynamic>? response;
    try {
      response = await ApiMethod(isBasic: false).multipart(
        url: ApiUrls.nidUpdate,
        body: body,
        multiKeyImagePathList: multiKeyImagePathList,
        code: 200,
      );
      if (response != null) {
        return true;
      }
    } catch (e) {
      ErrorMessage.message(apiName: 'update ID Card Info', error: e);
      return false;
    }
    return false;
  }
}
