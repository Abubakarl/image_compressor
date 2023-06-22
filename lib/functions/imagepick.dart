import 'package:image_picker/image_picker.dart';

Future<XFile?> PickImage(ImageSource source) async {
  ImagePicker imagePicker = ImagePicker();
  return await imagePicker.pickImage(source: source);
}
