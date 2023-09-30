part of 'text_recognition_bloc.dart';

sealed class TextRecognitionEvent extends Equatable {
  const TextRecognitionEvent();

  @override
  List<Object> get props => [];
}

class RecognizeTextEvent extends TextRecognitionEvent {
  final InputImage inputImage;
  const RecognizeTextEvent({
    required this.inputImage,
  });
}

class ClearDataEvent extends TextRecognitionEvent {
  const ClearDataEvent();
}
