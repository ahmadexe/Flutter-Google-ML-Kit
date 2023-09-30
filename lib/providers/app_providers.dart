import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';

class AppProvider extends ChangeNotifier {
  late final XFile? image;
  bool picked = false;
  late final InputImage inputImage;
  
  void pickImage() async {
    final imagePicker = ImagePicker();
    image = await imagePicker.pickImage(source: ImageSource.gallery);
    if (image == null) return;
    picked = true;
    inputImage = InputImage.fromFilePath(image!.path);
    notifyListeners();
  }

  void clearImage() {
    image = null;
    picked = false;
    notifyListeners();
  }
}
