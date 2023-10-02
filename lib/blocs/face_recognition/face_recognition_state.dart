part of 'face_recognition_bloc.dart';

sealed class FaceRecognitionState extends Equatable {
  final List<Face>? faces;
  final String? message;
  const FaceRecognitionState({this.faces, this.message});

  @override
  List<Object> get props => [];
}

final class FaceRecognitionInitial extends FaceRecognitionState {
  const FaceRecognitionInitial();
}

final class FaceRecognitionLoading extends FaceRecognitionState {
  const FaceRecognitionLoading();
}

final class FaceRecognitionSuccess extends FaceRecognitionState {
  const FaceRecognitionSuccess({required List<Face> faces})
      : super(faces: faces);
}

final class FaceRecognitionFailure extends FaceRecognitionState {
  const FaceRecognitionFailure({required String message})
      : super(message: message);
}
