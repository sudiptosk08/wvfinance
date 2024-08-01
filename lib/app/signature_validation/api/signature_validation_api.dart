import 'package:loan_app/backend/api_method/api_method.dart';
import 'package:loan_app/backend/api_urls/api_urls.dart';
import 'package:loan_app/backend/error_message/error_message.dart';

class SignatureVerificationApi {
  static Future<bool> saveSignatureApi({
    required String filePath,
  }) async {
    Map<String, dynamic>? response;
    try {
      response = await ApiMethod(isBasic: false).multipart(
        url: ApiUrls.signatureStore,
        fileName: "image",
        filePath: filePath,
        code: 201,
      );
      if (response != null) {
        return true;
      }
    } catch (e) {
      ErrorMessage.message(apiName: 'save Signature', error: e);
      return false;
    }
    return false;
  }

  static Future<bool> updateSignatureApi({
    required String filePath,
  }) async {
    Map<String, dynamic>? response;
    try {
      response = await ApiMethod(isBasic: false).multipart(
        url: ApiUrls.signatureUpdate,
        fileName: "image",
        filePath: filePath,
        code: 201,
      );
      if (response != null) {
        return true;
      }
    } catch (e) {
      ErrorMessage.message(apiName: 'update Signature', error: e);
      return false;
    }
    return false;
  }
}
