part of 'face_recognition_bloc.dart';

class FaceRecognitionModel {
  static final _options = FaceDetectorOptions(
    enableContours: true,
    enableLandmarks: true,
  );
  final _faceDetector = FaceDetector(options: _options);

  Future<List<Face>> recognizeFaces(InputImage inputImage) async {
    try {
      final faces = await _faceDetector.processImage(inputImage);
      return faces;
    } catch (e) {
      debugPrint(e.toString());
      throw Exception('Error recognizing faces');
    }
  }
}
