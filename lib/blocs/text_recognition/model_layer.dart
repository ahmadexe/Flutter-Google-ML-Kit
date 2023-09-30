import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';

class TextRecognitionModel {
  static final textRecognizer =
      TextRecognizer(script: TextRecognitionScript.latin);

  static Future<String> recognizeText(InputImage inputImage) async {
    try {
      final recognisedText = await textRecognizer.processImage(inputImage);
      return recognisedText.text;
    } catch (e) {
      debugPrint(e.toString());
      throw Exception('Error recognizing text');
    }
  }
}
