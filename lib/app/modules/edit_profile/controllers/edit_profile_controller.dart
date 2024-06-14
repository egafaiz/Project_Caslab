import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileController extends GetxController {
  var name = ''.obs;
  var email = ''.obs;
  var profileImage = ''.obs;

  void editProfile(String newName, String newEmail, String newProfileImage) {
    name.value = newName;
    email.value = newEmail;
    profileImage.value = newProfileImage;
  }

  void pickImage(ImageSource source) async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: source);
    if (image != null) {
      profileImage.value = image.path;
    }
  }
}
