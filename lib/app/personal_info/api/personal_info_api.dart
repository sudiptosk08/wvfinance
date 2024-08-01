import 'package:loan_app/app/personal_info/model/personal_info_model.dart';
import 'package:loan_app/backend/api_method/api_method.dart';
import 'package:loan_app/backend/api_urls/api_urls.dart';
import 'package:loan_app/backend/error_message/error_message.dart';

class PersonalInfoApi {
  static Future<PersonalInfoModel?> getPersonalInfo() async {
    Map<String, dynamic>? response;
    try {
      response = await ApiMethod(isBasic: false).get(
        ApiUrls.personalInfo,
        code: 200,
      );
      if (response != null) {
        return PersonalInfoModel.fromJson(response);
      }
    } catch (e) {
      ErrorMessage.message(apiName: 'personal info', error: e);
      return null;
    }
    return null;
  }
}
