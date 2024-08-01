import 'package:get_storage/get_storage.dart';
import 'package:loan_app/app/app_openning/model/app_settings_model.dart';
import 'package:loan_app/local_storage/storage_key.dart';
import 'package:loan_app/utils/helpers/logger.dart';
import 'package:loan_app/utils/lang/app_lang.dart';
import 'package:logger/logger.dart';

final Logger log = logger(LocalStorage);

class LocalStorage {
  static Future<void> saveAppSetting({required AppSettingModel data}) async {
    final box = GetStorage();
    await box.remove(StorageKey.appSettingData);
    await box.write(StorageKey.appSettingData, data);
    _message(
      'Write',
      'App Setting Data => ${box.hasData(StorageKey.appSettingData)}',
    );
  }

  static Future<String> getAppLanguage() async {
    final box = GetStorage();
    _message(
      'read',
      'App Language => ${box.hasData(StorageKey.appLang)}',
    );
    if (box.hasData(StorageKey.appLang)) {
      return box.read(StorageKey.appLang);
    }
    return 'bn';
  }

  static Future<void> saveAppLanguage({required String lang}) async {
    final box = GetStorage();
    await box.remove(StorageKey.appLang);
    await box.write(StorageKey.appLang, lang);
    getAppLanglist();
    _message(
      'Write',
      'App Language => ${box.hasData(StorageKey.appLang)}',
    );
  }

  static Future getAppLanglist() async {
    final box = GetStorage();
    _message(
      'read',
      'App Language List => ${box.hasData(StorageKey.appLangList)}',
    );
    appLang = await box.read(StorageKey.appLangList);
  }

  static Future<void> saveAppLanglist({required Lang lang}) async {
    final box = GetStorage();
    await box.remove(StorageKey.appLangList);
    await box.write(StorageKey.appLangList, lang);
    getAppLanglist();
    _message(
      'Write',
      'App Language List => ${box.hasData(StorageKey.appLangList)}',
    );
  }

  static Future<AppSettingModel?> getAppSetting() async {
    final box = GetStorage();
    _message(
      'read',
      'App Setting Data => ${box.hasData(StorageKey.appSettingData)}',
    );
    if (box.hasData(StorageKey.appSettingData)) {
      return box.read(StorageKey.appSettingData);
    }
    return null;
  }

  static Future<void> saveApiToken({required String token}) async {
    final box = GetStorage();
    await box.write(StorageKey.apiToken, token);
    _message(
      'Write',
      'Api key => ${box.read(StorageKey.apiToken) ?? 'not saved'}',
    );
  }

  static Future<void> saveUserName({required String userName}) async {
    final box = GetStorage();
    await box.write(StorageKey.userNameKey, userName.isNotEmpty ? userName : null);
    _message(
      'Write',
      'Username => ${box.read(StorageKey.userNameKey) ?? 'not saved'}',
    );
  }

  static Future<void> saveUserNumber({required String userNumber}) async {
    final box = GetStorage();
    await box.write(StorageKey.userNumberKey, userNumber);
    _message(
      'Write',
      'Number => ${box.read(StorageKey.userNumberKey) ?? 'not saved'}',
    );
  }

  static Future<void> saveUserID({required String userID}) async {
    final box = GetStorage();
    await box.write(StorageKey.userIDkey, userID);
    _message(
      'Write',
      'Id => ${box.read(StorageKey.userIDkey) ?? 'not saved'}',
    );
  }

  static Future<void> saveUserImage({required String userImage}) async {
    final box = GetStorage();
    await box.write(StorageKey.userImage, userImage);
    _message(
      'Write',
      'Image => ${box.read(StorageKey.userImage) ?? 'not saved'}',
    );
  }

  static Future<void> saveOnBoardDone({required bool isOnBoardDone}) async {
    final box = GetStorage();
    await box.write(StorageKey.onBoardDoneKey, isOnBoardDone);
    _message(
      'Write',
      "On board done saved in local storage, value: ${box.read(StorageKey.onBoardDoneKey) ?? false}",
    );
  }

  static String? getApiToken() {
    String? data = GetStorage().read(StorageKey.apiToken);
    _message(
      'Read',
      'Api Token: ${data ?? "##Token is null###"}',
    );
    return data;
  }

  static String? getUserName() {
    String? data = GetStorage().read(StorageKey.userNameKey);
    _message(
      'Read',
      'Username: ${data ?? "##Username is null###"}',
    );
    return data;
  }

  static String getUserNumber() {
    String? data = GetStorage().read(StorageKey.userNumberKey);
    _message(
      'Read',
      'Number: ${data ?? "##Number is null###"}',
    );
    return data ?? "Null";
  }

  static String getUserID() {
    String? data = GetStorage().read(StorageKey.userIDkey);
    _message(
      'Read',
      'Id: ${data ?? "##Number is null###"}',
    );
    return data ?? "Null";
  }

  static String getUserImage() {
    String? data = GetStorage().read(StorageKey.userImage);
    _message(
      'Read',
      'Iamge: ${data ?? "##Number is null###"}',
    );
    return data ?? "Null";
  }

  static bool isOnBoardDone() {
    bool data = GetStorage().read(StorageKey.onBoardDoneKey) ?? false;
    _message(
      'Read',
      'Is On board done => $data',
    );
    return data;
  }

  static Future<void> logout() async {
    await GetStorage().remove(StorageKey.apiToken);
    await GetStorage().remove(StorageKey.userNameKey);
    await GetStorage().remove(StorageKey.userNumberKey);

    _message('Removed', 'Api Key Removed');
  }

  static _message(String status, String message) {
    log.i('|📍📍📍|---- [[ $status ]] method details start ----|📍📍📍|');

    log.i(message);

    log.i('|📍📍📍|---- [[ $status ]] method details ended ----|📍📍📍|');
  }
}
