import 'package:loan_app/app/loan_choice/model/dashboard_model.dart';
import 'package:loan_app/backend/api_method/api_method.dart';
import 'package:loan_app/backend/api_urls/api_urls.dart';
import 'package:loan_app/backend/common_response/common_response.dart';
import 'package:loan_app/backend/error_message/error_message.dart';
import 'package:loan_app/backend/toast/toast_message.dart';

class LoanChoiceApi {
  static Future<bool> loanChoiceApi({
    required Map<String, dynamic> body,
  }) async {
    Map<String, dynamic>? response;
    try {
      response = await ApiMethod(isBasic: false).post(
        ApiUrls.loanApply,
        body: body,
        code: 201,
      );
      if (response != null) {
        CommonResponse res = CommonResponse.fromJson(response);
        ToastMessage.success(res.message);
        return true;
      }
    } catch (e) {
      ErrorMessage.message(apiName: 'loan choice api', error: e);
      return false;
    }
    return false;
  }

  static Future<Map<String, dynamic>?> getDashBoardInfo() async {
    Map<String, dynamic>? response;
    try {
      response = await ApiMethod(isBasic: false).get(
        ApiUrls.dashboardInfo,
        code: 200,
      );
      if (response != null) {
        return response;
      }
    } catch (e) {
      ErrorMessage.message(apiName: 'dash board info', error: e);
      return null;
    }
    return null;
  }
}
