import 'package:loan_app/app/auth/model/auth_model.dart';
import 'package:loan_app/app/auth/model/country_list_model.dart';
import 'package:loan_app/backend/api_method/api_method.dart';
import 'package:loan_app/backend/api_urls/api_urls.dart';
import 'package:loan_app/backend/error_message/error_message.dart';

class AuthApi {
  static Future<AuthModel?> registrationApi({
    required Map<String, dynamic> body,
  }) async {
    Map<String, dynamic>? response;
    try {
      response = await ApiMethod(
        isBasic: true,
      ).post(
        ApiUrls.signup,
        body: body,
      );
      if (response != null) {
        return AuthModel.fromJson(response);
      }
    } catch (e) {
      ErrorMessage.message(apiName: 'registration', error: e);
      return null;
    }
    return null;
  }

  static Future<AuthModel?> loginApi({
    required Map<String, dynamic> body,
  }) async {
    Map<String, dynamic>? response;
    try {
      response = await ApiMethod(isBasic: true).post(
        ApiUrls.login,
        body: body,
        code: 200,
      );
      if (response != null) {
        return AuthModel.fromJson(response);
      }
    } catch (e) {
      ErrorMessage.message(apiName: 'login', error: e);
      return null;
    }
    return null;
  }

  static Future<CountryListModel?> countryListApi() async {
    Map<String, dynamic>? response;
    try {
      response = await ApiMethod(isBasic: true).get(
        ApiUrls.countries,
        code: 200,
      );
      if (response != null) {
        return CountryListModel.fromJson(response);
      }
    } catch (e) {
      ErrorMessage.message(apiName: 'countries', error: e);
      return null;
    }
    return null;
  }
}
