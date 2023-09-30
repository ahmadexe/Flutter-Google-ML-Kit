import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AppProvider extends ChangeNotifier {
  late final XFile? image;
  bool picked = false;
  void pickImage() async {
    final imagePicker = ImagePicker();
    image = await imagePicker.pickImage(source: ImageSource.gallery);
    image != null ? picked = true : picked = false;
    notifyListeners();
  }

  void clearImage() {
    image = null;
    picked = false;
    notifyListeners();
  }
}