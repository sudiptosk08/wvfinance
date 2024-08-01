import 'package:loan_app/app/app_openning/model/app_settings_model.dart';
import 'package:loan_app/backend/api_method/api_method.dart';
import 'package:loan_app/backend/api_urls/api_urls.dart';
import 'package:loan_app/backend/error_message/error_message.dart';

class AppSettingApi {
  static Future<AppSettingModel?> getAppSetting() async {
    Map<String, dynamic>? response;
    try {
      response = await ApiMethod(isBasic: true).get(
        ApiUrls.appSetting,
        code: 200,
      );
      if (response != null) {
        return AppSettingModel.fromJson(response);
      }
    } catch (e) {
      ErrorMessage.message(apiName: 'App Setting', error: e);
      return null;
    }
    return null;
  }
}
