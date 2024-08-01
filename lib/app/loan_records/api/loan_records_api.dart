import 'package:loan_app/app/loan_records/model/loan_records_history_model.dart';
import 'package:loan_app/backend/api_method/api_method.dart';
import 'package:loan_app/backend/api_urls/api_urls.dart';
import 'package:loan_app/backend/error_message/error_message.dart';

class LoanRecordHistoryApi {
  static Future<LoanRecordHistoryModel?> loanRecordHistoryApi() async {
    Map<String, dynamic>? response;
    try {
      response = await ApiMethod(isBasic: false).get(
        ApiUrls.loanRecordHistory,
        code: 200,
      );
      if (response != null) {
        return LoanRecordHistoryModel.fromJson(response);
      }
    } catch (e) {
      ErrorMessage.message(apiName: 'loan Records History', error: e);
      return null;
    }
    return null;
  }

  static Future<bool> payInstallmentApi({
    required id,
  }) async {
    Map<String, dynamic>? response;
    try {
      response = await ApiMethod(isBasic: false).post(
        ApiUrls.payInstallment(id: id),
        code: 200,
      );
      if (response != null) {
        
        return true;
      }
    } catch (e) {
      ErrorMessage.message(apiName: 'pay installment ', error: e);
      return false;
    }
    return false;
  }
}
