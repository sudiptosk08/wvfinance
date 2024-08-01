import 'package:image_picker/image_picker.dart';

class CameraHelper {
  static final ImagePicker picker = ImagePicker();

  static Future<XFile?> pickImage({required ImageSource source}) async {
    return await picker.pickImage(source: source);
  }
}
