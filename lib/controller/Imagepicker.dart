import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImagepickerController extends GetxController {
  final ImagePicker picker = ImagePicker();
  Future<String> PickImage() async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    print(image);
    if (image != null) {
      print(image.path);
      return image.path;
    }
    return "";
  }
}
