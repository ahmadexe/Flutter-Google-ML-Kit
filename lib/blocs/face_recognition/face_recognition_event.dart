part of 'face_recognition_bloc.dart';

sealed class FaceRecognitionEvent extends Equatable {
  const FaceRecognitionEvent();

  @override
  List<Object> get props => [];
}

final class RecognizeFaceEvent extends FaceRecognitionEvent {
  final InputImage inputImage;

  const RecognizeFaceEvent(this.inputImage);

  @override
  List<Object> get props => [inputImage];
}
